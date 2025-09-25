import 'package:dio/dio.dart';
import 'package:gpspro/data/sources/remote_source.dart';

class DioRemoteSource implements RemoteSource {
  final Dio dio;

  DioRemoteSource(this.dio);

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) {
    return dio.get<T>(url, queryParameters: queryParams, options: options);
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.post<T>(url, data: data, queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    Object? data,
    Options? options,
  }) {
    return dio.delete<T>(url, data: data, options: options);
  }

  @override
  Future<Response<T>> patch<T>(
    String url, {
    Object? data,
    Options? options,
  }) {
    return dio.patch<T>(url, data: data, options: options);
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    Object? data,
    Options? options,
  }) {
    return dio.put<T>(url, data: data, options: options);
  }
}
