// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'socket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocketResponse _$SocketResponseFromJson(Map<String, dynamic> json) {
  return _SocketResponse.fromJson(json);
}

/// @nodoc
mixin _$SocketResponse {
  List<PositionModel>? get positions => throw _privateConstructorUsedError;
  List<Device>? get devices => throw _privateConstructorUsedError;
  List<VehicleEvent>? get events => throw _privateConstructorUsedError;

  /// Serializes this SocketResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketResponseCopyWith<SocketResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketResponseCopyWith<$Res> {
  factory $SocketResponseCopyWith(
          SocketResponse value, $Res Function(SocketResponse) then) =
      _$SocketResponseCopyWithImpl<$Res, SocketResponse>;
  @useResult
  $Res call(
      {List<PositionModel>? positions,
      List<Device>? devices,
      List<VehicleEvent>? events});
}

/// @nodoc
class _$SocketResponseCopyWithImpl<$Res, $Val extends SocketResponse>
    implements $SocketResponseCopyWith<$Res> {
  _$SocketResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positions = freezed,
    Object? devices = freezed,
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      positions: freezed == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionModel>?,
      devices: freezed == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<Device>?,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<VehicleEvent>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocketResponseImplCopyWith<$Res>
    implements $SocketResponseCopyWith<$Res> {
  factory _$$SocketResponseImplCopyWith(_$SocketResponseImpl value,
          $Res Function(_$SocketResponseImpl) then) =
      __$$SocketResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PositionModel>? positions,
      List<Device>? devices,
      List<VehicleEvent>? events});
}

/// @nodoc
class __$$SocketResponseImplCopyWithImpl<$Res>
    extends _$SocketResponseCopyWithImpl<$Res, _$SocketResponseImpl>
    implements _$$SocketResponseImplCopyWith<$Res> {
  __$$SocketResponseImplCopyWithImpl(
      _$SocketResponseImpl _value, $Res Function(_$SocketResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positions = freezed,
    Object? devices = freezed,
    Object? events = freezed,
  }) {
    return _then(_$SocketResponseImpl(
      positions: freezed == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionModel>?,
      devices: freezed == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<Device>?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<VehicleEvent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketResponseImpl implements _SocketResponse {
  const _$SocketResponseImpl(
      {final List<PositionModel>? positions,
      final List<Device>? devices,
      final List<VehicleEvent>? events})
      : _positions = positions,
        _devices = devices,
        _events = events;

  factory _$SocketResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketResponseImplFromJson(json);

  final List<PositionModel>? _positions;
  @override
  List<PositionModel>? get positions {
    final value = _positions;
    if (value == null) return null;
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Device>? _devices;
  @override
  List<Device>? get devices {
    final value = _devices;
    if (value == null) return null;
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VehicleEvent>? _events;
  @override
  List<VehicleEvent>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SocketResponse(positions: $positions, devices: $devices, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_positions),
      const DeepCollectionEquality().hash(_devices),
      const DeepCollectionEquality().hash(_events));

  /// Create a copy of SocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketResponseImplCopyWith<_$SocketResponseImpl> get copyWith =>
      __$$SocketResponseImplCopyWithImpl<_$SocketResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketResponseImplToJson(
      this,
    );
  }
}

abstract class _SocketResponse implements SocketResponse {
  const factory _SocketResponse(
      {final List<PositionModel>? positions,
      final List<Device>? devices,
      final List<VehicleEvent>? events}) = _$SocketResponseImpl;

  factory _SocketResponse.fromJson(Map<String, dynamic> json) =
      _$SocketResponseImpl.fromJson;

  @override
  List<PositionModel>? get positions;
  @override
  List<Device>? get devices;
  @override
  List<VehicleEvent>? get events;

  /// Create a copy of SocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketResponseImplCopyWith<_$SocketResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
