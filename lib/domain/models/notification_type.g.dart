// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTypeModelImpl _$$NotificationTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTypeModelImpl(
      type: $enumDecode(_$NotificationTypeEnumMap, json['type'],
          unknownValue: NotificationType.unknown),
    );

Map<String, dynamic> _$$NotificationTypeModelImplToJson(
        _$NotificationTypeModelImpl instance) =>
    <String, dynamic>{
      'type': _$NotificationTypeEnumMap[instance.type]!,
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
