// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_vehicle_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasicVehicleEvent _$BasicVehicleEventFromJson(Map<String, dynamic> json) {
  return _BasicVehicleEvent.fromJson(json);
}

/// @nodoc
mixin _$BasicVehicleEvent {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceId')
  int get deviceId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventTime')
  DateTime get eventTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'positionId')
  int? get positionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'geofenceId')
  int? get geofenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintenanceId')
  int? get maintenanceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;

  /// Serializes this BasicVehicleEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasicVehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicVehicleEventCopyWith<BasicVehicleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicVehicleEventCopyWith<$Res> {
  factory $BasicVehicleEventCopyWith(
          BasicVehicleEvent value, $Res Function(BasicVehicleEvent) then) =
      _$BasicVehicleEventCopyWithImpl<$Res, BasicVehicleEvent>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'deviceId') int deviceId,
      String type,
      @JsonKey(name: 'eventTime') DateTime eventTime,
      @JsonKey(name: 'positionId') int? positionId,
      @JsonKey(name: 'geofenceId') int? geofenceId,
      @JsonKey(name: 'maintenanceId') int? maintenanceId,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});
}

/// @nodoc
class _$BasicVehicleEventCopyWithImpl<$Res, $Val extends BasicVehicleEvent>
    implements $BasicVehicleEventCopyWith<$Res> {
  _$BasicVehicleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicVehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? type = null,
    Object? eventTime = null,
    Object? positionId = freezed,
    Object? geofenceId = freezed,
    Object? maintenanceId = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      eventTime: null == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      geofenceId: freezed == geofenceId
          ? _value.geofenceId
          : geofenceId // ignore: cast_nullable_to_non_nullable
              as int?,
      maintenanceId: freezed == maintenanceId
          ? _value.maintenanceId
          : maintenanceId // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasicVehicleEventImplCopyWith<$Res>
    implements $BasicVehicleEventCopyWith<$Res> {
  factory _$$BasicVehicleEventImplCopyWith(_$BasicVehicleEventImpl value,
          $Res Function(_$BasicVehicleEventImpl) then) =
      __$$BasicVehicleEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'deviceId') int deviceId,
      String type,
      @JsonKey(name: 'eventTime') DateTime eventTime,
      @JsonKey(name: 'positionId') int? positionId,
      @JsonKey(name: 'geofenceId') int? geofenceId,
      @JsonKey(name: 'maintenanceId') int? maintenanceId,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});
}

/// @nodoc
class __$$BasicVehicleEventImplCopyWithImpl<$Res>
    extends _$BasicVehicleEventCopyWithImpl<$Res, _$BasicVehicleEventImpl>
    implements _$$BasicVehicleEventImplCopyWith<$Res> {
  __$$BasicVehicleEventImplCopyWithImpl(_$BasicVehicleEventImpl _value,
      $Res Function(_$BasicVehicleEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BasicVehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? type = null,
    Object? eventTime = null,
    Object? positionId = freezed,
    Object? geofenceId = freezed,
    Object? maintenanceId = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$BasicVehicleEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      eventTime: null == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      geofenceId: freezed == geofenceId
          ? _value.geofenceId
          : geofenceId // ignore: cast_nullable_to_non_nullable
              as int?,
      maintenanceId: freezed == maintenanceId
          ? _value.maintenanceId
          : maintenanceId // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicVehicleEventImpl implements _BasicVehicleEvent {
  const _$BasicVehicleEventImpl(
      {required this.id,
      @JsonKey(name: 'deviceId') required this.deviceId,
      required this.type,
      @JsonKey(name: 'eventTime') required this.eventTime,
      @JsonKey(name: 'positionId') this.positionId,
      @JsonKey(name: 'geofenceId') this.geofenceId,
      @JsonKey(name: 'maintenanceId') this.maintenanceId,
      @JsonKey(name: 'attributes') final Map<String, dynamic>? attributes})
      : _attributes = attributes;

  factory _$BasicVehicleEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicVehicleEventImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'deviceId')
  final int deviceId;
  @override
  final String type;
  @override
  @JsonKey(name: 'eventTime')
  final DateTime eventTime;
  @override
  @JsonKey(name: 'positionId')
  final int? positionId;
  @override
  @JsonKey(name: 'geofenceId')
  final int? geofenceId;
  @override
  @JsonKey(name: 'maintenanceId')
  final int? maintenanceId;
  final Map<String, dynamic>? _attributes;
  @override
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BasicVehicleEvent(id: $id, deviceId: $deviceId, type: $type, eventTime: $eventTime, positionId: $positionId, geofenceId: $geofenceId, maintenanceId: $maintenanceId, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicVehicleEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.geofenceId, geofenceId) ||
                other.geofenceId == geofenceId) &&
            (identical(other.maintenanceId, maintenanceId) ||
                other.maintenanceId == maintenanceId) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      deviceId,
      type,
      eventTime,
      positionId,
      geofenceId,
      maintenanceId,
      const DeepCollectionEquality().hash(_attributes));

  /// Create a copy of BasicVehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicVehicleEventImplCopyWith<_$BasicVehicleEventImpl> get copyWith =>
      __$$BasicVehicleEventImplCopyWithImpl<_$BasicVehicleEventImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicVehicleEventImplToJson(
      this,
    );
  }
}

abstract class _BasicVehicleEvent implements BasicVehicleEvent {
  const factory _BasicVehicleEvent(
      {required final int id,
      @JsonKey(name: 'deviceId') required final int deviceId,
      required final String type,
      @JsonKey(name: 'eventTime') required final DateTime eventTime,
      @JsonKey(name: 'positionId') final int? positionId,
      @JsonKey(name: 'geofenceId') final int? geofenceId,
      @JsonKey(name: 'maintenanceId') final int? maintenanceId,
      @JsonKey(name: 'attributes')
      final Map<String, dynamic>? attributes}) = _$BasicVehicleEventImpl;

  factory _BasicVehicleEvent.fromJson(Map<String, dynamic> json) =
      _$BasicVehicleEventImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'deviceId')
  int get deviceId;
  @override
  String get type;
  @override
  @JsonKey(name: 'eventTime')
  DateTime get eventTime;
  @override
  @JsonKey(name: 'positionId')
  int? get positionId;
  @override
  @JsonKey(name: 'geofenceId')
  int? get geofenceId;
  @override
  @JsonKey(name: 'maintenanceId')
  int? get maintenanceId;
  @override
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes;

  /// Create a copy of BasicVehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicVehicleEventImplCopyWith<_$BasicVehicleEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
