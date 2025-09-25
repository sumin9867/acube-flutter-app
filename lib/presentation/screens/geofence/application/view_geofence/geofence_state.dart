part of 'geofence_cubit.dart';

@freezed
class GeofenceState with _$GeofenceState {
  const factory GeofenceState.initial() = _InitialState;
  const factory GeofenceState.loading(String? message) = _LoadingState;
  const factory GeofenceState.success(String? message) = _SuccessState;

  const factory GeofenceState.error(String errorMsg) = _ErrorState;
  const factory GeofenceState.idle(List<GeofenceModel> geofenceList) = _IdleState;
}
