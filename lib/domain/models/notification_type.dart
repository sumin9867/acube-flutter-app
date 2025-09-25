import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_type.freezed.dart';
part 'notification_type.g.dart';

@freezed
class NotificationTypeModel with _$NotificationTypeModel {
  const factory NotificationTypeModel({
    @JsonKey(unknownEnumValue: NotificationType.unknown)
    required NotificationType type,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    bool? enabled,
  }) = _NotificationTypeModel;

  factory NotificationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationTypeModelFromJson(json);
}

enum NotificationType {
  @JsonValue('geofenceExit')
  geofenceExit,
  @JsonValue('geofenceEnter')
  geofenceEnter,
  @JsonValue('geofenceEntered')
  geofenceEntered,
  @JsonValue('ignitionOff')
  ignitionOff,
  @JsonValue('ignitionOn')
  ignitionOn,
  @JsonValue('commandResult')
  commandResult,
  @JsonValue('alarm')
  alarm,
  @JsonValue('deviceOverspeed')
  deviceOverspeed,
  @JsonValue('deviceOnline')
  deviceOnline, // Add this
  @JsonValue('deviceUnknown')
  deviceUnknown, // Add this
  @JsonValue('deviceOffline')
  deviceOffline,
  @JsonValue('deviceInactive')
  deviceInactive,
  @JsonValue('queuedCommandSent')
  queuedCommandSent, // Add this
  @JsonValue('deviceMoving')
  deviceMoving,
  @JsonValue('deviceStopped')
  deviceStopped,
  @JsonValue('deviceFuelDrop')
  deviceFuelDrop,
  @JsonValue('deviceFuelIncrease')
  deviceFuelIncrease,
  @JsonValue('maintenance')
  maintenance,
  @JsonValue('textMessage')
  textMessage,
  @JsonValue('driverChanged')
  driverChanged,
  @JsonValue('media')
  media,
  unknown, // Fallback
}
