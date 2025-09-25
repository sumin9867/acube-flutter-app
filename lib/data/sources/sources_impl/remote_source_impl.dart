// remote_source_impl.dart
// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:gpspro/app_config/app_config.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/exceptions/all_dio_exceptions.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/data/auth_storage.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RemoteSource)
class RemoteSourceImpl implements RemoteSource {
  final Dio dio;
  final AuthStorage authStorage;
  final Connectivity connectivity;

  RemoteSourceImpl({
    required this.dio,
    required this.authStorage,
    required this.connectivity,
  }) {
    _enable();
  }

  final BaseOptions options = BaseOptions(
    connectTimeout: const Duration(seconds: 180),
    receiveTimeout: const Duration(seconds: 180),
  );

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams = const {},
    Options? options,
  }) async {
    try {
      final response = await dio.get<T>(
        url,
        queryParameters: queryParams,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw handleServerException(e);
    }
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Options? opt = options;
      if (url.contains('session')) {
        opt = (opt ?? Options()).copyWith(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        );
      }
      final Response<T> response = await dio.post<T>(
        url,
        queryParameters: queryParameters,
        data: data,
        options: opt,
      );

      return response;
    } on DioException catch (e) {
      throw handleServerException(e);
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    Object? data = const {},
    Options? options,
  }) async {
    try {
      final response = await dio.delete<T>(
        url,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw handleServerException(e);
    }
  }

  @override
  Future<Response<T>> patch<T>(
    String url, {
    Object? data = const {},
    Options? options,
  }) async {
    try {
      final response = await dio.patch<T>(
        url,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw handleServerException(e);
    }
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    Object? data = const {},
    Options? options,
  }) async {
    try {
      final response = await dio.put<T>(
        url,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw handleServerException(e);
    }
  }

  void _enable() {
    dio.interceptors.clear();
    dio.options
      ..connectTimeout = options.connectTimeout
      ..receiveTimeout = options.receiveTimeout;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOption, handler) async {
          final connection = await connectivity.checkConnectivity();
          if (connection == ConnectivityResult.none) {
            handler.reject(DioException(requestOptions: requestOption, error: NoInternetException));
          } else {
            final appConfig = locator.get<AppConfig>();
            final authCubit = locator.get<AuthCubit>();
            final cookie = authCubit.userSession?.cookie ?? '';
            requestOption.baseUrl = appConfig.configModel.baseUrl;

            requestOption.headers['Accept'] = 'application/json';
            requestOption.headers['Cookie'] = cookie;
            handler.next(requestOption);
          }
        },
        onResponse: (response, handler) {
          if (response.headers.map.containsKey('set-cookie')) {
            final rawCookie = response.headers.map['set-cookie']!.first;
            final index = rawCookie.indexOf(';');
            final cookie = (index == -1) ? rawCookie : rawCookie.substring(0, index);
            if (response.data is Map<String, dynamic>) {
              response.data['cookie'] = cookie;
            }
          }
          if (response.data is Map<String, dynamic>) {
            final data = response.data as Map<String, dynamic>;
            if (data.containsKey('success') && data['success'] == 'Failed') {
              handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  error: AppException(
                    statusCode: response.statusCode,
                    message: 'Contact Developer for support',
                  ),
                ),
              );
            }
          }
          handler.next(response);
        },
        onError: (error, handler) async {
          handler.next(error);
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
}
