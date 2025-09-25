import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:gpspro/domain/models/notification_model.dart';
import 'package:gpspro/domain/models/notification_type.dart';
import 'package:gpspro/presentation/repository/i_notification_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationRepo)
class NotificationRepoImp implements NotificationRepo {
  final RemoteSource remoteSource;

  const NotificationRepoImp({
    required this.remoteSource,
  });
  @override
  Future<List<NotificationTypeModel>> getNotificationTypes() async {
    try {
      final response = await remoteSource.get(
        '/api/notifications/types',
      );
      final listMap = response.data as List<dynamic>;
      return List<NotificationTypeModel>.generate(
        listMap.length,
        (index) => NotificationTypeModel.fromJson(listMap[index]),
      );
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await remoteSource.get(
        '/api/notifications',
      );
      final listMap = response.data as List<dynamic>;
      return List<NotificationModel>.generate(
        listMap.length,
        (index) => NotificationModel.fromJson(listMap[index]),
      );
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<NotificationModel> addNotifications({required NotificationModel notification}) async {
    /*  headers['Content-Type'] = 'application/json';
        headers['charset'] = 'utf-8';
     */
    try {
      final response = await remoteSource.post(
        '/api/notifications',
        data: notification.toJson(),
      );
      log('ENABLED');

      return NotificationModel.fromJson(response.data);
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<void> deleteNotifications({required String id}) async {
    //     headers['content-type'] = 'application/json; charset=utf-8';
    try {
      await remoteSource.delete(
        '/api/notifications/$id',
      );
      log('REMOVED $id');
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<Either<String, String>> updateNotifications({
    required String notType,
    required bool isOn,
  }) async {
    final data = {'type': notType, 'isOn': isOn};
    final userSession = locator.get<AuthCubit>().userSession;
    if (userSession == null) {
      return const Left('No user session available');
    }
    final cookie = userSession.cookie;

    if (cookie == null) return const Left('Cookie not found');

    final headers = {'Cookie': cookie};

    try {
      final response = await Dio().put(
        '$baseUrl/settings',
        data: data,
        options: Options(
          headers: headers,
          responseType: ResponseType.json,
        ),
      );

      if (response.statusCode == 200) {
        return const Right('Notification updated');
      } else {
        final msg = (response.data is Map<String, dynamic>)
            ? response.data['message']?.toString() ?? 'Unknown error'
            : 'Invalid error format';
        return Left('Request failed: $msg');
      }
    } on DioException catch (dioError) {
      final status = dioError.response?.statusCode;
      final msg = dioError.response?.data is Map<String, dynamic>
          ? dioError.response?.data['message']?.toString() ?? 'Unknown Dio error'
          : dioError.message ?? 'Unhandled Dio error';
      AppLogger.error(dioError, stackTrace: dioError.stackTrace);
      return Left('[$status] $msg');
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      return const Left('Unexpected error');
    }
  }

  @override
  Future<List<Map<String, bool>>> fetchNotifications() async {
    try {
      final userSession = locator.get<AuthCubit>().userSession;
      if (userSession == null) {
        throw Exception('No user session available for fetching notifications');
      }
      final cookie = userSession.cookie;

      final Map<String, dynamic> headers = {
        'Cookie': cookie,
      };

      final response = await remoteSource.get(
        '$baseUrl/settings',
        options: Options(
          headers: headers,
          responseType: ResponseType.json,
        ),
      );

      if (response.data is Map<String, dynamic>) {
        return (response.data as Map<String, dynamic>)
            .map((key, value) => MapEntry(key, value as bool))
            .entries
            .map((entry) => {entry.key: entry.value})
            .toList();
      } else {
        throw const AppException(message: 'Unexpected response format: Expected a Map<String, bool>');
      }
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  final baseUrl = 'https://api.trackongps.com/api2/notifications';
}

const getDevicesEndPoint = 'api/devices';
