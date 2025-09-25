import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/notification_type.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required Map<String, dynamic> attributes,
    required int calendarId,
    required bool always,
    required NotificationType type,
    required String notificators,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
