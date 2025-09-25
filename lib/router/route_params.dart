import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';

part 'route_params.freezed.dart';
part 'route_params.g.dart';

@freezed
class VehicleInfoRouteParams with _$VehicleInfoRouteParams {
  const factory VehicleInfoRouteParams({
    required Device device,
  }) = _VehicleInfoRouteParams;

  factory VehicleInfoRouteParams.fromJson(Map<String, dynamic> json) => _$VehicleInfoRouteParamsFromJson(json);
}

@freezed
class VehicleDashboardRouteParams with _$VehicleDashboardRouteParams {
  const factory VehicleDashboardRouteParams({
    required Device device,
  }) = _VehicleDashboardRouteParams;

  factory VehicleDashboardRouteParams.fromJson(Map<String, dynamic> json) =>
      _$VehicleDashboardRouteParamsFromJson(json);
}

@freezed
class VehicleDetailsRouteParams with _$VehicleDetailsRouteParams {
  const factory VehicleDetailsRouteParams({
    required Device device,
  }) = _VehicleDetailsRouteParams;

  factory VehicleDetailsRouteParams.fromJson(Map<String, dynamic> json) => _$VehicleDetailsRouteParamsFromJson(json);
}

@freezed
class VehiclePlaybackRouteParams with _$VehiclePlaybackRouteParams {
  const factory VehiclePlaybackRouteParams({
    required String vehicleId,
  }) = _VehiclePlaybackRouteParams;

  factory VehiclePlaybackRouteParams.fromJson(Map<String, dynamic> json) => _$VehiclePlaybackRouteParamsFromJson(json);
}

@freezed
class CustomerCareParams with _$CustomerCareParams {
  const factory CustomerCareParams({
    required bool isLoggedIn,
  }) = _CustomerCareParams;

  factory CustomerCareParams.fromJson(Map<String, dynamic> json) => _$CustomerCareParamsFromJson(json);
}

@freezed
class VehicleMapTripRouteParams with _$VehicleMapTripRouteParams {
  const factory VehicleMapTripRouteParams({
    required VehicleTrip trip,
  }) = _VehicleMapTripRouteParams;

  factory VehicleMapTripRouteParams.fromJson(Map<String, dynamic> json) => _$VehicleMapTripRouteParamsFromJson(json);
}

@freezed
class VehicleMapStopRouteParams with _$VehicleMapStopRouteParams {
  const factory VehicleMapStopRouteParams({
    required VehicleStop stop,
  }) = _VehicleMapStopRouteParams;

  factory VehicleMapStopRouteParams.fromJson(Map<String, dynamic> json) => _$VehicleMapStopRouteParamsFromJson(json);
}

@freezed
class GeofenceRouteParams with _$GeofenceRouteParams {
  const factory GeofenceRouteParams({
    required String vehicleId,
  }) = _GeofenceRouteParams;

  factory GeofenceRouteParams.fromJson(Map<String, dynamic> json) => _$GeofenceRouteParamsFromJson(json);
}

@freezed
class ViewGeofenceRouteParams with _$ViewGeofenceRouteParams {
  const factory ViewGeofenceRouteParams({
    required GeofenceModel geofenceModel,
  }) = _ViewGeofenceRouteParams;

  factory ViewGeofenceRouteParams.fromJson(Map<String, dynamic> json) => _$ViewGeofenceRouteParamsFromJson(json);
}

@freezed
class VehicleEngineLockRouteParams with _$VehicleEngineLockRouteParams {
  const factory VehicleEngineLockRouteParams({
    required Device device,
  }) = _VehicleEngineLockRouteParams;

  factory VehicleEngineLockRouteParams.fromJson(Map<String, dynamic> json) =>
      _$VehicleEngineLockRouteParamsFromJson(json);
}

@freezed
class VehicleAntiTheftRouteParams with _$VehicleAntiTheftRouteParams {
  const factory VehicleAntiTheftRouteParams({
    required Device device,
  }) = _VehicleAntiTheftRouteParams;

  factory VehicleAntiTheftRouteParams.fromJson(Map<String, dynamic> json) =>
      _$VehicleAntiTheftRouteParamsFromJson(json);
}

@freezed
class VehicleSettingsRouteParams with _$VehicleSettingsRouteParams {
  const factory VehicleSettingsRouteParams({
    required Device device,
  }) = _VehicleSettingsRouteParams;

  factory VehicleSettingsRouteParams.fromJson(Map<String, dynamic> json) => _$VehicleSettingsRouteParamsFromJson(json);
}

@freezed
class EventMapRouteParams with _$EventMapRouteParams {
  const factory EventMapRouteParams({required VehicleEvent vehicleEvent}) = _EventMapRouteParams;

  factory EventMapRouteParams.fromJson(Map<String, dynamic> json) => _$EventMapRouteParamsFromJson(json);
}

@freezed
class ShareLocationRouteParams with _$ShareLocationRouteParams {
  const factory ShareLocationRouteParams({required Device vehicle, required String deviceId}) =
      _ShareLocationRouteParams;

  factory ShareLocationRouteParams.fromJson(Map<String, dynamic> json) => _$ShareLocationRouteParamsFromJson(json);
}
