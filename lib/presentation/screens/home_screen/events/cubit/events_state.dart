part of 'events_cubit.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.loading() = _LoadingState;
  const factory EventsState.idle(List<VehicleEvent> events,
   bool hasMore,
  
  ) = _IdleState;
  const factory EventsState.error(String errorMsg) = _ErrorState;
  const factory EventsState.coordinatesLoaded(List<PositionModel> coordinates) =
      _CoordinatesLoaded;
}
