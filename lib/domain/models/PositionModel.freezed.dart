// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PositionModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionModel _$PositionModelFromJson(Map<String, dynamic> json) {
  return _PositionModel.fromJson(json);
}

/// @nodoc
mixin _$PositionModel {
  int get id => throw _privateConstructorUsedError;
  int get deviceId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  DateTime get serverTime => throw _privateConstructorUsedError;
  String get deviceTime => throw _privateConstructorUsedError;
  String get fixTime => throw _privateConstructorUsedError;
  bool get outdated => throw _privateConstructorUsedError;
  bool get valid => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get altitude => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  double get course => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  bool? get blocked => throw _privateConstructorUsedError;
  DeviceAttribute? get attributes => throw _privateConstructorUsedError;

  /// Serializes this PositionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PositionModelCopyWith<PositionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionModelCopyWith<$Res> {
  factory $PositionModelCopyWith(
          PositionModel value, $Res Function(PositionModel) then) =
      _$PositionModelCopyWithImpl<$Res, PositionModel>;
  @useResult
  $Res call(
      {int id,
      int deviceId,
      String? type,
      String protocol,
      DateTime serverTime,
      String deviceTime,
      String fixTime,
      bool outdated,
      bool valid,
      double latitude,
      double longitude,
      double altitude,
      double speed,
      double course,
      String? address,
      double accuracy,
      bool? blocked,
      DeviceAttribute? attributes});

  $DeviceAttributeCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$PositionModelCopyWithImpl<$Res, $Val extends PositionModel>
    implements $PositionModelCopyWith<$Res> {
  _$PositionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? type = freezed,
    Object? protocol = null,
    Object? serverTime = null,
    Object? deviceTime = null,
    Object? fixTime = null,
    Object? outdated = null,
    Object? valid = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
    Object? speed = null,
    Object? course = null,
    Object? address = freezed,
    Object? accuracy = null,
    Object? blocked = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      serverTime: null == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceTime: null == deviceTime
          ? _value.deviceTime
          : deviceTime // ignore: cast_nullable_to_non_nullable
              as String,
      fixTime: null == fixTime
          ? _value.fixTime
          : fixTime // ignore: cast_nullable_to_non_nullable
              as String,
      outdated: null == outdated
          ? _value.outdated
          : outdated // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as DeviceAttribute?,
    ) as $Val);
  }

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceAttributeCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $DeviceAttributeCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PositionModelImplCopyWith<$Res>
    implements $PositionModelCopyWith<$Res> {
  factory _$$PositionModelImplCopyWith(
          _$PositionModelImpl value, $Res Function(_$PositionModelImpl) then) =
      __$$PositionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int deviceId,
      String? type,
      String protocol,
      DateTime serverTime,
      String deviceTime,
      String fixTime,
      bool outdated,
      bool valid,
      double latitude,
      double longitude,
      double altitude,
      double speed,
      double course,
      String? address,
      double accuracy,
      bool? blocked,
      DeviceAttribute? attributes});

  @override
  $DeviceAttributeCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$PositionModelImplCopyWithImpl<$Res>
    extends _$PositionModelCopyWithImpl<$Res, _$PositionModelImpl>
    implements _$$PositionModelImplCopyWith<$Res> {
  __$$PositionModelImplCopyWithImpl(
      _$PositionModelImpl _value, $Res Function(_$PositionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? type = freezed,
    Object? protocol = null,
    Object? serverTime = null,
    Object? deviceTime = null,
    Object? fixTime = null,
    Object? outdated = null,
    Object? valid = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? altitude = null,
    Object? speed = null,
    Object? course = null,
    Object? address = freezed,
    Object? accuracy = null,
    Object? blocked = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$PositionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      serverTime: null == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceTime: null == deviceTime
          ? _value.deviceTime
          : deviceTime // ignore: cast_nullable_to_non_nullable
              as String,
      fixTime: null == fixTime
          ? _value.fixTime
          : fixTime // ignore: cast_nullable_to_non_nullable
              as String,
      outdated: null == outdated
          ? _value.outdated
          : outdated // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      altitude: null == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as DeviceAttribute?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PositionModelImpl implements _PositionModel {
  const _$PositionModelImpl(
      {required this.id,
      required this.deviceId,
      this.type,
      required this.protocol,
      required this.serverTime,
      required this.deviceTime,
      required this.fixTime,
      required this.outdated,
      required this.valid,
      required this.latitude,
      required this.longitude,
      required this.altitude,
      required this.speed,
      required this.course,
      this.address,
      required this.accuracy,
      required this.blocked,
      required this.attributes});

  factory _$PositionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionModelImplFromJson(json);

  @override
  final int id;
  @override
  final int deviceId;
  @override
  final String? type;
  @override
  final String protocol;
  @override
  final DateTime serverTime;
  @override
  final String deviceTime;
  @override
  final String fixTime;
  @override
  final bool outdated;
  @override
  final bool valid;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double altitude;
  @override
  final double speed;
  @override
  final double course;
  @override
  final String? address;
  @override
  final double accuracy;
  @override
  final bool? blocked;
  @override
  final DeviceAttribute? attributes;

  @override
  String toString() {
    return 'PositionModel(id: $id, deviceId: $deviceId, type: $type, protocol: $protocol, serverTime: $serverTime, deviceTime: $deviceTime, fixTime: $fixTime, outdated: $outdated, valid: $valid, latitude: $latitude, longitude: $longitude, altitude: $altitude, speed: $speed, course: $course, address: $address, accuracy: $accuracy, blocked: $blocked, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime) &&
            (identical(other.deviceTime, deviceTime) ||
                other.deviceTime == deviceTime) &&
            (identical(other.fixTime, fixTime) || other.fixTime == fixTime) &&
            (identical(other.outdated, outdated) ||
                other.outdated == outdated) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      deviceId,
      type,
      protocol,
      serverTime,
      deviceTime,
      fixTime,
      outdated,
      valid,
      latitude,
      longitude,
      altitude,
      speed,
      course,
      address,
      accuracy,
      blocked,
      attributes);

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionModelImplCopyWith<_$PositionModelImpl> get copyWith =>
      __$$PositionModelImplCopyWithImpl<_$PositionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionModelImplToJson(
      this,
    );
  }
}

abstract class _PositionModel implements PositionModel {
  const factory _PositionModel(
      {required final int id,
      required final int deviceId,
      final String? type,
      required final String protocol,
      required final DateTime serverTime,
      required final String deviceTime,
      required final String fixTime,
      required final bool outdated,
      required final bool valid,
      required final double latitude,
      required final double longitude,
      required final double altitude,
      required final double speed,
      required final double course,
      final String? address,
      required final double accuracy,
      required final bool? blocked,
      required final DeviceAttribute? attributes}) = _$PositionModelImpl;

  factory _PositionModel.fromJson(Map<String, dynamic> json) =
      _$PositionModelImpl.fromJson;

  @override
  int get id;
  @override
  int get deviceId;
  @override
  String? get type;
  @override
  String get protocol;
  @override
  DateTime get serverTime;
  @override
  String get deviceTime;
  @override
  String get fixTime;
  @override
  bool get outdated;
  @override
  bool get valid;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get altitude;
  @override
  double get speed;
  @override
  double get course;
  @override
  String? get address;
  @override
  double get accuracy;
  @override
  bool? get blocked;
  @override
  DeviceAttribute? get attributes;

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionModelImplCopyWith<_$PositionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
