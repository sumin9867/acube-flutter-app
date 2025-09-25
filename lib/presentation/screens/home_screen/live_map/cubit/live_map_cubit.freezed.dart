// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LiveMapState {
  List<MarkerModel> get markers => throw _privateConstructorUsedError;
  MapType get mapType => throw _privateConstructorUsedError;
  String? get mapStyle => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get trafficEnabled => throw _privateConstructorUsedError;
  Position? get currentPosition => throw _privateConstructorUsedError;

  /// Create a copy of LiveMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveMapStateCopyWith<LiveMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveMapStateCopyWith<$Res> {
  factory $LiveMapStateCopyWith(
          LiveMapState value, $Res Function(LiveMapState) then) =
      _$LiveMapStateCopyWithImpl<$Res, LiveMapState>;
  @useResult
  $Res call(
      {List<MarkerModel> markers,
      MapType mapType,
      String? mapStyle,
      bool isLoading,
      bool trafficEnabled,
      Position? currentPosition});
}

/// @nodoc
class _$LiveMapStateCopyWithImpl<$Res, $Val extends LiveMapState>
    implements $LiveMapStateCopyWith<$Res> {
  _$LiveMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? mapType = null,
    Object? mapStyle = freezed,
    Object? isLoading = null,
    Object? trafficEnabled = null,
    Object? currentPosition = freezed,
  }) {
    return _then(_value.copyWith(
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerModel>,
      mapType: null == mapType
          ? _value.mapType
          : mapType // ignore: cast_nullable_to_non_nullable
              as MapType,
      mapStyle: freezed == mapStyle
          ? _value.mapStyle
          : mapStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trafficEnabled: null == trafficEnabled
          ? _value.trafficEnabled
          : trafficEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveMapStateImplCopyWith<$Res>
    implements $LiveMapStateCopyWith<$Res> {
  factory _$$LiveMapStateImplCopyWith(
          _$LiveMapStateImpl value, $Res Function(_$LiveMapStateImpl) then) =
      __$$LiveMapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MarkerModel> markers,
      MapType mapType,
      String? mapStyle,
      bool isLoading,
      bool trafficEnabled,
      Position? currentPosition});
}

/// @nodoc
class __$$LiveMapStateImplCopyWithImpl<$Res>
    extends _$LiveMapStateCopyWithImpl<$Res, _$LiveMapStateImpl>
    implements _$$LiveMapStateImplCopyWith<$Res> {
  __$$LiveMapStateImplCopyWithImpl(
      _$LiveMapStateImpl _value, $Res Function(_$LiveMapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? mapType = null,
    Object? mapStyle = freezed,
    Object? isLoading = null,
    Object? trafficEnabled = null,
    Object? currentPosition = freezed,
  }) {
    return _then(_$LiveMapStateImpl(
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerModel>,
      mapType: null == mapType
          ? _value.mapType
          : mapType // ignore: cast_nullable_to_non_nullable
              as MapType,
      mapStyle: freezed == mapStyle
          ? _value.mapStyle
          : mapStyle // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trafficEnabled: null == trafficEnabled
          ? _value.trafficEnabled
          : trafficEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc

class _$LiveMapStateImpl with DiagnosticableTreeMixin implements _LiveMapState {
  const _$LiveMapStateImpl(
      {required final List<MarkerModel> markers,
      this.mapType = MapType.normal,
      this.mapStyle,
      this.isLoading = false,
      this.trafficEnabled = false,
      this.currentPosition})
      : _markers = markers;

  final List<MarkerModel> _markers;
  @override
  List<MarkerModel> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  @JsonKey()
  final MapType mapType;
  @override
  final String? mapStyle;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool trafficEnabled;
  @override
  final Position? currentPosition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LiveMapState(markers: $markers, mapType: $mapType, mapStyle: $mapStyle, isLoading: $isLoading, trafficEnabled: $trafficEnabled, currentPosition: $currentPosition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LiveMapState'))
      ..add(DiagnosticsProperty('markers', markers))
      ..add(DiagnosticsProperty('mapType', mapType))
      ..add(DiagnosticsProperty('mapStyle', mapStyle))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('trafficEnabled', trafficEnabled))
      ..add(DiagnosticsProperty('currentPosition', currentPosition));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveMapStateImpl &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.mapType, mapType) || other.mapType == mapType) &&
            (identical(other.mapStyle, mapStyle) ||
                other.mapStyle == mapStyle) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.trafficEnabled, trafficEnabled) ||
                other.trafficEnabled == trafficEnabled) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_markers),
      mapType,
      mapStyle,
      isLoading,
      trafficEnabled,
      currentPosition);

  /// Create a copy of LiveMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveMapStateImplCopyWith<_$LiveMapStateImpl> get copyWith =>
      __$$LiveMapStateImplCopyWithImpl<_$LiveMapStateImpl>(this, _$identity);
}

abstract class _LiveMapState implements LiveMapState {
  const factory _LiveMapState(
      {required final List<MarkerModel> markers,
      final MapType mapType,
      final String? mapStyle,
      final bool isLoading,
      final bool trafficEnabled,
      final Position? currentPosition}) = _$LiveMapStateImpl;

  @override
  List<MarkerModel> get markers;
  @override
  MapType get mapType;
  @override
  String? get mapStyle;
  @override
  bool get isLoading;
  @override
  bool get trafficEnabled;
  @override
  Position? get currentPosition;

  /// Create a copy of LiveMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveMapStateImplCopyWith<_$LiveMapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarkerModel {
  int get deviceId => throw _privateConstructorUsedError;
  Marker get marker => throw _privateConstructorUsedError;

  /// Create a copy of MarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarkerModelCopyWith<MarkerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkerModelCopyWith<$Res> {
  factory $MarkerModelCopyWith(
          MarkerModel value, $Res Function(MarkerModel) then) =
      _$MarkerModelCopyWithImpl<$Res, MarkerModel>;
  @useResult
  $Res call({int deviceId, Marker marker});
}

/// @nodoc
class _$MarkerModelCopyWithImpl<$Res, $Val extends MarkerModel>
    implements $MarkerModelCopyWith<$Res> {
  _$MarkerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? marker = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkerModelImplCopyWith<$Res>
    implements $MarkerModelCopyWith<$Res> {
  factory _$$MarkerModelImplCopyWith(
          _$MarkerModelImpl value, $Res Function(_$MarkerModelImpl) then) =
      __$$MarkerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int deviceId, Marker marker});
}

/// @nodoc
class __$$MarkerModelImplCopyWithImpl<$Res>
    extends _$MarkerModelCopyWithImpl<$Res, _$MarkerModelImpl>
    implements _$$MarkerModelImplCopyWith<$Res> {
  __$$MarkerModelImplCopyWithImpl(
      _$MarkerModelImpl _value, $Res Function(_$MarkerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? marker = null,
  }) {
    return _then(_$MarkerModelImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      marker: null == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
    ));
  }
}

/// @nodoc

class _$MarkerModelImpl with DiagnosticableTreeMixin implements _MarkerModel {
  const _$MarkerModelImpl({required this.deviceId, required this.marker});

  @override
  final int deviceId;
  @override
  final Marker marker;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MarkerModel(deviceId: $deviceId, marker: $marker)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MarkerModel'))
      ..add(DiagnosticsProperty('deviceId', deviceId))
      ..add(DiagnosticsProperty('marker', marker));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.marker, marker) || other.marker == marker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceId, marker);

  /// Create a copy of MarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkerModelImplCopyWith<_$MarkerModelImpl> get copyWith =>
      __$$MarkerModelImplCopyWithImpl<_$MarkerModelImpl>(this, _$identity);
}

abstract class _MarkerModel implements MarkerModel {
  const factory _MarkerModel(
      {required final int deviceId,
      required final Marker marker}) = _$MarkerModelImpl;

  @override
  int get deviceId;
  @override
  Marker get marker;

  /// Create a copy of MarkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkerModelImplCopyWith<_$MarkerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
