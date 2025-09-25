import 'package:dio/dio.dart';

abstract class RemoteSource {
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
  });

  Future<Response<T>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> delete<T>(
    String url, {
    Object? data,
    Options? options,
  });

  Future<Response<T>> patch<T>(
    String url, {
    Object? data,
    Options? options,
  });

  Future<Response<T>> put<T>(
    String url, {
    Object? data,
    Options? options,
  });
}
