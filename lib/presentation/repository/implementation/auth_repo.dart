import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/constants/api_constant.dart';
import 'package:gpspro/core/constants/appwrite.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/core/utils/utils.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/domain/models/user_session.dart';
import 'package:gpspro/presentation/repository/i_auth_repo.dart';
import 'package:gpspro/presentation/repository/response_models/login_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImp implements AuthRepo {
  final RemoteSource remoteSource;
  const AuthRepoImp({required this.remoteSource});

  static const resetTokenBaseUrl = '${ApiConstant.baseUrl}/auth';
  static const webTrackonBaseUrl = 'https://web.trackongps.com';

  bool _isSuccess(int? statusCode) => statusCode != null && statusCode >= 200 && statusCode < 300;

  /// Common handler for API responses
  T _handleResponse<T>(Response response, {T Function(dynamic data)? onSuccess}) {
    if (_isSuccess(response.statusCode)) {
      return onSuccess != null ? onSuccess(response.data) : response.data as T;
    }
    final message = response.data?['message']?.toString() ?? 'Unexpected error: ${response.statusCode}';
    throw AppException(message: message);
  }

  @override
  Future<LoginResponse> register(
      {required String fullName, required String email, required String phone, required String password}) async {
    try {
      final response = await remoteSource.post(
        'api/users',
        data: {'name': fullName, 'email': email, 'phone': phone, 'password': password},
      );

      return _handleResponse<LoginResponse>(response, onSuccess: (data) {
        final user = User.fromJson(data);
        final basicAuth = 'Basic ${base64.encode(utf8.encode('$email:$password'))}';
        return LoginResponse(
          userSession: UserSession(
            userId: user.id,
            accessToken: basicAuth,
            cookie: data['cookie'],
            username: email,
            password: password,
          ),
          user: user,
        );
      });
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await remoteSource.post(
        '$resetTokenBaseUrl/login',
        data: {'identifier': username, 'password': password},
        options: Options(
          validateStatus: (status) => status != null && status >= 200 && status < 500,
        ),
      );

      final data = response.data is String ? json.decode(response.data) : response.data;
      log('Login Response Data: $data');

      if (_isSuccess(response.statusCode) && data != null) {
        final user = User.fromJson(data);
        final basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';

        return LoginResponse(
          userSession: UserSession(
            userId: user.id,
            accessToken: basicAuth,
            cookie: data['cookie'] ?? data['sessionToken'],
            username: username,
            password: password,
          ),
          user: user,
        );
      } else {
        final message = data['message']?.toString() ?? 'Login failed: ${response.statusCode}';
        throw AppException(message: message);
      }
    } on DioException catch (e, s) {
      final data = e.response?.data;
      final errorMessage = (data is Map && data['message'] != null)
          ? data['message'].toString()
          : 'Request failed with status code ${e.response?.statusCode ?? 'unknown'}';
      log('DioException during login: $errorMessage', stackTrace: s);
      throw AppException(message: errorMessage);
    } catch (e, s) {
      log('Unexpected error during login: $e', stackTrace: s);
      throw AppException(message: '$e');
    }
  }

  @override
  Future<Map<String, dynamic>> getMyProfile() async {
    final userSession = locator.get<AuthCubit>().userSession;
    if (userSession == null) {
      throw const AppException(message: 'User token does not exist');
    }

    final response = await remoteSource.get(
      '$webTrackonBaseUrl/api/session',
    );

    return _handleResponse<Map<String, dynamic>>(response, onSuccess: (data) {
      if (data is! Map<String, dynamic>) {
        throw const AppException(message: 'Unexpected response format');
      }
      return data;
    });
  }

  @override
  Future<Map<String, dynamic>> uploadProfilePic(File image) async {
    try {
      final authCubit = locator.get<AuthCubit>();
      final userSession = authCubit.userSession;
      final user = authCubit.user;

      if (userSession == null || user == null) {
        throw const AppException(message: 'User or token does not exist');
      }

      final profileResponse = await remoteSource.get(
        '$webTrackonBaseUrl/api/session',
      );

      final currentData = _handleResponse<Map<String, dynamic>>(profileResponse, onSuccess: (data) {
        if (data is! Map<String, dynamic>) {
          throw const AppException(message: 'Unexpected response format');
        }
        return data;
      });

      final formData = FormData.fromMap({
        'fileId': generateHexId(36),
        'file': await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
      });

      final uploadResponse = await remoteSource.post(
        '${Appwrite.appwriteUrl}${Appwrite.appwriteBucketId}/files',
        data: formData,
        options: Options(headers: {'x-appwrite-project': Appwrite.appwriteProjectId}),
      );

      if (uploadResponse.statusCode != 201) {
        throw AppException(message: uploadResponse.data?['message'] ?? 'Failed to upload to server');
      }

      final updatedData = {
        ...currentData,
        'attributes': {
          ...currentData['attributes'],
          'profilePicId': uploadResponse.data['\$id'],
        },
      };

      final updateResponse = await remoteSource.put(
        '$webTrackonBaseUrl/api/users/${user.id}',
        data: updatedData,
      );

      return _handleResponse<Map<String, dynamic>>(updateResponse);
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException(message: 'Failed to upload profile picture');
    }
  }

  @override
  Future<void> logout() async => _execute(() => remoteSource.delete('api/session',
      options: Options(headers: {'Content-Type': 'application/x-www-form-urlencoded'})));

  @override
  Future<User> updateUser(User user) async => _execute(() async {
        final data = user.toJson()..removeWhere((k, v) => v == null);
        final response = await remoteSource.put('api/users/${user.id}', data: data);
        return _handleResponse<User>(response, onSuccess: (data) => User.fromJson(data));
      });

  @override
  Future<Either<String, String>> deleteAccount(int userId) async {
    try {
      final response = await remoteSource.delete('api/users/$userId');
      _handleResponse(response);
      return const Right('Account deleted successfully');
    } on AppException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

  @override
  Future<void> completeSignup({required String token, required String fullname, required String password}) async {
    final response = await remoteSource.post(
      '$resetTokenBaseUrl/registration/complete',
      data: {'token': token, 'fullName': fullname, 'password': password},
      options: Options(validateStatus: (s) => s != null && s < 500, headers: {'Content-Type': 'application/json'}),
    );

    _handleResponse(response);
  }

  @override
  Future<String> initiateSignup({required String emailOrPhone}) async {
    final isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(emailOrPhone);

    final response = await remoteSource.post(
      '$resetTokenBaseUrl/registration/init',
      data: isEmail ? {'email': emailOrPhone} : {'phone': emailOrPhone},
      options: Options(validateStatus: (s) => s != null && s < 500, headers: {'Content-Type': 'application/json'}),
    );

    return _handleResponse<String>(response, onSuccess: (data) => data['message'] ?? 'OTP sent successfully');
  }

  @override
  Future<void> requestToken({required String emailOrPhone}) async {
    final isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(emailOrPhone);

    final response = await remoteSource.post(
      '$resetTokenBaseUrl/account/reset',
      data: isEmail ? {'email': emailOrPhone} : {'phone': emailOrPhone},
      options: Options(validateStatus: (s) => s != null && s < 500, headers: {'Content-Type': 'application/json'}),
    );

    _handleResponse(response);
  }

  @override
  Future<void> resetPassword({required String token, required String newPassword}) async {
    final response = await remoteSource.post(
      '$resetTokenBaseUrl/password/reset',
      data: {'token': token, 'newPassword': newPassword},
      options: Options(validateStatus: (s) => s != null && s < 500, headers: {'Content-Type': 'application/json'}),
    );

    _handleResponse(response);
  }

  @override
  Future<String> verifyToken({required String otp, required String emailOrPhone, required String identifier}) async {
    final response = await remoteSource.post(
      '$resetTokenBaseUrl/otp/verify',
      data: {'otp': otp, 'identifier': emailOrPhone, 'type': identifier},
      options: Options(validateStatus: (s) => s != null && s < 500, headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 201) {
      final decodedData = response.data is String ? json.decode(response.data) : response.data;
      final token = decodedData['token'] as String?;
      if (token?.isNotEmpty ?? false) return token!;
      throw const AppException(message: 'Token is missing or empty');
    }

    final message = response.data?['message']?.toString() ?? 'Failed to verify token';
    throw AppException(message: message);
  }

  @override
  Future<Either<String, String>> confirmPassword({required String confirmPassword}) async {
    try {
      final response = await remoteSource.post(
        'https://api.trackongps.com/api2/security/verify-password',
        data: jsonEncode({'password': confirmPassword}),
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );
      log('Confirm Password Response: ${response.data}');
      if (response.statusCode != 200) {
        final errorMessage = response.data?['message'] ?? 'Failed to verify password';
        return left(errorMessage);
      }

      return right('Password confirmed successfully');
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      return left('Something went wrong');
    }
  }

  Future<T> _execute<T>(Future<T> Function() callback) async {
    try {
      return await callback();
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }
}
