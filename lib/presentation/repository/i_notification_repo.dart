import 'package:dartz/dartz.dart';
import 'package:gpspro/domain/models/notification_model.dart';
import 'package:gpspro/domain/models/notification_type.dart';

abstract class NotificationRepo {
  Future<List<NotificationTypeModel>> getNotificationTypes();
  Future<List<NotificationModel>> getNotifications();
  Future<NotificationModel> addNotifications({required NotificationModel notification});
  Future<void> deleteNotifications({required String id});
  Future<Either<String, String>> updateNotifications({required String notType, required bool isOn});
  Future<List<Map<String, bool>>> fetchNotifications();
}
