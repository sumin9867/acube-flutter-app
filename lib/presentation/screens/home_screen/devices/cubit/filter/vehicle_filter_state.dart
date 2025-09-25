part of 'vehicle_filter_cubit.dart';

@freezed
class VehicleFilterState with _$VehicleFilterState {
  const factory VehicleFilterState({
    required VehicleFilter selectedFilter,
    required List<DeviceCubit> devices,
  }) = _VehicleFilterState;
}
