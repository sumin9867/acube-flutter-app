import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_event.freezed.dart';
part 'vehicle_event.g.dart';

@freezed
class VehicleEvent with _$VehicleEvent {
  const factory VehicleEvent({
    required int id,
    @JsonKey(name: 'deviceid') required int deviceId,
    @JsonKey(name: 'devicename', defaultValue: 'Unknown')
    String? deviceName, // changed here
    required String type,
    @JsonKey(name: 'eventtime') required DateTime eventTime,
    @JsonKey(name: 'positionid') int? positionId,
    @JsonKey(name: 'geofenceid') int? geofenceId,
    @JsonKey(name: 'maintenanceid') int? maintenanceId,
    @JsonKey(name: 'attributes') Map<String, dynamic>? attributes,
  }) = _VehicleEvent;

  factory VehicleEvent.fromJson(Map<String, dynamic> json) =>
      _$VehicleEventFromJson(json);
}
