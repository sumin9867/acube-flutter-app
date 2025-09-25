// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleTripImpl _$$VehicleTripImplFromJson(Map<String, dynamic> json) =>
    _$VehicleTripImpl(
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
      startPositionId: (json['startPositionId'] as num).toInt(),
      endPositionId: (json['endPositionId'] as num).toInt(),
      startLat: (json['startLat'] as num).toDouble(),
      startLon: (json['startLon'] as num).toDouble(),
      endLat: (json['endLat'] as num).toDouble(),
      endLon: (json['endLon'] as num).toDouble(),
      startAddress: json['startAddress'] as String? ?? 'Unavailable',
      endAddress: json['endAddress'] as String? ?? 'Unavailable',
      duration: _durationFromJson((json['duration'] as num).toInt()),
      driverUniqueId: json['driverUniqueId'] as String?,
      driverName: json['driverName'] as String?,
    );

Map<String, dynamic> _$$VehicleTripImplToJson(_$VehicleTripImpl instance) =>
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
      'startPositionId': instance.startPositionId,
      'endPositionId': instance.endPositionId,
      'startLat': instance.startLat,
      'startLon': instance.startLon,
      'endLat': instance.endLat,
      'endLon': instance.endLon,
      'startAddress': instance.startAddress,
      'endAddress': instance.endAddress,
      'duration': _durationToJson(instance.duration),
      'driverUniqueId': instance.driverUniqueId,
      'driverName': instance.driverName,
    };
