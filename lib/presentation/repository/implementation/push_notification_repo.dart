import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/domain/models/user_session.dart';
import 'package:gpspro/presentation/repository/i_push_notification_repo.dart';

class PushNotificationRepo implements IPushNotificationRepo {
  final Dio _dio;

  PushNotificationRepo({Dio? dio}) : _dio = dio ?? Dio();

  final baseUrl = 'https://api.trackongps.com/api2/notifications';

  @override
  Future<bool> saveFcmToken(User user, UserSession session, String token) async {
    try {
      final cookie = session.cookie;

      if (cookie == null) {
        throw const AppException(message: 'No cookie found');
      }

      final url = '$baseUrl/tokens';

      final Map<String, dynamic> headers = {
        'Cookie': cookie,
      };

      final Response response = await _dio.put(
        url,
        data: {'token': token},
        options: Options(
          headers: headers,
          responseType: ResponseType.json,
        ),
      );

      log('Raw Response: ${response.data}');
      log('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        throw const AppException(message: 'Unauthorized request');
      } else if (response.statusCode == 400) {
        throw const AppException(message: 'No token provided');
      } else if (response.statusCode == 302) {
        throw const AppException(message: 'Token already exists');
      } else {
        throw AppException(message: 'Failed to save token. Status code: ${response.statusCode}');
      }
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<bool> removeFcmToken(User user, UserSession session, String token) async {
    try {
      final cookie = session.cookie;

      if (cookie == null) {
        throw const AppException(message: 'No cookie found');
      }

      final url = '$baseUrl/tokens';

      final Map<String, dynamic> headers = {
        'Cookie': cookie,
      };

      final Response response = await _dio.delete(
        url,
        data: {'token': token},
        options: Options(
          headers: headers,
          responseType: ResponseType.json,
        ),
      );

      log('Raw Response: ${response.data}');
      log('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        throw const AppException(message: 'Unauthorized request');
      } else if (response.statusCode == 400) {
        throw const AppException(message: 'No token provided');
      } else if (response.statusCode == 404) {
        throw const AppException(message: 'Token already exists');
      } else {
        throw AppException(message: 'Failed to remove token. Status code: ${response.statusCode}');
      }
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }
}
