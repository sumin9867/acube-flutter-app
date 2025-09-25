part of 'single_event_cubit.dart';

@freezed
class SingleEventState with _$SingleEventState {
  const factory SingleEventState.initial() = _Initial;
  const factory SingleEventState.loading() = _Loading;

    const factory SingleEventState.idle(List<VehicleEvent> events,
   bool hasMore,
  
  ) = _IdleState;
  const factory SingleEventState.error(String errorMsg) = _ErrorState;
  const factory SingleEventState.coordinatesLoaded(List<PositionModel> coordinates) =
      _CoordinatesLoaded;
}
