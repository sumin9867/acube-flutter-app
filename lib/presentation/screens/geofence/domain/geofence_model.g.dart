// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeofenceModelImpl _$$GeofenceModelImplFromJson(Map<String, dynamic> json) =>
    _$GeofenceModelImpl(
      id: (json['id'] as num?)?.toInt(),
      calendarId: (json['calendarId'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      attributes: json['attributes'] as Map<String, dynamic>?,
      area: json['area'] as String?,
    );

Map<String, dynamic> _$$GeofenceModelImplToJson(_$GeofenceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'calendarId': instance.calendarId,
      'name': instance.name,
      'description': instance.description,
      'attributes': instance.attributes,
      'area': instance.area,
    };
