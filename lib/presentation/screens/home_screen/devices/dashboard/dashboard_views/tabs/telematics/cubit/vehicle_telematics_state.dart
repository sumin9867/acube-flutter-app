part of 'vehicle_telematics_cubit.dart';

@freezed
class VehicleTelematicsState with _$VehicleTelematicsState {
  const factory VehicleTelematicsState.initial() = _InitialState;
  const factory VehicleTelematicsState.loading() = _LoadingState;
  const factory VehicleTelematicsState.error(String message) = _ErrorState;
  const factory VehicleTelematicsState.idle(
    VehicleTelematicsViewModel viewModel,
  ) = _IdleState;
}

@freezed
class VehicleTelematicsViewModel with _$VehicleTelematicsViewModel {
  const VehicleTelematicsViewModel._();

  const factory VehicleTelematicsViewModel({
    required List<(DateTime?, double)> distance,
    required List<(DateTime?, double)> averageSpeed,
    required List<(DateTime?, double)> runTime,
    required DataRange range,
    required DateTime startDate,
    required DateTime endDate,
  }) = _VehicleTelematicsViewModel;

  double get totalDistance => distance.fold<double>(0, (sum, e) => sum + e.$2);

  double get longestDistance => distance.isEmpty ? 0 : distance.map((e) => e.$2).reduce(math.max);

  double get avgSpeed =>
      averageSpeed.isEmpty ? 0 : averageSpeed.map((e) => e.$2).reduce((a, b) => a + b) / averageSpeed.length;

  double get topSpeed => averageSpeed.isEmpty ? 0 : averageSpeed.map((e) => e.$2).reduce(math.max);

  double get totalRuntime => runTime.fold<double>(0, (sum, e) => sum + e.$2);

  double get longestRuntime => runTime.isEmpty ? 0 : runTime.map((e) => e.$2).reduce(math.max);
}
