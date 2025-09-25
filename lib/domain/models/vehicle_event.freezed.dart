// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleEvent _$VehicleEventFromJson(Map<String, dynamic> json) {
  return _VehicleEvent.fromJson(json);
}

/// @nodoc
mixin _$VehicleEvent {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceid')
  int get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'devicename', defaultValue: 'Unknown')
  String? get deviceName => throw _privateConstructorUsedError; // changed here
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventtime')
  DateTime get eventTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'positionid')
  int? get positionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'geofenceid')
  int? get geofenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintenanceid')
  int? get maintenanceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;

  /// Serializes this VehicleEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleEventCopyWith<VehicleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleEventCopyWith<$Res> {
  factory $VehicleEventCopyWith(
          VehicleEvent value, $Res Function(VehicleEvent) then) =
      _$VehicleEventCopyWithImpl<$Res, VehicleEvent>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'deviceid') int deviceId,
      @JsonKey(name: 'devicename', defaultValue: 'Unknown') String? deviceName,
      String type,
      @JsonKey(name: 'eventtime') DateTime eventTime,
      @JsonKey(name: 'positionid') int? positionId,
      @JsonKey(name: 'geofenceid') int? geofenceId,
      @JsonKey(name: 'maintenanceid') int? maintenanceId,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});
}

/// @nodoc
class _$VehicleEventCopyWithImpl<$Res, $Val extends VehicleEvent>
    implements $VehicleEventCopyWith<$Res> {
  _$VehicleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? deviceName = freezed,
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
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$VehicleEventImplCopyWith<$Res>
    implements $VehicleEventCopyWith<$Res> {
  factory _$$VehicleEventImplCopyWith(
          _$VehicleEventImpl value, $Res Function(_$VehicleEventImpl) then) =
      __$$VehicleEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'deviceid') int deviceId,
      @JsonKey(name: 'devicename', defaultValue: 'Unknown') String? deviceName,
      String type,
      @JsonKey(name: 'eventtime') DateTime eventTime,
      @JsonKey(name: 'positionid') int? positionId,
      @JsonKey(name: 'geofenceid') int? geofenceId,
      @JsonKey(name: 'maintenanceid') int? maintenanceId,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});
}

/// @nodoc
class __$$VehicleEventImplCopyWithImpl<$Res>
    extends _$VehicleEventCopyWithImpl<$Res, _$VehicleEventImpl>
    implements _$$VehicleEventImplCopyWith<$Res> {
  __$$VehicleEventImplCopyWithImpl(
      _$VehicleEventImpl _value, $Res Function(_$VehicleEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? deviceName = freezed,
    Object? type = null,
    Object? eventTime = null,
    Object? positionId = freezed,
    Object? geofenceId = freezed,
    Object? maintenanceId = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$VehicleEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$VehicleEventImpl implements _VehicleEvent {
  const _$VehicleEventImpl(
      {required this.id,
      @JsonKey(name: 'deviceid') required this.deviceId,
      @JsonKey(name: 'devicename', defaultValue: 'Unknown') this.deviceName,
      required this.type,
      @JsonKey(name: 'eventtime') required this.eventTime,
      @JsonKey(name: 'positionid') this.positionId,
      @JsonKey(name: 'geofenceid') this.geofenceId,
      @JsonKey(name: 'maintenanceid') this.maintenanceId,
      @JsonKey(name: 'attributes') final Map<String, dynamic>? attributes})
      : _attributes = attributes;

  factory _$VehicleEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleEventImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'deviceid')
  final int deviceId;
  @override
  @JsonKey(name: 'devicename', defaultValue: 'Unknown')
  final String? deviceName;
// changed here
  @override
  final String type;
  @override
  @JsonKey(name: 'eventtime')
  final DateTime eventTime;
  @override
  @JsonKey(name: 'positionid')
  final int? positionId;
  @override
  @JsonKey(name: 'geofenceid')
  final int? geofenceId;
  @override
  @JsonKey(name: 'maintenanceid')
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
    return 'VehicleEvent(id: $id, deviceId: $deviceId, deviceName: $deviceName, type: $type, eventTime: $eventTime, positionId: $positionId, geofenceId: $geofenceId, maintenanceId: $maintenanceId, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
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
      deviceName,
      type,
      eventTime,
      positionId,
      geofenceId,
      maintenanceId,
      const DeepCollectionEquality().hash(_attributes));

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleEventImplCopyWith<_$VehicleEventImpl> get copyWith =>
      __$$VehicleEventImplCopyWithImpl<_$VehicleEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleEventImplToJson(
      this,
    );
  }
}

abstract class _VehicleEvent implements VehicleEvent {
  const factory _VehicleEvent(
      {required final int id,
      @JsonKey(name: 'deviceid') required final int deviceId,
      @JsonKey(name: 'devicename', defaultValue: 'Unknown')
      final String? deviceName,
      required final String type,
      @JsonKey(name: 'eventtime') required final DateTime eventTime,
      @JsonKey(name: 'positionid') final int? positionId,
      @JsonKey(name: 'geofenceid') final int? geofenceId,
      @JsonKey(name: 'maintenanceid') final int? maintenanceId,
      @JsonKey(name: 'attributes')
      final Map<String, dynamic>? attributes}) = _$VehicleEventImpl;

  factory _VehicleEvent.fromJson(Map<String, dynamic> json) =
      _$VehicleEventImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'deviceid')
  int get deviceId;
  @override
  @JsonKey(name: 'devicename', defaultValue: 'Unknown')
  String? get deviceName; // changed here
  @override
  String get type;
  @override
  @JsonKey(name: 'eventtime')
  DateTime get eventTime;
  @override
  @JsonKey(name: 'positionid')
  int? get positionId;
  @override
  @JsonKey(name: 'geofenceid')
  int? get geofenceId;
  @override
  @JsonKey(name: 'maintenanceid')
  int? get maintenanceId;
  @override
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes;

  /// Create a copy of VehicleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleEventImplCopyWith<_$VehicleEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
