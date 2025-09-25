// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_vehicle_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicVehicleEventImpl _$$BasicVehicleEventImplFromJson(
        Map<String, dynamic> json) =>
    _$BasicVehicleEventImpl(
      id: (json['id'] as num).toInt(),
      deviceId: (json['deviceId'] as num).toInt(),
      type: json['type'] as String,
      eventTime: DateTime.parse(json['eventTime'] as String),
      positionId: (json['positionId'] as num?)?.toInt(),
      geofenceId: (json['geofenceId'] as num?)?.toInt(),
      maintenanceId: (json['maintenanceId'] as num?)?.toInt(),
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$BasicVehicleEventImplToJson(
        _$BasicVehicleEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'type': instance.type,
      'eventTime': instance.eventTime.toIso8601String(),
      'positionId': instance.positionId,
      'geofenceId': instance.geofenceId,
      'maintenanceId': instance.maintenanceId,
      'attributes': instance.attributes,
    };
