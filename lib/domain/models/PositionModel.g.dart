// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PositionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionModelImpl _$$PositionModelImplFromJson(Map<String, dynamic> json) =>
    _$PositionModelImpl(
      id: (json['id'] as num).toInt(),
      deviceId: (json['deviceId'] as num).toInt(),
      type: json['type'] as String?,
      protocol: json['protocol'] as String,
      serverTime: DateTime.parse(json['serverTime'] as String),
      deviceTime: json['deviceTime'] as String,
      fixTime: json['fixTime'] as String,
      outdated: json['outdated'] as bool,
      valid: json['valid'] as bool,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      course: (json['course'] as num).toDouble(),
      address: json['address'] as String?,
      accuracy: (json['accuracy'] as num).toDouble(),
      blocked: json['blocked'] as bool?,
      attributes: json['attributes'] == null
          ? null
          : DeviceAttribute.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PositionModelImplToJson(_$PositionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'type': instance.type,
      'protocol': instance.protocol,
      'serverTime': instance.serverTime.toIso8601String(),
      'deviceTime': instance.deviceTime,
      'fixTime': instance.fixTime,
      'outdated': instance.outdated,
      'valid': instance.valid,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'course': instance.course,
      'address': instance.address,
      'accuracy': instance.accuracy,
      'blocked': instance.blocked,
      'attributes': instance.attributes?.toJson(),
    };
