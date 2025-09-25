// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleStop _$VehicleStopFromJson(Map<String, dynamic> json) {
  return _VehicleStop.fromJson(json);
}

/// @nodoc
mixin _$VehicleStop {
  int get deviceId => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  double get averageSpeed => throw _privateConstructorUsedError;
  double get maxSpeed => throw _privateConstructorUsedError;
  double get spentFuel => throw _privateConstructorUsedError;
  double get startOdometer => throw _privateConstructorUsedError;
  double get endOdometer => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get positionId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  Duration get duration => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  Duration get engineHours => throw _privateConstructorUsedError;

  /// Serializes this VehicleStop to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleStop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleStopCopyWith<VehicleStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleStopCopyWith<$Res> {
  factory $VehicleStopCopyWith(
          VehicleStop value, $Res Function(VehicleStop) then) =
      _$VehicleStopCopyWithImpl<$Res, VehicleStop>;
  @useResult
  $Res call(
      {int deviceId,
      String deviceName,
      double distance,
      double averageSpeed,
      double maxSpeed,
      double spentFuel,
      double startOdometer,
      double endOdometer,
      DateTime startTime,
      DateTime endTime,
      int positionId,
      double latitude,
      double longitude,
      String? address,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      Duration duration,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      Duration engineHours});
}

/// @nodoc
class _$VehicleStopCopyWithImpl<$Res, $Val extends VehicleStop>
    implements $VehicleStopCopyWith<$Res> {
  _$VehicleStopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleStop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? distance = null,
    Object? averageSpeed = null,
    Object? maxSpeed = null,
    Object? spentFuel = null,
    Object? startOdometer = null,
    Object? endOdometer = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? positionId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? duration = null,
    Object? engineHours = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      averageSpeed: null == averageSpeed
          ? _value.averageSpeed
          : averageSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      maxSpeed: null == maxSpeed
          ? _value.maxSpeed
          : maxSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      spentFuel: null == spentFuel
          ? _value.spentFuel
          : spentFuel // ignore: cast_nullable_to_non_nullable
              as double,
      startOdometer: null == startOdometer
          ? _value.startOdometer
          : startOdometer // ignore: cast_nullable_to_non_nullable
              as double,
      endOdometer: null == endOdometer
          ? _value.endOdometer
          : endOdometer // ignore: cast_nullable_to_non_nullable
              as double,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      positionId: null == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      engineHours: null == engineHours
          ? _value.engineHours
          : engineHours // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleStopImplCopyWith<$Res>
    implements $VehicleStopCopyWith<$Res> {
  factory _$$VehicleStopImplCopyWith(
          _$VehicleStopImpl value, $Res Function(_$VehicleStopImpl) then) =
      __$$VehicleStopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int deviceId,
      String deviceName,
      double distance,
      double averageSpeed,
      double maxSpeed,
      double spentFuel,
      double startOdometer,
      double endOdometer,
      DateTime startTime,
      DateTime endTime,
      int positionId,
      double latitude,
      double longitude,
      String? address,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      Duration duration,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      Duration engineHours});
}

/// @nodoc
class __$$VehicleStopImplCopyWithImpl<$Res>
    extends _$VehicleStopCopyWithImpl<$Res, _$VehicleStopImpl>
    implements _$$VehicleStopImplCopyWith<$Res> {
  __$$VehicleStopImplCopyWithImpl(
      _$VehicleStopImpl _value, $Res Function(_$VehicleStopImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleStop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? distance = null,
    Object? averageSpeed = null,
    Object? maxSpeed = null,
    Object? spentFuel = null,
    Object? startOdometer = null,
    Object? endOdometer = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? positionId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? duration = null,
    Object? engineHours = null,
  }) {
    return _then(_$VehicleStopImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      averageSpeed: null == averageSpeed
          ? _value.averageSpeed
          : averageSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      maxSpeed: null == maxSpeed
          ? _value.maxSpeed
          : maxSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      spentFuel: null == spentFuel
          ? _value.spentFuel
          : spentFuel // ignore: cast_nullable_to_non_nullable
              as double,
      startOdometer: null == startOdometer
          ? _value.startOdometer
          : startOdometer // ignore: cast_nullable_to_non_nullable
              as double,
      endOdometer: null == endOdometer
          ? _value.endOdometer
          : endOdometer // ignore: cast_nullable_to_non_nullable
              as double,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      positionId: null == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      engineHours: null == engineHours
          ? _value.engineHours
          : engineHours // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleStopImpl extends _VehicleStop {
  const _$VehicleStopImpl(
      {required this.deviceId,
      required this.deviceName,
      required this.distance,
      required this.averageSpeed,
      required this.maxSpeed,
      required this.spentFuel,
      required this.startOdometer,
      required this.endOdometer,
      required this.startTime,
      required this.endTime,
      required this.positionId,
      required this.latitude,
      required this.longitude,
      required this.address,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      required this.duration,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      required this.engineHours})
      : super._();

  factory _$VehicleStopImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleStopImplFromJson(json);

  @override
  final int deviceId;
  @override
  final String deviceName;
  @override
  final double distance;
  @override
  final double averageSpeed;
  @override
  final double maxSpeed;
  @override
  final double spentFuel;
  @override
  final double startOdometer;
  @override
  final double endOdometer;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int positionId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? address;
  @override
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  final Duration duration;
  @override
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  final Duration engineHours;

  @override
  String toString() {
    return 'VehicleStop(deviceId: $deviceId, deviceName: $deviceName, distance: $distance, averageSpeed: $averageSpeed, maxSpeed: $maxSpeed, spentFuel: $spentFuel, startOdometer: $startOdometer, endOdometer: $endOdometer, startTime: $startTime, endTime: $endTime, positionId: $positionId, latitude: $latitude, longitude: $longitude, address: $address, duration: $duration, engineHours: $engineHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleStopImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.averageSpeed, averageSpeed) ||
                other.averageSpeed == averageSpeed) &&
            (identical(other.maxSpeed, maxSpeed) ||
                other.maxSpeed == maxSpeed) &&
            (identical(other.spentFuel, spentFuel) ||
                other.spentFuel == spentFuel) &&
            (identical(other.startOdometer, startOdometer) ||
                other.startOdometer == startOdometer) &&
            (identical(other.endOdometer, endOdometer) ||
                other.endOdometer == endOdometer) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.engineHours, engineHours) ||
                other.engineHours == engineHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      deviceName,
      distance,
      averageSpeed,
      maxSpeed,
      spentFuel,
      startOdometer,
      endOdometer,
      startTime,
      endTime,
      positionId,
      latitude,
      longitude,
      address,
      duration,
      engineHours);

  /// Create a copy of VehicleStop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleStopImplCopyWith<_$VehicleStopImpl> get copyWith =>
      __$$VehicleStopImplCopyWithImpl<_$VehicleStopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleStopImplToJson(
      this,
    );
  }
}

abstract class _VehicleStop extends VehicleStop {
  const factory _VehicleStop(
      {required final int deviceId,
      required final String deviceName,
      required final double distance,
      required final double averageSpeed,
      required final double maxSpeed,
      required final double spentFuel,
      required final double startOdometer,
      required final double endOdometer,
      required final DateTime startTime,
      required final DateTime endTime,
      required final int positionId,
      required final double latitude,
      required final double longitude,
      required final String? address,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      required final Duration duration,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      required final Duration engineHours}) = _$VehicleStopImpl;
  const _VehicleStop._() : super._();

  factory _VehicleStop.fromJson(Map<String, dynamic> json) =
      _$VehicleStopImpl.fromJson;

  @override
  int get deviceId;
  @override
  String get deviceName;
  @override
  double get distance;
  @override
  double get averageSpeed;
  @override
  double get maxSpeed;
  @override
  double get spentFuel;
  @override
  double get startOdometer;
  @override
  double get endOdometer;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get positionId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get address;
  @override
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  Duration get duration;
  @override
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  Duration get engineHours;

  /// Create a copy of VehicleStop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleStopImplCopyWith<_$VehicleStopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
