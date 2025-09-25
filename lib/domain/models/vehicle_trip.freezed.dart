// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleTrip _$VehicleTripFromJson(Map<String, dynamic> json) {
  return _VehicleTrip.fromJson(json);
}

/// @nodoc
mixin _$VehicleTrip {
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
  int get startPositionId => throw _privateConstructorUsedError;
  int get endPositionId => throw _privateConstructorUsedError;
  double get startLat => throw _privateConstructorUsedError;
  double get startLon => throw _privateConstructorUsedError;
  double get endLat => throw _privateConstructorUsedError;
  double get endLon => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'Unavailable')
  String get startAddress => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'Unavailable')
  String get endAddress => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  Duration get duration => throw _privateConstructorUsedError;
  String? get driverUniqueId => throw _privateConstructorUsedError;
  String? get driverName => throw _privateConstructorUsedError;

  /// Serializes this VehicleTrip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleTrip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleTripCopyWith<VehicleTrip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleTripCopyWith<$Res> {
  factory $VehicleTripCopyWith(
          VehicleTrip value, $Res Function(VehicleTrip) then) =
      _$VehicleTripCopyWithImpl<$Res, VehicleTrip>;
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
      int startPositionId,
      int endPositionId,
      double startLat,
      double startLon,
      double endLat,
      double endLon,
      @JsonKey(defaultValue: 'Unavailable') String startAddress,
      @JsonKey(defaultValue: 'Unavailable') String endAddress,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      Duration duration,
      String? driverUniqueId,
      String? driverName});
}

/// @nodoc
class _$VehicleTripCopyWithImpl<$Res, $Val extends VehicleTrip>
    implements $VehicleTripCopyWith<$Res> {
  _$VehicleTripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleTrip
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
    Object? startPositionId = null,
    Object? endPositionId = null,
    Object? startLat = null,
    Object? startLon = null,
    Object? endLat = null,
    Object? endLon = null,
    Object? startAddress = null,
    Object? endAddress = null,
    Object? duration = null,
    Object? driverUniqueId = freezed,
    Object? driverName = freezed,
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
      startPositionId: null == startPositionId
          ? _value.startPositionId
          : startPositionId // ignore: cast_nullable_to_non_nullable
              as int,
      endPositionId: null == endPositionId
          ? _value.endPositionId
          : endPositionId // ignore: cast_nullable_to_non_nullable
              as int,
      startLat: null == startLat
          ? _value.startLat
          : startLat // ignore: cast_nullable_to_non_nullable
              as double,
      startLon: null == startLon
          ? _value.startLon
          : startLon // ignore: cast_nullable_to_non_nullable
              as double,
      endLat: null == endLat
          ? _value.endLat
          : endLat // ignore: cast_nullable_to_non_nullable
              as double,
      endLon: null == endLon
          ? _value.endLon
          : endLon // ignore: cast_nullable_to_non_nullable
              as double,
      startAddress: null == startAddress
          ? _value.startAddress
          : startAddress // ignore: cast_nullable_to_non_nullable
              as String,
      endAddress: null == endAddress
          ? _value.endAddress
          : endAddress // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      driverUniqueId: freezed == driverUniqueId
          ? _value.driverUniqueId
          : driverUniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleTripImplCopyWith<$Res>
    implements $VehicleTripCopyWith<$Res> {
  factory _$$VehicleTripImplCopyWith(
          _$VehicleTripImpl value, $Res Function(_$VehicleTripImpl) then) =
      __$$VehicleTripImplCopyWithImpl<$Res>;
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
      int startPositionId,
      int endPositionId,
      double startLat,
      double startLon,
      double endLat,
      double endLon,
      @JsonKey(defaultValue: 'Unavailable') String startAddress,
      @JsonKey(defaultValue: 'Unavailable') String endAddress,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      Duration duration,
      String? driverUniqueId,
      String? driverName});
}

/// @nodoc
class __$$VehicleTripImplCopyWithImpl<$Res>
    extends _$VehicleTripCopyWithImpl<$Res, _$VehicleTripImpl>
    implements _$$VehicleTripImplCopyWith<$Res> {
  __$$VehicleTripImplCopyWithImpl(
      _$VehicleTripImpl _value, $Res Function(_$VehicleTripImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleTrip
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
    Object? startPositionId = null,
    Object? endPositionId = null,
    Object? startLat = null,
    Object? startLon = null,
    Object? endLat = null,
    Object? endLon = null,
    Object? startAddress = null,
    Object? endAddress = null,
    Object? duration = null,
    Object? driverUniqueId = freezed,
    Object? driverName = freezed,
  }) {
    return _then(_$VehicleTripImpl(
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
      startPositionId: null == startPositionId
          ? _value.startPositionId
          : startPositionId // ignore: cast_nullable_to_non_nullable
              as int,
      endPositionId: null == endPositionId
          ? _value.endPositionId
          : endPositionId // ignore: cast_nullable_to_non_nullable
              as int,
      startLat: null == startLat
          ? _value.startLat
          : startLat // ignore: cast_nullable_to_non_nullable
              as double,
      startLon: null == startLon
          ? _value.startLon
          : startLon // ignore: cast_nullable_to_non_nullable
              as double,
      endLat: null == endLat
          ? _value.endLat
          : endLat // ignore: cast_nullable_to_non_nullable
              as double,
      endLon: null == endLon
          ? _value.endLon
          : endLon // ignore: cast_nullable_to_non_nullable
              as double,
      startAddress: null == startAddress
          ? _value.startAddress
          : startAddress // ignore: cast_nullable_to_non_nullable
              as String,
      endAddress: null == endAddress
          ? _value.endAddress
          : endAddress // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      driverUniqueId: freezed == driverUniqueId
          ? _value.driverUniqueId
          : driverUniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleTripImpl extends _VehicleTrip {
  const _$VehicleTripImpl(
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
      required this.startPositionId,
      required this.endPositionId,
      required this.startLat,
      required this.startLon,
      required this.endLat,
      required this.endLon,
      @JsonKey(defaultValue: 'Unavailable') required this.startAddress,
      @JsonKey(defaultValue: 'Unavailable') required this.endAddress,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      required this.duration,
      this.driverUniqueId,
      this.driverName})
      : super._();

  factory _$VehicleTripImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleTripImplFromJson(json);

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
  final int startPositionId;
  @override
  final int endPositionId;
  @override
  final double startLat;
  @override
  final double startLon;
  @override
  final double endLat;
  @override
  final double endLon;
  @override
  @JsonKey(defaultValue: 'Unavailable')
  final String startAddress;
  @override
  @JsonKey(defaultValue: 'Unavailable')
  final String endAddress;
  @override
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  final Duration duration;
  @override
  final String? driverUniqueId;
  @override
  final String? driverName;

  @override
  String toString() {
    return 'VehicleTrip(deviceId: $deviceId, deviceName: $deviceName, distance: $distance, averageSpeed: $averageSpeed, maxSpeed: $maxSpeed, spentFuel: $spentFuel, startOdometer: $startOdometer, endOdometer: $endOdometer, startTime: $startTime, endTime: $endTime, startPositionId: $startPositionId, endPositionId: $endPositionId, startLat: $startLat, startLon: $startLon, endLat: $endLat, endLon: $endLon, startAddress: $startAddress, endAddress: $endAddress, duration: $duration, driverUniqueId: $driverUniqueId, driverName: $driverName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleTripImpl &&
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
            (identical(other.startPositionId, startPositionId) ||
                other.startPositionId == startPositionId) &&
            (identical(other.endPositionId, endPositionId) ||
                other.endPositionId == endPositionId) &&
            (identical(other.startLat, startLat) ||
                other.startLat == startLat) &&
            (identical(other.startLon, startLon) ||
                other.startLon == startLon) &&
            (identical(other.endLat, endLat) || other.endLat == endLat) &&
            (identical(other.endLon, endLon) || other.endLon == endLon) &&
            (identical(other.startAddress, startAddress) ||
                other.startAddress == startAddress) &&
            (identical(other.endAddress, endAddress) ||
                other.endAddress == endAddress) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.driverUniqueId, driverUniqueId) ||
                other.driverUniqueId == driverUniqueId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        startPositionId,
        endPositionId,
        startLat,
        startLon,
        endLat,
        endLon,
        startAddress,
        endAddress,
        duration,
        driverUniqueId,
        driverName
      ]);

  /// Create a copy of VehicleTrip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleTripImplCopyWith<_$VehicleTripImpl> get copyWith =>
      __$$VehicleTripImplCopyWithImpl<_$VehicleTripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleTripImplToJson(
      this,
    );
  }
}

abstract class _VehicleTrip extends VehicleTrip {
  const factory _VehicleTrip(
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
      required final int startPositionId,
      required final int endPositionId,
      required final double startLat,
      required final double startLon,
      required final double endLat,
      required final double endLon,
      @JsonKey(defaultValue: 'Unavailable') required final String startAddress,
      @JsonKey(defaultValue: 'Unavailable') required final String endAddress,
      @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
      required final Duration duration,
      final String? driverUniqueId,
      final String? driverName}) = _$VehicleTripImpl;
  const _VehicleTrip._() : super._();

  factory _VehicleTrip.fromJson(Map<String, dynamic> json) =
      _$VehicleTripImpl.fromJson;

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
  int get startPositionId;
  @override
  int get endPositionId;
  @override
  double get startLat;
  @override
  double get startLon;
  @override
  double get endLat;
  @override
  double get endLon;
  @override
  @JsonKey(defaultValue: 'Unavailable')
  String get startAddress;
  @override
  @JsonKey(defaultValue: 'Unavailable')
  String get endAddress;
  @override
  @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
  Duration get duration;
  @override
  String? get driverUniqueId;
  @override
  String? get driverName;

  /// Create a copy of VehicleTrip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleTripImplCopyWith<_$VehicleTripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
