// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleEventImpl _$$VehicleEventImplFromJson(Map<String, dynamic> json) =>
    _$VehicleEventImpl(
      id: (json['id'] as num).toInt(),
      deviceId: (json['deviceid'] as num).toInt(),
      deviceName: json['devicename'] as String? ?? 'Unknown',
      type: json['type'] as String,
      eventTime: DateTime.parse(json['eventtime'] as String),
      positionId: (json['positionid'] as num?)?.toInt(),
      geofenceId: (json['geofenceid'] as num?)?.toInt(),
      maintenanceId: (json['maintenanceid'] as num?)?.toInt(),
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$VehicleEventImplToJson(_$VehicleEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceid': instance.deviceId,
      'devicename': instance.deviceName,
      'type': instance.type,
      'eventtime': instance.eventTime.toIso8601String(),
      'positionid': instance.positionId,
      'geofenceid': instance.geofenceId,
      'maintenanceid': instance.maintenanceId,
      'attributes': instance.attributes,
    };
