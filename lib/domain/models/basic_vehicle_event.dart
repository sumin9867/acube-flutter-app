import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_vehicle_event.freezed.dart';
part 'basic_vehicle_event.g.dart';

@freezed
class BasicVehicleEvent with _$BasicVehicleEvent {
  const factory BasicVehicleEvent({
    required int id,
    @JsonKey(name: 'deviceId') required int deviceId,
    required String type,
    @JsonKey(name: 'eventTime') required DateTime eventTime,
    @JsonKey(name: 'positionId') int? positionId,
    @JsonKey(name: 'geofenceId') int? geofenceId,
    @JsonKey(name: 'maintenanceId') int? maintenanceId,
    @JsonKey(name: 'attributes') Map<String, dynamic>? attributes,
  }) = _BasicVehicleEvent;

  factory BasicVehicleEvent.fromJson(Map<String, dynamic> json) =>
      _$BasicVehicleEventFromJson(json);
}
