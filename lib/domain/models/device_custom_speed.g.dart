// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_custom_speed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceCustomSpeedImpl _$$DeviceCustomSpeedImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceCustomSpeedImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      uniqueId: json['uniqueId'] as String?,
      attributes: json['attributes'] as Map<String, dynamic>?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$DeviceCustomSpeedImplToJson(
        _$DeviceCustomSpeedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uniqueId': instance.uniqueId,
      'attributes': instance.attributes,
      'category': instance.category,
    };
