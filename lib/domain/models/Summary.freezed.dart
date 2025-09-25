// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
mixin _$Summary {
  int? get deviceId => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance')
  double? get distanceInMeter => throw _privateConstructorUsedError;
  @JsonKey(name: 'averageSpeed')
  double? get averageSpeedInKnots => throw _privateConstructorUsedError;
  double? get maxSpeed => throw _privateConstructorUsedError;
  double? get spentFuel => throw _privateConstructorUsedError;
  double? get startOdometer => throw _privateConstructorUsedError;
  double? get endOdometer => throw _privateConstructorUsedError;
  @JsonKey(name: 'engineHours')
  int? get engineHoursInMilliSec => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get stopCount => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get stopDuration => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get tripCount => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get tripDuration => throw _privateConstructorUsedError;

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call(
      {int? deviceId,
      String? deviceName,
      @JsonKey(name: 'distance') double? distanceInMeter,
      @JsonKey(name: 'averageSpeed') double? averageSpeedInKnots,
      double? maxSpeed,
      double? spentFuel,
      double? startOdometer,
      double? endOdometer,
      @JsonKey(name: 'engineHours') int? engineHoursInMilliSec,
      DateTime? startTime,
      DateTime? endTime,
      @JsonKey(includeFromJson: false, includeToJson: false) int? stopCount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Duration? stopDuration,
      @JsonKey(includeFromJson: false, includeToJson: false) int? tripCount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Duration? tripDuration});
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? distanceInMeter = freezed,
    Object? averageSpeedInKnots = freezed,
    Object? maxSpeed = freezed,
    Object? spentFuel = freezed,
    Object? startOdometer = freezed,
    Object? endOdometer = freezed,
    Object? engineHoursInMilliSec = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? stopCount = freezed,
    Object? stopDuration = freezed,
    Object? tripCount = freezed,
    Object? tripDuration = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceInMeter: freezed == distanceInMeter
          ? _value.distanceInMeter
          : distanceInMeter // ignore: cast_nullable_to_non_nullable
              as double?,
      averageSpeedInKnots: freezed == averageSpeedInKnots
          ? _value.averageSpeedInKnots
          : averageSpeedInKnots // ignore: cast_nullable_to_non_nullable
              as double?,
      maxSpeed: freezed == maxSpeed
          ? _value.maxSpeed
          : maxSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      spentFuel: freezed == spentFuel
          ? _value.spentFuel
          : spentFuel // ignore: cast_nullable_to_non_nullable
              as double?,
      startOdometer: freezed == startOdometer
          ? _value.startOdometer
          : startOdometer // ignore: cast_nullable_to_non_nullable
              as double?,
      endOdometer: freezed == endOdometer
          ? _value.endOdometer
          : endOdometer // ignore: cast_nullable_to_non_nullable
              as double?,
      engineHoursInMilliSec: freezed == engineHoursInMilliSec
          ? _value.engineHoursInMilliSec
          : engineHoursInMilliSec // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopCount: freezed == stopCount
          ? _value.stopCount
          : stopCount // ignore: cast_nullable_to_non_nullable
              as int?,
      stopDuration: freezed == stopDuration
          ? _value.stopDuration
          : stopDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      tripCount: freezed == tripCount
          ? _value.tripCount
          : tripCount // ignore: cast_nullable_to_non_nullable
              as int?,
      tripDuration: freezed == tripDuration
          ? _value.tripDuration
          : tripDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
          _$SummaryImpl value, $Res Function(_$SummaryImpl) then) =
      __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? deviceId,
      String? deviceName,
      @JsonKey(name: 'distance') double? distanceInMeter,
      @JsonKey(name: 'averageSpeed') double? averageSpeedInKnots,
      double? maxSpeed,
      double? spentFuel,
      double? startOdometer,
      double? endOdometer,
      @JsonKey(name: 'engineHours') int? engineHoursInMilliSec,
      DateTime? startTime,
      DateTime? endTime,
      @JsonKey(includeFromJson: false, includeToJson: false) int? stopCount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Duration? stopDuration,
      @JsonKey(includeFromJson: false, includeToJson: false) int? tripCount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Duration? tripDuration});
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
      _$SummaryImpl _value, $Res Function(_$SummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? distanceInMeter = freezed,
    Object? averageSpeedInKnots = freezed,
    Object? maxSpeed = freezed,
    Object? spentFuel = freezed,
    Object? startOdometer = freezed,
    Object? endOdometer = freezed,
    Object? engineHoursInMilliSec = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? stopCount = freezed,
    Object? stopDuration = freezed,
    Object? tripCount = freezed,
    Object? tripDuration = freezed,
  }) {
    return _then(_$SummaryImpl(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      distanceInMeter: freezed == distanceInMeter
          ? _value.distanceInMeter
          : distanceInMeter // ignore: cast_nullable_to_non_nullable
              as double?,
      averageSpeedInKnots: freezed == averageSpeedInKnots
          ? _value.averageSpeedInKnots
          : averageSpeedInKnots // ignore: cast_nullable_to_non_nullable
              as double?,
      maxSpeed: freezed == maxSpeed
          ? _value.maxSpeed
          : maxSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      spentFuel: freezed == spentFuel
          ? _value.spentFuel
          : spentFuel // ignore: cast_nullable_to_non_nullable
              as double?,
      startOdometer: freezed == startOdometer
          ? _value.startOdometer
          : startOdometer // ignore: cast_nullable_to_non_nullable
              as double?,
      endOdometer: freezed == endOdometer
          ? _value.endOdometer
          : endOdometer // ignore: cast_nullable_to_non_nullable
              as double?,
      engineHoursInMilliSec: freezed == engineHoursInMilliSec
          ? _value.engineHoursInMilliSec
          : engineHoursInMilliSec // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stopCount: freezed == stopCount
          ? _value.stopCount
          : stopCount // ignore: cast_nullable_to_non_nullable
              as int?,
      stopDuration: freezed == stopDuration
          ? _value.stopDuration
          : stopDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      tripCount: freezed == tripCount
          ? _value.tripCount
          : tripCount // ignore: cast_nullable_to_non_nullable
              as int?,
      tripDuration: freezed == tripDuration
          ? _value.tripDuration
          : tripDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryImpl extends _Summary {
  const _$SummaryImpl(
      {this.deviceId,
      this.deviceName,
      @JsonKey(name: 'distance') this.distanceInMeter,
      @JsonKey(name: 'averageSpeed') this.averageSpeedInKnots,
      this.maxSpeed,
      this.spentFuel,
      this.startOdometer,
      this.endOdometer,
      @JsonKey(name: 'engineHours') this.engineHoursInMilliSec,
      this.startTime,
      this.endTime,
      @JsonKey(includeFromJson: false, includeToJson: false) this.stopCount,
      @JsonKey(includeFromJson: false, includeToJson: false) this.stopDuration,
      @JsonKey(includeFromJson: false, includeToJson: false) this.tripCount,
      @JsonKey(includeFromJson: false, includeToJson: false) this.tripDuration})
      : super._();

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  @override
  final int? deviceId;
  @override
  final String? deviceName;
  @override
  @JsonKey(name: 'distance')
  final double? distanceInMeter;
  @override
  @JsonKey(name: 'averageSpeed')
  final double? averageSpeedInKnots;
  @override
  final double? maxSpeed;
  @override
  final double? spentFuel;
  @override
  final double? startOdometer;
  @override
  final double? endOdometer;
  @override
  @JsonKey(name: 'engineHours')
  final int? engineHoursInMilliSec;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? stopCount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Duration? stopDuration;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? tripCount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Duration? tripDuration;

  @override
  String toString() {
    return 'Summary(deviceId: $deviceId, deviceName: $deviceName, distanceInMeter: $distanceInMeter, averageSpeedInKnots: $averageSpeedInKnots, maxSpeed: $maxSpeed, spentFuel: $spentFuel, startOdometer: $startOdometer, endOdometer: $endOdometer, engineHoursInMilliSec: $engineHoursInMilliSec, startTime: $startTime, endTime: $endTime, stopCount: $stopCount, stopDuration: $stopDuration, tripCount: $tripCount, tripDuration: $tripDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.distanceInMeter, distanceInMeter) ||
                other.distanceInMeter == distanceInMeter) &&
            (identical(other.averageSpeedInKnots, averageSpeedInKnots) ||
                other.averageSpeedInKnots == averageSpeedInKnots) &&
            (identical(other.maxSpeed, maxSpeed) ||
                other.maxSpeed == maxSpeed) &&
            (identical(other.spentFuel, spentFuel) ||
                other.spentFuel == spentFuel) &&
            (identical(other.startOdometer, startOdometer) ||
                other.startOdometer == startOdometer) &&
            (identical(other.endOdometer, endOdometer) ||
                other.endOdometer == endOdometer) &&
            (identical(other.engineHoursInMilliSec, engineHoursInMilliSec) ||
                other.engineHoursInMilliSec == engineHoursInMilliSec) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.stopCount, stopCount) ||
                other.stopCount == stopCount) &&
            (identical(other.stopDuration, stopDuration) ||
                other.stopDuration == stopDuration) &&
            (identical(other.tripCount, tripCount) ||
                other.tripCount == tripCount) &&
            (identical(other.tripDuration, tripDuration) ||
                other.tripDuration == tripDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      deviceName,
      distanceInMeter,
      averageSpeedInKnots,
      maxSpeed,
      spentFuel,
      startOdometer,
      endOdometer,
      engineHoursInMilliSec,
      startTime,
      endTime,
      stopCount,
      stopDuration,
      tripCount,
      tripDuration);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImplToJson(
      this,
    );
  }
}

abstract class _Summary extends Summary {
  const factory _Summary(
      {final int? deviceId,
      final String? deviceName,
      @JsonKey(name: 'distance') final double? distanceInMeter,
      @JsonKey(name: 'averageSpeed') final double? averageSpeedInKnots,
      final double? maxSpeed,
      final double? spentFuel,
      final double? startOdometer,
      final double? endOdometer,
      @JsonKey(name: 'engineHours') final int? engineHoursInMilliSec,
      final DateTime? startTime,
      final DateTime? endTime,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int? stopCount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Duration? stopDuration,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int? tripCount,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Duration? tripDuration}) = _$SummaryImpl;
  const _Summary._() : super._();

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  @override
  int? get deviceId;
  @override
  String? get deviceName;
  @override
  @JsonKey(name: 'distance')
  double? get distanceInMeter;
  @override
  @JsonKey(name: 'averageSpeed')
  double? get averageSpeedInKnots;
  @override
  double? get maxSpeed;
  @override
  double? get spentFuel;
  @override
  double? get startOdometer;
  @override
  double? get endOdometer;
  @override
  @JsonKey(name: 'engineHours')
  int? get engineHoursInMilliSec;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get stopCount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get stopDuration;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get tripCount;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration? get tripDuration;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
