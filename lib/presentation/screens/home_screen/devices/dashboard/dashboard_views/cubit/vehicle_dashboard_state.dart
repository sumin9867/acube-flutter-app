part of 'vehicle_dashboard_cubit.dart';

@freezed
class VehicleDashboardState with _$VehicleDashboardState {
  const factory VehicleDashboardState.initial() = _InitialState;
  const factory VehicleDashboardState.loading() = _LoadingState;
  const factory VehicleDashboardState.error(String message) = _ErrorState;
  const factory VehicleDashboardState.idle(
    VehicleDashboardViewModel viewModel,
    final CancelToken? cancelToken,
  ) = _IdleState;
}

@freezed
class VehicleDashboardViewModel with _$VehicleDashboardViewModel {
  const factory VehicleDashboardViewModel({
    required DataRange range,
    required DateTime startDate,
    required DateTime endDate,
    required Summary summary,
    required List<VehicleTrip> trips,
    required List<VehicleStop> stops,
    required List<VehicleEvent> events,
  }) = _VehicleDashboardViewModel;
}
