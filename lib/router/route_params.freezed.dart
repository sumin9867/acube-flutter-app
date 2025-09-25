// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleInfoRouteParams _$VehicleInfoRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleInfoRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleInfoRouteParams {
  Device get device => throw _privateConstructorUsedError;

  /// Serializes this VehicleInfoRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleInfoRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleInfoRouteParamsCopyWith<VehicleInfoRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleInfoRouteParamsCopyWith<$Res> {
  factory $VehicleInfoRouteParamsCopyWith(VehicleInfoRouteParams value,
          $Res Function(VehicleInfoRouteParams) then) =
      _$VehicleInfoRouteParamsCopyWithImpl<$Res, VehicleInfoRouteParams>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$VehicleInfoRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleInfoRouteParams>
    implements $VehicleInfoRouteParamsCopyWith<$Res> {
  _$VehicleInfoRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleInfoRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ) as $Val);
  }

  /// Create a copy of VehicleInfoRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleInfoRouteParamsImplCopyWith<$Res>
    implements $VehicleInfoRouteParamsCopyWith<$Res> {
  factory _$$VehicleInfoRouteParamsImplCopyWith(
          _$VehicleInfoRouteParamsImpl value,
          $Res Function(_$VehicleInfoRouteParamsImpl) then) =
      __$$VehicleInfoRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device device});

  @override
  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$VehicleInfoRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleInfoRouteParamsCopyWithImpl<$Res,
        _$VehicleInfoRouteParamsImpl>
    implements _$$VehicleInfoRouteParamsImplCopyWith<$Res> {
  __$$VehicleInfoRouteParamsImplCopyWithImpl(
      _$VehicleInfoRouteParamsImpl _value,
      $Res Function(_$VehicleInfoRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleInfoRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$VehicleInfoRouteParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleInfoRouteParamsImpl implements _VehicleInfoRouteParams {
  const _$VehicleInfoRouteParamsImpl({required this.device});

  factory _$VehicleInfoRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleInfoRouteParamsImplFromJson(json);

  @override
  final Device device;

  @override
  String toString() {
    return 'VehicleInfoRouteParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleInfoRouteParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of VehicleInfoRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleInfoRouteParamsImplCopyWith<_$VehicleInfoRouteParamsImpl>
      get copyWith => __$$VehicleInfoRouteParamsImplCopyWithImpl<
          _$VehicleInfoRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleInfoRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleInfoRouteParams implements VehicleInfoRouteParams {
  const factory _VehicleInfoRouteParams({required final Device device}) =
      _$VehicleInfoRouteParamsImpl;

  factory _VehicleInfoRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleInfoRouteParamsImpl.fromJson;

  @override
  Device get device;

  /// Create a copy of VehicleInfoRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleInfoRouteParamsImplCopyWith<_$VehicleInfoRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleDashboardRouteParams _$VehicleDashboardRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleDashboardRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleDashboardRouteParams {
  Device get device => throw _privateConstructorUsedError;

  /// Serializes this VehicleDashboardRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleDashboardRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleDashboardRouteParamsCopyWith<VehicleDashboardRouteParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleDashboardRouteParamsCopyWith<$Res> {
  factory $VehicleDashboardRouteParamsCopyWith(
          VehicleDashboardRouteParams value,
          $Res Function(VehicleDashboardRouteParams) then) =
      _$VehicleDashboardRouteParamsCopyWithImpl<$Res,
          VehicleDashboardRouteParams>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$VehicleDashboardRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleDashboardRouteParams>
    implements $VehicleDashboardRouteParamsCopyWith<$Res> {
  _$VehicleDashboardRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleDashboardRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ) as $Val);
  }

  /// Create a copy of VehicleDashboardRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleDashboardRouteParamsImplCopyWith<$Res>
    implements $VehicleDashboardRouteParamsCopyWith<$Res> {
  factory _$$VehicleDashboardRouteParamsImplCopyWith(
          _$VehicleDashboardRouteParamsImpl value,
          $Res Function(_$VehicleDashboardRouteParamsImpl) then) =
      __$$VehicleDashboardRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device device});

  @override
  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$VehicleDashboardRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleDashboardRouteParamsCopyWithImpl<$Res,
        _$VehicleDashboardRouteParamsImpl>
    implements _$$VehicleDashboardRouteParamsImplCopyWith<$Res> {
  __$$VehicleDashboardRouteParamsImplCopyWithImpl(
      _$VehicleDashboardRouteParamsImpl _value,
      $Res Function(_$VehicleDashboardRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleDashboardRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$VehicleDashboardRouteParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleDashboardRouteParamsImpl
    implements _VehicleDashboardRouteParams {
  const _$VehicleDashboardRouteParamsImpl({required this.device});

  factory _$VehicleDashboardRouteParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VehicleDashboardRouteParamsImplFromJson(json);

  @override
  final Device device;

  @override
  String toString() {
    return 'VehicleDashboardRouteParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleDashboardRouteParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of VehicleDashboardRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleDashboardRouteParamsImplCopyWith<_$VehicleDashboardRouteParamsImpl>
      get copyWith => __$$VehicleDashboardRouteParamsImplCopyWithImpl<
          _$VehicleDashboardRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleDashboardRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleDashboardRouteParams
    implements VehicleDashboardRouteParams {
  const factory _VehicleDashboardRouteParams({required final Device device}) =
      _$VehicleDashboardRouteParamsImpl;

  factory _VehicleDashboardRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleDashboardRouteParamsImpl.fromJson;

  @override
  Device get device;

  /// Create a copy of VehicleDashboardRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleDashboardRouteParamsImplCopyWith<_$VehicleDashboardRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleDetailsRouteParams _$VehicleDetailsRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleDetailsRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleDetailsRouteParams {
  Device get device => throw _privateConstructorUsedError;

  /// Serializes this VehicleDetailsRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleDetailsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleDetailsRouteParamsCopyWith<VehicleDetailsRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleDetailsRouteParamsCopyWith<$Res> {
  factory $VehicleDetailsRouteParamsCopyWith(VehicleDetailsRouteParams value,
          $Res Function(VehicleDetailsRouteParams) then) =
      _$VehicleDetailsRouteParamsCopyWithImpl<$Res, VehicleDetailsRouteParams>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$VehicleDetailsRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleDetailsRouteParams>
    implements $VehicleDetailsRouteParamsCopyWith<$Res> {
  _$VehicleDetailsRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleDetailsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ) as $Val);
  }

  /// Create a copy of VehicleDetailsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleDetailsRouteParamsImplCopyWith<$Res>
    implements $VehicleDetailsRouteParamsCopyWith<$Res> {
  factory _$$VehicleDetailsRouteParamsImplCopyWith(
          _$VehicleDetailsRouteParamsImpl value,
          $Res Function(_$VehicleDetailsRouteParamsImpl) then) =
      __$$VehicleDetailsRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device device});

  @override
  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$VehicleDetailsRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleDetailsRouteParamsCopyWithImpl<$Res,
        _$VehicleDetailsRouteParamsImpl>
    implements _$$VehicleDetailsRouteParamsImplCopyWith<$Res> {
  __$$VehicleDetailsRouteParamsImplCopyWithImpl(
      _$VehicleDetailsRouteParamsImpl _value,
      $Res Function(_$VehicleDetailsRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleDetailsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$VehicleDetailsRouteParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleDetailsRouteParamsImpl implements _VehicleDetailsRouteParams {
  const _$VehicleDetailsRouteParamsImpl({required this.device});

  factory _$VehicleDetailsRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleDetailsRouteParamsImplFromJson(json);

  @override
  final Device device;

  @override
  String toString() {
    return 'VehicleDetailsRouteParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleDetailsRouteParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of VehicleDetailsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleDetailsRouteParamsImplCopyWith<_$VehicleDetailsRouteParamsImpl>
      get copyWith => __$$VehicleDetailsRouteParamsImplCopyWithImpl<
          _$VehicleDetailsRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleDetailsRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleDetailsRouteParams implements VehicleDetailsRouteParams {
  const factory _VehicleDetailsRouteParams({required final Device device}) =
      _$VehicleDetailsRouteParamsImpl;

  factory _VehicleDetailsRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleDetailsRouteParamsImpl.fromJson;

  @override
  Device get device;

  /// Create a copy of VehicleDetailsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleDetailsRouteParamsImplCopyWith<_$VehicleDetailsRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehiclePlaybackRouteParams _$VehiclePlaybackRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehiclePlaybackRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehiclePlaybackRouteParams {
  String get vehicleId => throw _privateConstructorUsedError;

  /// Serializes this VehiclePlaybackRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehiclePlaybackRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehiclePlaybackRouteParamsCopyWith<VehiclePlaybackRouteParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehiclePlaybackRouteParamsCopyWith<$Res> {
  factory $VehiclePlaybackRouteParamsCopyWith(VehiclePlaybackRouteParams value,
          $Res Function(VehiclePlaybackRouteParams) then) =
      _$VehiclePlaybackRouteParamsCopyWithImpl<$Res,
          VehiclePlaybackRouteParams>;
  @useResult
  $Res call({String vehicleId});
}

/// @nodoc
class _$VehiclePlaybackRouteParamsCopyWithImpl<$Res,
        $Val extends VehiclePlaybackRouteParams>
    implements $VehiclePlaybackRouteParamsCopyWith<$Res> {
  _$VehiclePlaybackRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehiclePlaybackRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
  }) {
    return _then(_value.copyWith(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehiclePlaybackRouteParamsImplCopyWith<$Res>
    implements $VehiclePlaybackRouteParamsCopyWith<$Res> {
  factory _$$VehiclePlaybackRouteParamsImplCopyWith(
          _$VehiclePlaybackRouteParamsImpl value,
          $Res Function(_$VehiclePlaybackRouteParamsImpl) then) =
      __$$VehiclePlaybackRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String vehicleId});
}

/// @nodoc
class __$$VehiclePlaybackRouteParamsImplCopyWithImpl<$Res>
    extends _$VehiclePlaybackRouteParamsCopyWithImpl<$Res,
        _$VehiclePlaybackRouteParamsImpl>
    implements _$$VehiclePlaybackRouteParamsImplCopyWith<$Res> {
  __$$VehiclePlaybackRouteParamsImplCopyWithImpl(
      _$VehiclePlaybackRouteParamsImpl _value,
      $Res Function(_$VehiclePlaybackRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehiclePlaybackRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
  }) {
    return _then(_$VehiclePlaybackRouteParamsImpl(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehiclePlaybackRouteParamsImpl implements _VehiclePlaybackRouteParams {
  const _$VehiclePlaybackRouteParamsImpl({required this.vehicleId});

  factory _$VehiclePlaybackRouteParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VehiclePlaybackRouteParamsImplFromJson(json);

  @override
  final String vehicleId;

  @override
  String toString() {
    return 'VehiclePlaybackRouteParams(vehicleId: $vehicleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehiclePlaybackRouteParamsImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vehicleId);

  /// Create a copy of VehiclePlaybackRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehiclePlaybackRouteParamsImplCopyWith<_$VehiclePlaybackRouteParamsImpl>
      get copyWith => __$$VehiclePlaybackRouteParamsImplCopyWithImpl<
          _$VehiclePlaybackRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehiclePlaybackRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehiclePlaybackRouteParams
    implements VehiclePlaybackRouteParams {
  const factory _VehiclePlaybackRouteParams({required final String vehicleId}) =
      _$VehiclePlaybackRouteParamsImpl;

  factory _VehiclePlaybackRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehiclePlaybackRouteParamsImpl.fromJson;

  @override
  String get vehicleId;

  /// Create a copy of VehiclePlaybackRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehiclePlaybackRouteParamsImplCopyWith<_$VehiclePlaybackRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerCareParams _$CustomerCareParamsFromJson(Map<String, dynamic> json) {
  return _CustomerCareParams.fromJson(json);
}

/// @nodoc
mixin _$CustomerCareParams {
  bool get isLoggedIn => throw _privateConstructorUsedError;

  /// Serializes this CustomerCareParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerCareParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCareParamsCopyWith<CustomerCareParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCareParamsCopyWith<$Res> {
  factory $CustomerCareParamsCopyWith(
          CustomerCareParams value, $Res Function(CustomerCareParams) then) =
      _$CustomerCareParamsCopyWithImpl<$Res, CustomerCareParams>;
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class _$CustomerCareParamsCopyWithImpl<$Res, $Val extends CustomerCareParams>
    implements $CustomerCareParamsCopyWith<$Res> {
  _$CustomerCareParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerCareParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerCareParamsImplCopyWith<$Res>
    implements $CustomerCareParamsCopyWith<$Res> {
  factory _$$CustomerCareParamsImplCopyWith(_$CustomerCareParamsImpl value,
          $Res Function(_$CustomerCareParamsImpl) then) =
      __$$CustomerCareParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class __$$CustomerCareParamsImplCopyWithImpl<$Res>
    extends _$CustomerCareParamsCopyWithImpl<$Res, _$CustomerCareParamsImpl>
    implements _$$CustomerCareParamsImplCopyWith<$Res> {
  __$$CustomerCareParamsImplCopyWithImpl(_$CustomerCareParamsImpl _value,
      $Res Function(_$CustomerCareParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerCareParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
  }) {
    return _then(_$CustomerCareParamsImpl(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerCareParamsImpl implements _CustomerCareParams {
  const _$CustomerCareParamsImpl({required this.isLoggedIn});

  factory _$CustomerCareParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerCareParamsImplFromJson(json);

  @override
  final bool isLoggedIn;

  @override
  String toString() {
    return 'CustomerCareParams(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCareParamsImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn);

  /// Create a copy of CustomerCareParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCareParamsImplCopyWith<_$CustomerCareParamsImpl> get copyWith =>
      __$$CustomerCareParamsImplCopyWithImpl<_$CustomerCareParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerCareParamsImplToJson(
      this,
    );
  }
}

abstract class _CustomerCareParams implements CustomerCareParams {
  const factory _CustomerCareParams({required final bool isLoggedIn}) =
      _$CustomerCareParamsImpl;

  factory _CustomerCareParams.fromJson(Map<String, dynamic> json) =
      _$CustomerCareParamsImpl.fromJson;

  @override
  bool get isLoggedIn;

  /// Create a copy of CustomerCareParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerCareParamsImplCopyWith<_$CustomerCareParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleMapTripRouteParams _$VehicleMapTripRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleMapTripRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleMapTripRouteParams {
  VehicleTrip get trip => throw _privateConstructorUsedError;

  /// Serializes this VehicleMapTripRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleMapTripRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleMapTripRouteParamsCopyWith<VehicleMapTripRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleMapTripRouteParamsCopyWith<$Res> {
  factory $VehicleMapTripRouteParamsCopyWith(VehicleMapTripRouteParams value,
          $Res Function(VehicleMapTripRouteParams) then) =
      _$VehicleMapTripRouteParamsCopyWithImpl<$Res, VehicleMapTripRouteParams>;
  @useResult
  $Res call({VehicleTrip trip});

  $VehicleTripCopyWith<$Res> get trip;
}

/// @nodoc
class _$VehicleMapTripRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleMapTripRouteParams>
    implements $VehicleMapTripRouteParamsCopyWith<$Res> {
  _$VehicleMapTripRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleMapTripRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trip = null,
  }) {
    return _then(_value.copyWith(
      trip: null == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as VehicleTrip,
    ) as $Val);
  }

  /// Create a copy of VehicleMapTripRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleTripCopyWith<$Res> get trip {
    return $VehicleTripCopyWith<$Res>(_value.trip, (value) {
      return _then(_value.copyWith(trip: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleMapTripRouteParamsImplCopyWith<$Res>
    implements $VehicleMapTripRouteParamsCopyWith<$Res> {
  factory _$$VehicleMapTripRouteParamsImplCopyWith(
          _$VehicleMapTripRouteParamsImpl value,
          $Res Function(_$VehicleMapTripRouteParamsImpl) then) =
      __$$VehicleMapTripRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VehicleTrip trip});

  @override
  $VehicleTripCopyWith<$Res> get trip;
}

/// @nodoc
class __$$VehicleMapTripRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleMapTripRouteParamsCopyWithImpl<$Res,
        _$VehicleMapTripRouteParamsImpl>
    implements _$$VehicleMapTripRouteParamsImplCopyWith<$Res> {
  __$$VehicleMapTripRouteParamsImplCopyWithImpl(
      _$VehicleMapTripRouteParamsImpl _value,
      $Res Function(_$VehicleMapTripRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleMapTripRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trip = null,
  }) {
    return _then(_$VehicleMapTripRouteParamsImpl(
      trip: null == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as VehicleTrip,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleMapTripRouteParamsImpl implements _VehicleMapTripRouteParams {
  const _$VehicleMapTripRouteParamsImpl({required this.trip});

  factory _$VehicleMapTripRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleMapTripRouteParamsImplFromJson(json);

  @override
  final VehicleTrip trip;

  @override
  String toString() {
    return 'VehicleMapTripRouteParams(trip: $trip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleMapTripRouteParamsImpl &&
            (identical(other.trip, trip) || other.trip == trip));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, trip);

  /// Create a copy of VehicleMapTripRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleMapTripRouteParamsImplCopyWith<_$VehicleMapTripRouteParamsImpl>
      get copyWith => __$$VehicleMapTripRouteParamsImplCopyWithImpl<
          _$VehicleMapTripRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleMapTripRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleMapTripRouteParams implements VehicleMapTripRouteParams {
  const factory _VehicleMapTripRouteParams({required final VehicleTrip trip}) =
      _$VehicleMapTripRouteParamsImpl;

  factory _VehicleMapTripRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleMapTripRouteParamsImpl.fromJson;

  @override
  VehicleTrip get trip;

  /// Create a copy of VehicleMapTripRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleMapTripRouteParamsImplCopyWith<_$VehicleMapTripRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleMapStopRouteParams _$VehicleMapStopRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleMapStopRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleMapStopRouteParams {
  VehicleStop get stop => throw _privateConstructorUsedError;

  /// Serializes this VehicleMapStopRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleMapStopRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleMapStopRouteParamsCopyWith<VehicleMapStopRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleMapStopRouteParamsCopyWith<$Res> {
  factory $VehicleMapStopRouteParamsCopyWith(VehicleMapStopRouteParams value,
          $Res Function(VehicleMapStopRouteParams) then) =
      _$VehicleMapStopRouteParamsCopyWithImpl<$Res, VehicleMapStopRouteParams>;
  @useResult
  $Res call({VehicleStop stop});

  $VehicleStopCopyWith<$Res> get stop;
}

/// @nodoc
class _$VehicleMapStopRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleMapStopRouteParams>
    implements $VehicleMapStopRouteParamsCopyWith<$Res> {
  _$VehicleMapStopRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleMapStopRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
  }) {
    return _then(_value.copyWith(
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as VehicleStop,
    ) as $Val);
  }

  /// Create a copy of VehicleMapStopRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleStopCopyWith<$Res> get stop {
    return $VehicleStopCopyWith<$Res>(_value.stop, (value) {
      return _then(_value.copyWith(stop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleMapStopRouteParamsImplCopyWith<$Res>
    implements $VehicleMapStopRouteParamsCopyWith<$Res> {
  factory _$$VehicleMapStopRouteParamsImplCopyWith(
          _$VehicleMapStopRouteParamsImpl value,
          $Res Function(_$VehicleMapStopRouteParamsImpl) then) =
      __$$VehicleMapStopRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VehicleStop stop});

  @override
  $VehicleStopCopyWith<$Res> get stop;
}

/// @nodoc
class __$$VehicleMapStopRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleMapStopRouteParamsCopyWithImpl<$Res,
        _$VehicleMapStopRouteParamsImpl>
    implements _$$VehicleMapStopRouteParamsImplCopyWith<$Res> {
  __$$VehicleMapStopRouteParamsImplCopyWithImpl(
      _$VehicleMapStopRouteParamsImpl _value,
      $Res Function(_$VehicleMapStopRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleMapStopRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
  }) {
    return _then(_$VehicleMapStopRouteParamsImpl(
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as VehicleStop,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleMapStopRouteParamsImpl implements _VehicleMapStopRouteParams {
  const _$VehicleMapStopRouteParamsImpl({required this.stop});

  factory _$VehicleMapStopRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleMapStopRouteParamsImplFromJson(json);

  @override
  final VehicleStop stop;

  @override
  String toString() {
    return 'VehicleMapStopRouteParams(stop: $stop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleMapStopRouteParamsImpl &&
            (identical(other.stop, stop) || other.stop == stop));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stop);

  /// Create a copy of VehicleMapStopRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleMapStopRouteParamsImplCopyWith<_$VehicleMapStopRouteParamsImpl>
      get copyWith => __$$VehicleMapStopRouteParamsImplCopyWithImpl<
          _$VehicleMapStopRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleMapStopRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleMapStopRouteParams implements VehicleMapStopRouteParams {
  const factory _VehicleMapStopRouteParams({required final VehicleStop stop}) =
      _$VehicleMapStopRouteParamsImpl;

  factory _VehicleMapStopRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleMapStopRouteParamsImpl.fromJson;

  @override
  VehicleStop get stop;

  /// Create a copy of VehicleMapStopRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleMapStopRouteParamsImplCopyWith<_$VehicleMapStopRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GeofenceRouteParams _$GeofenceRouteParamsFromJson(Map<String, dynamic> json) {
  return _GeofenceRouteParams.fromJson(json);
}

/// @nodoc
mixin _$GeofenceRouteParams {
  String get vehicleId => throw _privateConstructorUsedError;

  /// Serializes this GeofenceRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeofenceRouteParamsCopyWith<GeofenceRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeofenceRouteParamsCopyWith<$Res> {
  factory $GeofenceRouteParamsCopyWith(
          GeofenceRouteParams value, $Res Function(GeofenceRouteParams) then) =
      _$GeofenceRouteParamsCopyWithImpl<$Res, GeofenceRouteParams>;
  @useResult
  $Res call({String vehicleId});
}

/// @nodoc
class _$GeofenceRouteParamsCopyWithImpl<$Res, $Val extends GeofenceRouteParams>
    implements $GeofenceRouteParamsCopyWith<$Res> {
  _$GeofenceRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
  }) {
    return _then(_value.copyWith(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeofenceRouteParamsImplCopyWith<$Res>
    implements $GeofenceRouteParamsCopyWith<$Res> {
  factory _$$GeofenceRouteParamsImplCopyWith(_$GeofenceRouteParamsImpl value,
          $Res Function(_$GeofenceRouteParamsImpl) then) =
      __$$GeofenceRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String vehicleId});
}

/// @nodoc
class __$$GeofenceRouteParamsImplCopyWithImpl<$Res>
    extends _$GeofenceRouteParamsCopyWithImpl<$Res, _$GeofenceRouteParamsImpl>
    implements _$$GeofenceRouteParamsImplCopyWith<$Res> {
  __$$GeofenceRouteParamsImplCopyWithImpl(_$GeofenceRouteParamsImpl _value,
      $Res Function(_$GeofenceRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
  }) {
    return _then(_$GeofenceRouteParamsImpl(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeofenceRouteParamsImpl implements _GeofenceRouteParams {
  const _$GeofenceRouteParamsImpl({required this.vehicleId});

  factory _$GeofenceRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeofenceRouteParamsImplFromJson(json);

  @override
  final String vehicleId;

  @override
  String toString() {
    return 'GeofenceRouteParams(vehicleId: $vehicleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeofenceRouteParamsImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vehicleId);

  /// Create a copy of GeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeofenceRouteParamsImplCopyWith<_$GeofenceRouteParamsImpl> get copyWith =>
      __$$GeofenceRouteParamsImplCopyWithImpl<_$GeofenceRouteParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeofenceRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _GeofenceRouteParams implements GeofenceRouteParams {
  const factory _GeofenceRouteParams({required final String vehicleId}) =
      _$GeofenceRouteParamsImpl;

  factory _GeofenceRouteParams.fromJson(Map<String, dynamic> json) =
      _$GeofenceRouteParamsImpl.fromJson;

  @override
  String get vehicleId;

  /// Create a copy of GeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeofenceRouteParamsImplCopyWith<_$GeofenceRouteParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ViewGeofenceRouteParams _$ViewGeofenceRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _ViewGeofenceRouteParams.fromJson(json);
}

/// @nodoc
mixin _$ViewGeofenceRouteParams {
  GeofenceModel get geofenceModel => throw _privateConstructorUsedError;

  /// Serializes this ViewGeofenceRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViewGeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewGeofenceRouteParamsCopyWith<ViewGeofenceRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewGeofenceRouteParamsCopyWith<$Res> {
  factory $ViewGeofenceRouteParamsCopyWith(ViewGeofenceRouteParams value,
          $Res Function(ViewGeofenceRouteParams) then) =
      _$ViewGeofenceRouteParamsCopyWithImpl<$Res, ViewGeofenceRouteParams>;
  @useResult
  $Res call({GeofenceModel geofenceModel});

  $GeofenceModelCopyWith<$Res> get geofenceModel;
}

/// @nodoc
class _$ViewGeofenceRouteParamsCopyWithImpl<$Res,
        $Val extends ViewGeofenceRouteParams>
    implements $ViewGeofenceRouteParamsCopyWith<$Res> {
  _$ViewGeofenceRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewGeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geofenceModel = null,
  }) {
    return _then(_value.copyWith(
      geofenceModel: null == geofenceModel
          ? _value.geofenceModel
          : geofenceModel // ignore: cast_nullable_to_non_nullable
              as GeofenceModel,
    ) as $Val);
  }

  /// Create a copy of ViewGeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeofenceModelCopyWith<$Res> get geofenceModel {
    return $GeofenceModelCopyWith<$Res>(_value.geofenceModel, (value) {
      return _then(_value.copyWith(geofenceModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewGeofenceRouteParamsImplCopyWith<$Res>
    implements $ViewGeofenceRouteParamsCopyWith<$Res> {
  factory _$$ViewGeofenceRouteParamsImplCopyWith(
          _$ViewGeofenceRouteParamsImpl value,
          $Res Function(_$ViewGeofenceRouteParamsImpl) then) =
      __$$ViewGeofenceRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeofenceModel geofenceModel});

  @override
  $GeofenceModelCopyWith<$Res> get geofenceModel;
}

/// @nodoc
class __$$ViewGeofenceRouteParamsImplCopyWithImpl<$Res>
    extends _$ViewGeofenceRouteParamsCopyWithImpl<$Res,
        _$ViewGeofenceRouteParamsImpl>
    implements _$$ViewGeofenceRouteParamsImplCopyWith<$Res> {
  __$$ViewGeofenceRouteParamsImplCopyWithImpl(
      _$ViewGeofenceRouteParamsImpl _value,
      $Res Function(_$ViewGeofenceRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewGeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geofenceModel = null,
  }) {
    return _then(_$ViewGeofenceRouteParamsImpl(
      geofenceModel: null == geofenceModel
          ? _value.geofenceModel
          : geofenceModel // ignore: cast_nullable_to_non_nullable
              as GeofenceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewGeofenceRouteParamsImpl implements _ViewGeofenceRouteParams {
  const _$ViewGeofenceRouteParamsImpl({required this.geofenceModel});

  factory _$ViewGeofenceRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewGeofenceRouteParamsImplFromJson(json);

  @override
  final GeofenceModel geofenceModel;

  @override
  String toString() {
    return 'ViewGeofenceRouteParams(geofenceModel: $geofenceModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewGeofenceRouteParamsImpl &&
            (identical(other.geofenceModel, geofenceModel) ||
                other.geofenceModel == geofenceModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, geofenceModel);

  /// Create a copy of ViewGeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewGeofenceRouteParamsImplCopyWith<_$ViewGeofenceRouteParamsImpl>
      get copyWith => __$$ViewGeofenceRouteParamsImplCopyWithImpl<
          _$ViewGeofenceRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewGeofenceRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _ViewGeofenceRouteParams implements ViewGeofenceRouteParams {
  const factory _ViewGeofenceRouteParams(
          {required final GeofenceModel geofenceModel}) =
      _$ViewGeofenceRouteParamsImpl;

  factory _ViewGeofenceRouteParams.fromJson(Map<String, dynamic> json) =
      _$ViewGeofenceRouteParamsImpl.fromJson;

  @override
  GeofenceModel get geofenceModel;

  /// Create a copy of ViewGeofenceRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewGeofenceRouteParamsImplCopyWith<_$ViewGeofenceRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleEngineLockRouteParams _$VehicleEngineLockRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleEngineLockRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleEngineLockRouteParams {
  Device get device => throw _privateConstructorUsedError;

  /// Serializes this VehicleEngineLockRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleEngineLockRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleEngineLockRouteParamsCopyWith<VehicleEngineLockRouteParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleEngineLockRouteParamsCopyWith<$Res> {
  factory $VehicleEngineLockRouteParamsCopyWith(
          VehicleEngineLockRouteParams value,
          $Res Function(VehicleEngineLockRouteParams) then) =
      _$VehicleEngineLockRouteParamsCopyWithImpl<$Res,
          VehicleEngineLockRouteParams>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$VehicleEngineLockRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleEngineLockRouteParams>
    implements $VehicleEngineLockRouteParamsCopyWith<$Res> {
  _$VehicleEngineLockRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleEngineLockRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ) as $Val);
  }

  /// Create a copy of VehicleEngineLockRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleEngineLockRouteParamsImplCopyWith<$Res>
    implements $VehicleEngineLockRouteParamsCopyWith<$Res> {
  factory _$$VehicleEngineLockRouteParamsImplCopyWith(
          _$VehicleEngineLockRouteParamsImpl value,
          $Res Function(_$VehicleEngineLockRouteParamsImpl) then) =
      __$$VehicleEngineLockRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device device});

  @override
  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$VehicleEngineLockRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleEngineLockRouteParamsCopyWithImpl<$Res,
        _$VehicleEngineLockRouteParamsImpl>
    implements _$$VehicleEngineLockRouteParamsImplCopyWith<$Res> {
  __$$VehicleEngineLockRouteParamsImplCopyWithImpl(
      _$VehicleEngineLockRouteParamsImpl _value,
      $Res Function(_$VehicleEngineLockRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleEngineLockRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$VehicleEngineLockRouteParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleEngineLockRouteParamsImpl
    implements _VehicleEngineLockRouteParams {
  const _$VehicleEngineLockRouteParamsImpl({required this.device});

  factory _$VehicleEngineLockRouteParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VehicleEngineLockRouteParamsImplFromJson(json);

  @override
  final Device device;

  @override
  String toString() {
    return 'VehicleEngineLockRouteParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleEngineLockRouteParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of VehicleEngineLockRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleEngineLockRouteParamsImplCopyWith<
          _$VehicleEngineLockRouteParamsImpl>
      get copyWith => __$$VehicleEngineLockRouteParamsImplCopyWithImpl<
          _$VehicleEngineLockRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleEngineLockRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleEngineLockRouteParams
    implements VehicleEngineLockRouteParams {
  const factory _VehicleEngineLockRouteParams({required final Device device}) =
      _$VehicleEngineLockRouteParamsImpl;

  factory _VehicleEngineLockRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleEngineLockRouteParamsImpl.fromJson;

  @override
  Device get device;

  /// Create a copy of VehicleEngineLockRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleEngineLockRouteParamsImplCopyWith<
          _$VehicleEngineLockRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleAntiTheftRouteParams _$VehicleAntiTheftRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleAntiTheftRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleAntiTheftRouteParams {
  Device get device => throw _privateConstructorUsedError;

  /// Serializes this VehicleAntiTheftRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleAntiTheftRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleAntiTheftRouteParamsCopyWith<VehicleAntiTheftRouteParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleAntiTheftRouteParamsCopyWith<$Res> {
  factory $VehicleAntiTheftRouteParamsCopyWith(
          VehicleAntiTheftRouteParams value,
          $Res Function(VehicleAntiTheftRouteParams) then) =
      _$VehicleAntiTheftRouteParamsCopyWithImpl<$Res,
          VehicleAntiTheftRouteParams>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$VehicleAntiTheftRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleAntiTheftRouteParams>
    implements $VehicleAntiTheftRouteParamsCopyWith<$Res> {
  _$VehicleAntiTheftRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleAntiTheftRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ) as $Val);
  }

  /// Create a copy of VehicleAntiTheftRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleAntiTheftRouteParamsImplCopyWith<$Res>
    implements $VehicleAntiTheftRouteParamsCopyWith<$Res> {
  factory _$$VehicleAntiTheftRouteParamsImplCopyWith(
          _$VehicleAntiTheftRouteParamsImpl value,
          $Res Function(_$VehicleAntiTheftRouteParamsImpl) then) =
      __$$VehicleAntiTheftRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device device});

  @override
  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$VehicleAntiTheftRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleAntiTheftRouteParamsCopyWithImpl<$Res,
        _$VehicleAntiTheftRouteParamsImpl>
    implements _$$VehicleAntiTheftRouteParamsImplCopyWith<$Res> {
  __$$VehicleAntiTheftRouteParamsImplCopyWithImpl(
      _$VehicleAntiTheftRouteParamsImpl _value,
      $Res Function(_$VehicleAntiTheftRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleAntiTheftRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$VehicleAntiTheftRouteParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleAntiTheftRouteParamsImpl
    implements _VehicleAntiTheftRouteParams {
  const _$VehicleAntiTheftRouteParamsImpl({required this.device});

  factory _$VehicleAntiTheftRouteParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VehicleAntiTheftRouteParamsImplFromJson(json);

  @override
  final Device device;

  @override
  String toString() {
    return 'VehicleAntiTheftRouteParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleAntiTheftRouteParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of VehicleAntiTheftRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleAntiTheftRouteParamsImplCopyWith<_$VehicleAntiTheftRouteParamsImpl>
      get copyWith => __$$VehicleAntiTheftRouteParamsImplCopyWithImpl<
          _$VehicleAntiTheftRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleAntiTheftRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleAntiTheftRouteParams
    implements VehicleAntiTheftRouteParams {
  const factory _VehicleAntiTheftRouteParams({required final Device device}) =
      _$VehicleAntiTheftRouteParamsImpl;

  factory _VehicleAntiTheftRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleAntiTheftRouteParamsImpl.fromJson;

  @override
  Device get device;

  /// Create a copy of VehicleAntiTheftRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleAntiTheftRouteParamsImplCopyWith<_$VehicleAntiTheftRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleSettingsRouteParams _$VehicleSettingsRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _VehicleSettingsRouteParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleSettingsRouteParams {
  Device get device => throw _privateConstructorUsedError;

  /// Serializes this VehicleSettingsRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleSettingsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleSettingsRouteParamsCopyWith<VehicleSettingsRouteParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleSettingsRouteParamsCopyWith<$Res> {
  factory $VehicleSettingsRouteParamsCopyWith(VehicleSettingsRouteParams value,
          $Res Function(VehicleSettingsRouteParams) then) =
      _$VehicleSettingsRouteParamsCopyWithImpl<$Res,
          VehicleSettingsRouteParams>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$VehicleSettingsRouteParamsCopyWithImpl<$Res,
        $Val extends VehicleSettingsRouteParams>
    implements $VehicleSettingsRouteParamsCopyWith<$Res> {
  _$VehicleSettingsRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleSettingsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ) as $Val);
  }

  /// Create a copy of VehicleSettingsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleSettingsRouteParamsImplCopyWith<$Res>
    implements $VehicleSettingsRouteParamsCopyWith<$Res> {
  factory _$$VehicleSettingsRouteParamsImplCopyWith(
          _$VehicleSettingsRouteParamsImpl value,
          $Res Function(_$VehicleSettingsRouteParamsImpl) then) =
      __$$VehicleSettingsRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device device});

  @override
  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$VehicleSettingsRouteParamsImplCopyWithImpl<$Res>
    extends _$VehicleSettingsRouteParamsCopyWithImpl<$Res,
        _$VehicleSettingsRouteParamsImpl>
    implements _$$VehicleSettingsRouteParamsImplCopyWith<$Res> {
  __$$VehicleSettingsRouteParamsImplCopyWithImpl(
      _$VehicleSettingsRouteParamsImpl _value,
      $Res Function(_$VehicleSettingsRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleSettingsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$VehicleSettingsRouteParamsImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleSettingsRouteParamsImpl implements _VehicleSettingsRouteParams {
  const _$VehicleSettingsRouteParamsImpl({required this.device});

  factory _$VehicleSettingsRouteParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VehicleSettingsRouteParamsImplFromJson(json);

  @override
  final Device device;

  @override
  String toString() {
    return 'VehicleSettingsRouteParams(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleSettingsRouteParamsImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of VehicleSettingsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleSettingsRouteParamsImplCopyWith<_$VehicleSettingsRouteParamsImpl>
      get copyWith => __$$VehicleSettingsRouteParamsImplCopyWithImpl<
          _$VehicleSettingsRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleSettingsRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleSettingsRouteParams
    implements VehicleSettingsRouteParams {
  const factory _VehicleSettingsRouteParams({required final Device device}) =
      _$VehicleSettingsRouteParamsImpl;

  factory _VehicleSettingsRouteParams.fromJson(Map<String, dynamic> json) =
      _$VehicleSettingsRouteParamsImpl.fromJson;

  @override
  Device get device;

  /// Create a copy of VehicleSettingsRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleSettingsRouteParamsImplCopyWith<_$VehicleSettingsRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EventMapRouteParams _$EventMapRouteParamsFromJson(Map<String, dynamic> json) {
  return _EventMapRouteParams.fromJson(json);
}

/// @nodoc
mixin _$EventMapRouteParams {
  VehicleEvent get vehicleEvent => throw _privateConstructorUsedError;

  /// Serializes this EventMapRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventMapRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventMapRouteParamsCopyWith<EventMapRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventMapRouteParamsCopyWith<$Res> {
  factory $EventMapRouteParamsCopyWith(
          EventMapRouteParams value, $Res Function(EventMapRouteParams) then) =
      _$EventMapRouteParamsCopyWithImpl<$Res, EventMapRouteParams>;
  @useResult
  $Res call({VehicleEvent vehicleEvent});

  $VehicleEventCopyWith<$Res> get vehicleEvent;
}

/// @nodoc
class _$EventMapRouteParamsCopyWithImpl<$Res, $Val extends EventMapRouteParams>
    implements $EventMapRouteParamsCopyWith<$Res> {
  _$EventMapRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventMapRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleEvent = null,
  }) {
    return _then(_value.copyWith(
      vehicleEvent: null == vehicleEvent
          ? _value.vehicleEvent
          : vehicleEvent // ignore: cast_nullable_to_non_nullable
              as VehicleEvent,
    ) as $Val);
  }

  /// Create a copy of EventMapRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleEventCopyWith<$Res> get vehicleEvent {
    return $VehicleEventCopyWith<$Res>(_value.vehicleEvent, (value) {
      return _then(_value.copyWith(vehicleEvent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventMapRouteParamsImplCopyWith<$Res>
    implements $EventMapRouteParamsCopyWith<$Res> {
  factory _$$EventMapRouteParamsImplCopyWith(_$EventMapRouteParamsImpl value,
          $Res Function(_$EventMapRouteParamsImpl) then) =
      __$$EventMapRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VehicleEvent vehicleEvent});

  @override
  $VehicleEventCopyWith<$Res> get vehicleEvent;
}

/// @nodoc
class __$$EventMapRouteParamsImplCopyWithImpl<$Res>
    extends _$EventMapRouteParamsCopyWithImpl<$Res, _$EventMapRouteParamsImpl>
    implements _$$EventMapRouteParamsImplCopyWith<$Res> {
  __$$EventMapRouteParamsImplCopyWithImpl(_$EventMapRouteParamsImpl _value,
      $Res Function(_$EventMapRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventMapRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleEvent = null,
  }) {
    return _then(_$EventMapRouteParamsImpl(
      vehicleEvent: null == vehicleEvent
          ? _value.vehicleEvent
          : vehicleEvent // ignore: cast_nullable_to_non_nullable
              as VehicleEvent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventMapRouteParamsImpl implements _EventMapRouteParams {
  const _$EventMapRouteParamsImpl({required this.vehicleEvent});

  factory _$EventMapRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventMapRouteParamsImplFromJson(json);

  @override
  final VehicleEvent vehicleEvent;

  @override
  String toString() {
    return 'EventMapRouteParams(vehicleEvent: $vehicleEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventMapRouteParamsImpl &&
            (identical(other.vehicleEvent, vehicleEvent) ||
                other.vehicleEvent == vehicleEvent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vehicleEvent);

  /// Create a copy of EventMapRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventMapRouteParamsImplCopyWith<_$EventMapRouteParamsImpl> get copyWith =>
      __$$EventMapRouteParamsImplCopyWithImpl<_$EventMapRouteParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventMapRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _EventMapRouteParams implements EventMapRouteParams {
  const factory _EventMapRouteParams(
      {required final VehicleEvent vehicleEvent}) = _$EventMapRouteParamsImpl;

  factory _EventMapRouteParams.fromJson(Map<String, dynamic> json) =
      _$EventMapRouteParamsImpl.fromJson;

  @override
  VehicleEvent get vehicleEvent;

  /// Create a copy of EventMapRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventMapRouteParamsImplCopyWith<_$EventMapRouteParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShareLocationRouteParams _$ShareLocationRouteParamsFromJson(
    Map<String, dynamic> json) {
  return _ShareLocationRouteParams.fromJson(json);
}

/// @nodoc
mixin _$ShareLocationRouteParams {
  Device get vehicle => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;

  /// Serializes this ShareLocationRouteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShareLocationRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShareLocationRouteParamsCopyWith<ShareLocationRouteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareLocationRouteParamsCopyWith<$Res> {
  factory $ShareLocationRouteParamsCopyWith(ShareLocationRouteParams value,
          $Res Function(ShareLocationRouteParams) then) =
      _$ShareLocationRouteParamsCopyWithImpl<$Res, ShareLocationRouteParams>;
  @useResult
  $Res call({Device vehicle, String deviceId});

  $DeviceCopyWith<$Res> get vehicle;
}

/// @nodoc
class _$ShareLocationRouteParamsCopyWithImpl<$Res,
        $Val extends ShareLocationRouteParams>
    implements $ShareLocationRouteParamsCopyWith<$Res> {
  _$ShareLocationRouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShareLocationRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Device,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ShareLocationRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get vehicle {
    return $DeviceCopyWith<$Res>(_value.vehicle, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShareLocationRouteParamsImplCopyWith<$Res>
    implements $ShareLocationRouteParamsCopyWith<$Res> {
  factory _$$ShareLocationRouteParamsImplCopyWith(
          _$ShareLocationRouteParamsImpl value,
          $Res Function(_$ShareLocationRouteParamsImpl) then) =
      __$$ShareLocationRouteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device vehicle, String deviceId});

  @override
  $DeviceCopyWith<$Res> get vehicle;
}

/// @nodoc
class __$$ShareLocationRouteParamsImplCopyWithImpl<$Res>
    extends _$ShareLocationRouteParamsCopyWithImpl<$Res,
        _$ShareLocationRouteParamsImpl>
    implements _$$ShareLocationRouteParamsImplCopyWith<$Res> {
  __$$ShareLocationRouteParamsImplCopyWithImpl(
      _$ShareLocationRouteParamsImpl _value,
      $Res Function(_$ShareLocationRouteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShareLocationRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? deviceId = null,
  }) {
    return _then(_$ShareLocationRouteParamsImpl(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Device,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareLocationRouteParamsImpl implements _ShareLocationRouteParams {
  const _$ShareLocationRouteParamsImpl(
      {required this.vehicle, required this.deviceId});

  factory _$ShareLocationRouteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareLocationRouteParamsImplFromJson(json);

  @override
  final Device vehicle;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'ShareLocationRouteParams(vehicle: $vehicle, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareLocationRouteParamsImpl &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vehicle, deviceId);

  /// Create a copy of ShareLocationRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareLocationRouteParamsImplCopyWith<_$ShareLocationRouteParamsImpl>
      get copyWith => __$$ShareLocationRouteParamsImplCopyWithImpl<
          _$ShareLocationRouteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareLocationRouteParamsImplToJson(
      this,
    );
  }
}

abstract class _ShareLocationRouteParams implements ShareLocationRouteParams {
  const factory _ShareLocationRouteParams(
      {required final Device vehicle,
      required final String deviceId}) = _$ShareLocationRouteParamsImpl;

  factory _ShareLocationRouteParams.fromJson(Map<String, dynamic> json) =
      _$ShareLocationRouteParamsImpl.fromJson;

  @override
  Device get vehicle;
  @override
  String get deviceId;

  /// Create a copy of ShareLocationRouteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShareLocationRouteParamsImplCopyWith<_$ShareLocationRouteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
