import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/theme/app_colors.dart';

part 'Device.freezed.dart';
part 'Device.g.dart';

@freezed
class Device with _$Device {
  const factory Device({
    required int id,
    required DeviceAttribute? attributes,
    required int groupId,
    required String uniqueId,
    required DeviceStatus status,
    required String name,
    DateTime? lastUpdate,
    required int positionId,
    List? geofenceIds,
    String? phone,
    String? model,
    String? contact,
    String? category,
    required bool disabled,
    DateTime? expirationTime,
    String? photo,
    PositionModel? position,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

@freezed
class AddDeviceRequest with _$AddDeviceRequest {
  const factory AddDeviceRequest({
    required String name,
    required String uniqueId,
    required String phone,
    required String model,
    required String contact,
    required String category,
    required Attributes attributes, // Using Attributes model instead of Map
  }) = _AddDeviceRequest;

  factory AddDeviceRequest.fromJson(Map<String, dynamic> json) => _$AddDeviceRequestFromJson(json);
}

@freezed
class Attributes with _$Attributes {
  const factory Attributes({
    required String registration, // Added registration inside attributes
  }) = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);
}

enum DeviceStatus {
  @JsonValue('online')
  online('Online', AppColors.green),
  @JsonValue('offline')
  offline('Offline', AppColors.red),
  @JsonValue('unknown')
  unknown('Unknown', AppColors.yellow);

  final String label;
  final Color color;

  const DeviceStatus(this.label, this.color);
}

extension DeviceSttatusEx on DeviceStatus {
  String toDisplayText() {
    switch (this) {
      case DeviceStatus.online:
        return 'Online';
      case DeviceStatus.offline:
        return 'Offline';
      default:
        return 'Unknown';
    }
  }
}

@freezed
class DeviceAttribute with _$DeviceAttribute {
  const factory DeviceAttribute({
    int? sat,
    bool? ignition,
    int? event,
    bool? archive,
    double? distance,
    double? totalDistance,
    String? ip,
    bool? motion,
    bool? blocked,
    int? batteryLevel,
    int? rssi,
    bool? charge,
    int? hours,
    String? speedLimit, // Change this to double?
  }) = _DeviceAttribute;

  // factory DeviceAttribute.fromJson(Map<String, dynamic> json) => _$DeviceAttributeFromJson(json);
  factory DeviceAttribute.fromJson(Map<String, dynamic> json) {
    return DeviceAttribute(
      sat: _toInt(json['sat']),
      ignition: json['ignition'] as bool?,
      event: _toInt(json['event']),
      archive: json['archive'] as bool?,
      distance: _toDouble(json['distance']),
      totalDistance: _toDouble(json['totalDistance']),
      ip: json['ip']?.toString(),
      motion: json['motion'] as bool?,
      blocked: json['blocked'] as bool?,
      batteryLevel: _toInt(json['batteryLevel']),
      rssi: _toInt(json['rssi']),
      charge: json['charge'] as bool?,
      hours: _toInt(json['hours']),
      speedLimit: json['speedLimit']?.toString(),
    );
  }

  static int? _toInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static double? _toDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}

class DeviceCustomName {
  int? id;
  String? name;
  String? uniqueId;
  Map<String, dynamic>? attributes;
  String? category;
  int? groupId;
  DateTime? lastUpdate;
  int? positionId;
  String? phone;
  String? model;
  String? contact;
  DateTime? expirationTime;

  DeviceCustomName({
    this.id,
    this.name,
    this.uniqueId,
    this.category,
    this.attributes,
    this.groupId,
    this.lastUpdate,
    this.positionId,
    this.phone,
    this.model,
    this.contact,
    this.expirationTime,
  });

  DeviceCustomName.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        uniqueId = json['uniqueId'],
        category = json['category'],
        attributes = json['attributes'],
        groupId = json['groupId'],
        lastUpdate = json['lastUpdate'] != null ? DateTime.parse(json['lastUpdate']) : null,
        positionId = json['positionId'],
        phone = json['phone'],
        model = json['model'],
        contact = json['contact'],
        expirationTime = json['expirationTime'] != null ? DateTime.parse(json['expirationTime']) : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'uniqueId': uniqueId,
        'category': category,
        'attributes': attributes,
        'groupId': groupId,
        'lastUpdate': lastUpdate?.toIso8601String(),
        'positionId': positionId,
        'phone': phone,
        'model': model,
        'contact': contact,
        'expirationTime': expirationTime?.toIso8601String(),
      };
}
