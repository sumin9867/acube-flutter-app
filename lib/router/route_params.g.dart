// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleInfoRouteParamsImpl _$$VehicleInfoRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleInfoRouteParamsImpl(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleInfoRouteParamsImplToJson(
        _$VehicleInfoRouteParamsImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
    };

_$VehicleDashboardRouteParamsImpl _$$VehicleDashboardRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleDashboardRouteParamsImpl(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleDashboardRouteParamsImplToJson(
        _$VehicleDashboardRouteParamsImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
    };

_$VehicleDetailsRouteParamsImpl _$$VehicleDetailsRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleDetailsRouteParamsImpl(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleDetailsRouteParamsImplToJson(
        _$VehicleDetailsRouteParamsImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
    };

_$VehiclePlaybackRouteParamsImpl _$$VehiclePlaybackRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehiclePlaybackRouteParamsImpl(
      vehicleId: json['vehicleId'] as String,
    );

Map<String, dynamic> _$$VehiclePlaybackRouteParamsImplToJson(
        _$VehiclePlaybackRouteParamsImpl instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
    };

_$CustomerCareParamsImpl _$$CustomerCareParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerCareParamsImpl(
      isLoggedIn: json['isLoggedIn'] as bool,
    );

Map<String, dynamic> _$$CustomerCareParamsImplToJson(
        _$CustomerCareParamsImpl instance) =>
    <String, dynamic>{
      'isLoggedIn': instance.isLoggedIn,
    };

_$VehicleMapTripRouteParamsImpl _$$VehicleMapTripRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleMapTripRouteParamsImpl(
      trip: VehicleTrip.fromJson(json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleMapTripRouteParamsImplToJson(
        _$VehicleMapTripRouteParamsImpl instance) =>
    <String, dynamic>{
      'trip': instance.trip,
    };

_$VehicleMapStopRouteParamsImpl _$$VehicleMapStopRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleMapStopRouteParamsImpl(
      stop: VehicleStop.fromJson(json['stop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleMapStopRouteParamsImplToJson(
        _$VehicleMapStopRouteParamsImpl instance) =>
    <String, dynamic>{
      'stop': instance.stop,
    };

_$GeofenceRouteParamsImpl _$$GeofenceRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GeofenceRouteParamsImpl(
      vehicleId: json['vehicleId'] as String,
    );

Map<String, dynamic> _$$GeofenceRouteParamsImplToJson(
        _$GeofenceRouteParamsImpl instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
    };

_$ViewGeofenceRouteParamsImpl _$$ViewGeofenceRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewGeofenceRouteParamsImpl(
      geofenceModel:
          GeofenceModel.fromJson(json['geofenceModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewGeofenceRouteParamsImplToJson(
        _$ViewGeofenceRouteParamsImpl instance) =>
    <String, dynamic>{
      'geofenceModel': instance.geofenceModel,
    };

_$VehicleEngineLockRouteParamsImpl _$$VehicleEngineLockRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleEngineLockRouteParamsImpl(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleEngineLockRouteParamsImplToJson(
        _$VehicleEngineLockRouteParamsImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
    };

_$VehicleAntiTheftRouteParamsImpl _$$VehicleAntiTheftRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleAntiTheftRouteParamsImpl(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleAntiTheftRouteParamsImplToJson(
        _$VehicleAntiTheftRouteParamsImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
    };

_$VehicleSettingsRouteParamsImpl _$$VehicleSettingsRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$VehicleSettingsRouteParamsImpl(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VehicleSettingsRouteParamsImplToJson(
        _$VehicleSettingsRouteParamsImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
    };

_$EventMapRouteParamsImpl _$$EventMapRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$EventMapRouteParamsImpl(
      vehicleEvent:
          VehicleEvent.fromJson(json['vehicleEvent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventMapRouteParamsImplToJson(
        _$EventMapRouteParamsImpl instance) =>
    <String, dynamic>{
      'vehicleEvent': instance.vehicleEvent,
    };

_$ShareLocationRouteParamsImpl _$$ShareLocationRouteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ShareLocationRouteParamsImpl(
      vehicle: Device.fromJson(json['vehicle'] as Map<String, dynamic>),
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$$ShareLocationRouteParamsImplToJson(
        _$ShareLocationRouteParamsImpl instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'deviceId': instance.deviceId,
    };
