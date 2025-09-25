part of 'add_geofence_cubit.dart';

@freezed
class AddGeofenceState with _$AddGeofenceState {
  const factory AddGeofenceState.initial() = _InitialState;
  const factory AddGeofenceState.loading() = _LoadingState;
  const factory AddGeofenceState.error(String errorMsg) = _ErrorState;
  const factory AddGeofenceState.idle(AddGeofenceModel viewModel) = _IdleState;
  const factory AddGeofenceState.success(String message) = _SuccessState;
  
  // New states
  const factory AddGeofenceState.locationUpdated(LatLng position) = _LocationUpdatedState;
  const factory AddGeofenceState.radiusUpdated(double radius) = _RadiusUpdatedState;
  const factory AddGeofenceState.cameraUpdated(double zoomLevel) = _CameraUpdatedState;
}


@freezed
class AddGeofenceModel with _$AddGeofenceModel {
  const factory AddGeofenceModel({
    required String fenceName,
    String? description,
    required double radiusInMeter,
    required LatLng position,
  }) = _AddGeofenceModel;
}
