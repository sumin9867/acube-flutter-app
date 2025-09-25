// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      id: (json['id'] as num).toInt(),
      attributes: json['attributes'] == null
          ? null
          : DeviceAttribute.fromJson(
              json['attributes'] as Map<String, dynamic>),
      groupId: (json['groupId'] as num).toInt(),
      uniqueId: json['uniqueId'] as String,
      status: $enumDecode(_$DeviceStatusEnumMap, json['status']),
      name: json['name'] as String,
      lastUpdate: json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
      positionId: (json['positionId'] as num).toInt(),
      geofenceIds: json['geofenceIds'] as List<dynamic>?,
      phone: json['phone'] as String?,
      model: json['model'] as String?,
      contact: json['contact'] as String?,
      category: json['category'] as String?,
      disabled: json['disabled'] as bool,
      expirationTime: json['expirationTime'] == null
          ? null
          : DateTime.parse(json['expirationTime'] as String),
      photo: json['photo'] as String?,
      position: json['position'] == null
          ? null
          : PositionModel.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'groupId': instance.groupId,
      'uniqueId': instance.uniqueId,
      'status': _$DeviceStatusEnumMap[instance.status]!,
      'name': instance.name,
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
      'positionId': instance.positionId,
      'geofenceIds': instance.geofenceIds,
      'phone': instance.phone,
      'model': instance.model,
      'contact': instance.contact,
      'category': instance.category,
      'disabled': instance.disabled,
      'expirationTime': instance.expirationTime?.toIso8601String(),
      'photo': instance.photo,
      'position': instance.position,
    };

const _$DeviceStatusEnumMap = {
  DeviceStatus.online: 'online',
  DeviceStatus.offline: 'offline',
  DeviceStatus.unknown: 'unknown',
};

_$AddDeviceRequestImpl _$$AddDeviceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddDeviceRequestImpl(
      name: json['name'] as String,
      uniqueId: json['uniqueId'] as String,
      phone: json['phone'] as String,
      model: json['model'] as String,
      contact: json['contact'] as String,
      category: json['category'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddDeviceRequestImplToJson(
        _$AddDeviceRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uniqueId': instance.uniqueId,
      'phone': instance.phone,
      'model': instance.model,
      'contact': instance.contact,
      'category': instance.category,
      'attributes': instance.attributes,
    };

_$AttributesImpl _$$AttributesImplFromJson(Map<String, dynamic> json) =>
    _$AttributesImpl(
      registration: json['registration'] as String,
    );

Map<String, dynamic> _$$AttributesImplToJson(_$AttributesImpl instance) =>
    <String, dynamic>{
      'registration': instance.registration,
    };

_$DeviceAttributeImpl _$$DeviceAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceAttributeImpl(
      sat: (json['sat'] as num?)?.toInt(),
      ignition: json['ignition'] as bool?,
      event: (json['event'] as num?)?.toInt(),
      archive: json['archive'] as bool?,
      distance: (json['distance'] as num?)?.toDouble(),
      totalDistance: (json['totalDistance'] as num?)?.toDouble(),
      ip: json['ip'] as String?,
      motion: json['motion'] as bool?,
      blocked: json['blocked'] as bool?,
      batteryLevel: (json['batteryLevel'] as num?)?.toInt(),
      rssi: (json['rssi'] as num?)?.toInt(),
      charge: json['charge'] as bool?,
      hours: (json['hours'] as num?)?.toInt(),
      speedLimit: json['speedLimit'] as String?,
    );

Map<String, dynamic> _$$DeviceAttributeImplToJson(
        _$DeviceAttributeImpl instance) =>
    <String, dynamic>{
      'sat': instance.sat,
      'ignition': instance.ignition,
      'event': instance.event,
      'archive': instance.archive,
      'distance': instance.distance,
      'totalDistance': instance.totalDistance,
      'ip': instance.ip,
      'motion': instance.motion,
      'blocked': instance.blocked,
      'batteryLevel': instance.batteryLevel,
      'rssi': instance.rssi,
      'charge': instance.charge,
      'hours': instance.hours,
      'speedLimit': instance.speedLimit,
    };
