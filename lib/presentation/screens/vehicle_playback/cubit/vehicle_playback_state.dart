part of 'vehicle_playback_cubit.dart';

@freezed
class VehiclePlaybackState with _$VehiclePlaybackState {
  const factory VehiclePlaybackState.initial() = _InitialState;
  const factory VehiclePlaybackState.loading() = _LoadingState;
  const factory VehiclePlaybackState.error(String message) = _ErrorState;
  const factory VehiclePlaybackState.empty(VehiclePlaybackEmptyViewModel viewModel) = _EmptyState;
  const factory VehiclePlaybackState.idle(VehiclePlaybackViewModel viewModel) = _IdleState;
}

@freezed
class VehiclePlaybackEmptyViewModel with _$VehiclePlaybackEmptyViewModel {
  const factory VehiclePlaybackEmptyViewModel({
    required Device vehicle,
    required DataRange dataRange,
    required DateTime selectedDate,
  }) = _VehiclePlaybackEmptyViewModel;
}

@freezed
class VehiclePlaybackViewModel with _$VehiclePlaybackViewModel {
  const factory VehiclePlaybackViewModel({
    required Device vehicle,
    required Marker startMarker,
    required Marker endMarker,
    required Marker currentLocationMarker,
    required List<LatLng> polylineCoordinates,
    required int playbackSize,
    required int currentPlaybackIndex,
    required bool isPlaying,
    required int playbackSpeed,
    required DataRange dataRange,
    required DateTime selectedDate,
    required int rssi,
    DateTime? currentTime,
    String? address,
  }) = _VehiclePlaybackViewModel;
}
