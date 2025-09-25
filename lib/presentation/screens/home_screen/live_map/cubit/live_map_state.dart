part of 'live_map_cubit.dart';

@freezed
class LiveMapState with _$LiveMapState {
  const factory LiveMapState({
    required List<MarkerModel> markers,
    @Default(MapType.normal) MapType mapType,
    String? mapStyle,
    @Default(false) bool isLoading,
    @Default(false) bool trafficEnabled,
    Position? currentPosition,
  }) = _LiveMapState;
}

@freezed
class MarkerModel with _$MarkerModel {
  const factory MarkerModel({
    required int deviceId,
    required Marker marker,
  }) = _MarkerModel;
}
