// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleStopImpl _$$VehicleStopImplFromJson(Map<String, dynamic> json) =>
    _$VehicleStopImpl(
      deviceId: (json['deviceId'] as num).toInt(),
      deviceName: json['deviceName'] as String,
      distance: (json['distance'] as num).toDouble(),
      averageSpeed: (json['averageSpeed'] as num).toDouble(),
      maxSpeed: (json['maxSpeed'] as num).toDouble(),
      spentFuel: (json['spentFuel'] as num).toDouble(),
      startOdometer: (json['startOdometer'] as num).toDouble(),
      endOdometer: (json['endOdometer'] as num).toDouble(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      positionId: (json['positionId'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String?,
      duration: _durationFromJson((json['duration'] as num).toInt()),
      engineHours: _durationFromJson((json['engineHours'] as num).toInt()),
    );

Map<String, dynamic> _$$VehicleStopImplToJson(_$VehicleStopImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'distance': instance.distance,
      'averageSpeed': instance.averageSpeed,
      'maxSpeed': instance.maxSpeed,
      'spentFuel': instance.spentFuel,
      'startOdometer': instance.startOdometer,
      'endOdometer': instance.endOdometer,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'positionId': instance.positionId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'duration': _durationToJson(instance.duration),
      'engineHours': _durationToJson(instance.engineHours),
    };
