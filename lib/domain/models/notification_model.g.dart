// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: (json['id'] as num).toInt(),
      attributes: json['attributes'] as Map<String, dynamic>,
      calendarId: (json['calendarId'] as num).toInt(),
      always: json['always'] as bool,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      notificators: json['notificators'] as String,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'calendarId': instance.calendarId,
      'always': instance.always,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'notificators': instance.notificators,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.geofenceExit: 'geofenceExit',
  NotificationType.geofenceEnter: 'geofenceEnter',
  NotificationType.geofenceEntered: 'geofenceEntered',
  NotificationType.ignitionOff: 'ignitionOff',
  NotificationType.ignitionOn: 'ignitionOn',
  NotificationType.commandResult: 'commandResult',
  NotificationType.alarm: 'alarm',
  NotificationType.deviceOverspeed: 'deviceOverspeed',
  NotificationType.deviceOnline: 'deviceOnline',
  NotificationType.deviceUnknown: 'deviceUnknown',
  NotificationType.deviceOffline: 'deviceOffline',
  NotificationType.deviceInactive: 'deviceInactive',
  NotificationType.queuedCommandSent: 'queuedCommandSent',
  NotificationType.deviceMoving: 'deviceMoving',
  NotificationType.deviceStopped: 'deviceStopped',
  NotificationType.deviceFuelDrop: 'deviceFuelDrop',
  NotificationType.deviceFuelIncrease: 'deviceFuelIncrease',
  NotificationType.maintenance: 'maintenance',
  NotificationType.textMessage: 'textMessage',
  NotificationType.driverChanged: 'driverChanged',
  NotificationType.media: 'media',
  NotificationType.unknown: 'unknown',
};
