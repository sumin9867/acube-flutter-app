// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PinInformation {
  String? get pinPath => throw _privateConstructorUsedError;
  String? get avatarPath => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get updatedTime => throw _privateConstructorUsedError;
  LatLng? get location => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get speed => throw _privateConstructorUsedError;
  Color? get labelColor => throw _privateConstructorUsedError;
  String? get batteryLevel => throw _privateConstructorUsedError;
  bool? get ignition => throw _privateConstructorUsedError;
  bool? get charging => throw _privateConstructorUsedError;
  int? get deviceId => throw _privateConstructorUsedError;
  bool? get blocked => throw _privateConstructorUsedError;
  String? get calcTotalDist => throw _privateConstructorUsedError;
  Device? get device => throw _privateConstructorUsedError;

  /// Create a copy of PinInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PinInformationCopyWith<PinInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinInformationCopyWith<$Res> {
  factory $PinInformationCopyWith(
          PinInformation value, $Res Function(PinInformation) then) =
      _$PinInformationCopyWithImpl<$Res, PinInformation>;
  @useResult
  $Res call(
      {String? pinPath,
      String? avatarPath,
      String? address,
      String? updatedTime,
      LatLng? location,
      String? status,
      String? name,
      String? speed,
      Color? labelColor,
      String? batteryLevel,
      bool? ignition,
      bool? charging,
      int? deviceId,
      bool? blocked,
      String? calcTotalDist,
      Device? device});

  $DeviceCopyWith<$Res>? get device;
}

/// @nodoc
class _$PinInformationCopyWithImpl<$Res, $Val extends PinInformation>
    implements $PinInformationCopyWith<$Res> {
  _$PinInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PinInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinPath = freezed,
    Object? avatarPath = freezed,
    Object? address = freezed,
    Object? updatedTime = freezed,
    Object? location = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? speed = freezed,
    Object? labelColor = freezed,
    Object? batteryLevel = freezed,
    Object? ignition = freezed,
    Object? charging = freezed,
    Object? deviceId = freezed,
    Object? blocked = freezed,
    Object? calcTotalDist = freezed,
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      pinPath: freezed == pinPath
          ? _value.pinPath
          : pinPath // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedTime: freezed == updatedTime
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String?,
      labelColor: freezed == labelColor
          ? _value.labelColor
          : labelColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      ignition: freezed == ignition
          ? _value.ignition
          : ignition // ignore: cast_nullable_to_non_nullable
              as bool?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      calcTotalDist: freezed == calcTotalDist
          ? _value.calcTotalDist
          : calcTotalDist // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device?,
    ) as $Val);
  }

  /// Create a copy of PinInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PinInformationImplCopyWith<$Res>
    implements $PinInformationCopyWith<$Res> {
  factory _$$PinInformationImplCopyWith(_$PinInformationImpl value,
          $Res Function(_$PinInformationImpl) then) =
      __$$PinInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pinPath,
      String? avatarPath,
      String? address,
      String? updatedTime,
      LatLng? location,
      String? status,
      String? name,
      String? speed,
      Color? labelColor,
      String? batteryLevel,
      bool? ignition,
      bool? charging,
      int? deviceId,
      bool? blocked,
      String? calcTotalDist,
      Device? device});

  @override
  $DeviceCopyWith<$Res>? get device;
}

/// @nodoc
class __$$PinInformationImplCopyWithImpl<$Res>
    extends _$PinInformationCopyWithImpl<$Res, _$PinInformationImpl>
    implements _$$PinInformationImplCopyWith<$Res> {
  __$$PinInformationImplCopyWithImpl(
      _$PinInformationImpl _value, $Res Function(_$PinInformationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PinInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinPath = freezed,
    Object? avatarPath = freezed,
    Object? address = freezed,
    Object? updatedTime = freezed,
    Object? location = freezed,
    Object? status = freezed,
    Object? name = freezed,
    Object? speed = freezed,
    Object? labelColor = freezed,
    Object? batteryLevel = freezed,
    Object? ignition = freezed,
    Object? charging = freezed,
    Object? deviceId = freezed,
    Object? blocked = freezed,
    Object? calcTotalDist = freezed,
    Object? device = freezed,
  }) {
    return _then(_$PinInformationImpl(
      pinPath: freezed == pinPath
          ? _value.pinPath
          : pinPath // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedTime: freezed == updatedTime
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String?,
      labelColor: freezed == labelColor
          ? _value.labelColor
          : labelColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      ignition: freezed == ignition
          ? _value.ignition
          : ignition // ignore: cast_nullable_to_non_nullable
              as bool?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      calcTotalDist: freezed == calcTotalDist
          ? _value.calcTotalDist
          : calcTotalDist // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device?,
    ));
  }
}

/// @nodoc

class _$PinInformationImpl implements _PinInformation {
  const _$PinInformationImpl(
      {this.pinPath,
      this.avatarPath,
      this.address,
      this.updatedTime,
      this.location,
      this.status,
      this.name,
      this.speed,
      this.labelColor,
      this.batteryLevel,
      this.ignition,
      this.charging,
      this.deviceId,
      this.blocked,
      this.calcTotalDist,
      this.device});

  @override
  final String? pinPath;
  @override
  final String? avatarPath;
  @override
  final String? address;
  @override
  final String? updatedTime;
  @override
  final LatLng? location;
  @override
  final String? status;
  @override
  final String? name;
  @override
  final String? speed;
  @override
  final Color? labelColor;
  @override
  final String? batteryLevel;
  @override
  final bool? ignition;
  @override
  final bool? charging;
  @override
  final int? deviceId;
  @override
  final bool? blocked;
  @override
  final String? calcTotalDist;
  @override
  final Device? device;

  @override
  String toString() {
    return 'PinInformation(pinPath: $pinPath, avatarPath: $avatarPath, address: $address, updatedTime: $updatedTime, location: $location, status: $status, name: $name, speed: $speed, labelColor: $labelColor, batteryLevel: $batteryLevel, ignition: $ignition, charging: $charging, deviceId: $deviceId, blocked: $blocked, calcTotalDist: $calcTotalDist, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinInformationImpl &&
            (identical(other.pinPath, pinPath) || other.pinPath == pinPath) &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.updatedTime, updatedTime) ||
                other.updatedTime == updatedTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.labelColor, labelColor) ||
                other.labelColor == labelColor) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.ignition, ignition) ||
                other.ignition == ignition) &&
            (identical(other.charging, charging) ||
                other.charging == charging) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.calcTotalDist, calcTotalDist) ||
                other.calcTotalDist == calcTotalDist) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pinPath,
      avatarPath,
      address,
      updatedTime,
      location,
      status,
      name,
      speed,
      labelColor,
      batteryLevel,
      ignition,
      charging,
      deviceId,
      blocked,
      calcTotalDist,
      device);

  /// Create a copy of PinInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PinInformationImplCopyWith<_$PinInformationImpl> get copyWith =>
      __$$PinInformationImplCopyWithImpl<_$PinInformationImpl>(
          this, _$identity);
}

abstract class _PinInformation implements PinInformation {
  const factory _PinInformation(
      {final String? pinPath,
      final String? avatarPath,
      final String? address,
      final String? updatedTime,
      final LatLng? location,
      final String? status,
      final String? name,
      final String? speed,
      final Color? labelColor,
      final String? batteryLevel,
      final bool? ignition,
      final bool? charging,
      final int? deviceId,
      final bool? blocked,
      final String? calcTotalDist,
      final Device? device}) = _$PinInformationImpl;

  @override
  String? get pinPath;
  @override
  String? get avatarPath;
  @override
  String? get address;
  @override
  String? get updatedTime;
  @override
  LatLng? get location;
  @override
  String? get status;
  @override
  String? get name;
  @override
  String? get speed;
  @override
  Color? get labelColor;
  @override
  String? get batteryLevel;
  @override
  bool? get ignition;
  @override
  bool? get charging;
  @override
  int? get deviceId;
  @override
  bool? get blocked;
  @override
  String? get calcTotalDist;
  @override
  Device? get device;

  /// Create a copy of PinInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PinInformationImplCopyWith<_$PinInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
