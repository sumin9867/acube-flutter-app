// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryImpl _$$SummaryImplFromJson(Map<String, dynamic> json) =>
    _$SummaryImpl(
      deviceId: (json['deviceId'] as num?)?.toInt(),
      deviceName: json['deviceName'] as String?,
      distanceInMeter: (json['distance'] as num?)?.toDouble(),
      averageSpeedInKnots: (json['averageSpeed'] as num?)?.toDouble(),
      maxSpeed: (json['maxSpeed'] as num?)?.toDouble(),
      spentFuel: (json['spentFuel'] as num?)?.toDouble(),
      startOdometer: (json['startOdometer'] as num?)?.toDouble(),
      endOdometer: (json['endOdometer'] as num?)?.toDouble(),
      engineHoursInMilliSec: (json['engineHours'] as num?)?.toInt(),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$SummaryImplToJson(_$SummaryImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'distance': instance.distanceInMeter,
      'averageSpeed': instance.averageSpeedInKnots,
      'maxSpeed': instance.maxSpeed,
      'spentFuel': instance.spentFuel,
      'startOdometer': instance.startOdometer,
      'endOdometer': instance.endOdometer,
      'engineHours': instance.engineHoursInMilliSec,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
