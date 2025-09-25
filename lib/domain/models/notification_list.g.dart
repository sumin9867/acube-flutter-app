// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificaionlistImpl _$$NotificaionlistImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificaionlistImpl(
      id: (json['id'] as num).toInt(),
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      calendarId: (json['calendarId'] as num?)?.toInt(),
      always: json['always'] as bool?,
      type: json['type'] as String?,
      notificators: json['notificators'] as String?,
    );

Map<String, dynamic> _$$NotificaionlistImplToJson(
        _$NotificaionlistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'calendarId': instance.calendarId,
      'always': instance.always,
      'type': instance.type,
      'notificators': instance.notificators,
    };

_$AttributesImpl _$$AttributesImplFromJson(Map<String, dynamic> json) =>
    _$AttributesImpl();

Map<String, dynamic> _$$AttributesImplToJson(_$AttributesImpl instance) =>
    <String, dynamic>{};
