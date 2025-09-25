part of 'vehicle_search_cubit.dart';

@freezed
class VehicleSearchState with _$VehicleSearchState {
  const factory VehicleSearchState.inactive() = _InactiveState;
  const factory VehicleSearchState.idle(List<DeviceCubit> devices) = _IdleState;
}
