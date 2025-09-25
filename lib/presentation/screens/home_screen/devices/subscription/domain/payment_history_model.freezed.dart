// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentHistoryModel _$PaymentHistoryModelFromJson(Map<String, dynamic> json) {
  return _PaymentHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentHistoryModel {
  String get deviceId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get $id => throw _privateConstructorUsedError;
  String get $createdAt => throw _privateConstructorUsedError;
  DurationInfo get durationInfo => throw _privateConstructorUsedError;

  /// Serializes this PaymentHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentHistoryModelCopyWith<PaymentHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryModelCopyWith<$Res> {
  factory $PaymentHistoryModelCopyWith(
          PaymentHistoryModel value, $Res Function(PaymentHistoryModel) then) =
      _$PaymentHistoryModelCopyWithImpl<$Res, PaymentHistoryModel>;
  @useResult
  $Res call(
      {String deviceId,
      double amount,
      String status,
      String method,
      String $id,
      String $createdAt,
      DurationInfo durationInfo});

  $DurationInfoCopyWith<$Res> get durationInfo;
}

/// @nodoc
class _$PaymentHistoryModelCopyWithImpl<$Res, $Val extends PaymentHistoryModel>
    implements $PaymentHistoryModelCopyWith<$Res> {
  _$PaymentHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? amount = null,
    Object? status = null,
    Object? method = null,
    Object? $id = null,
    Object? $createdAt = null,
    Object? durationInfo = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      $id: null == $id
          ? _value.$id
          : $id // ignore: cast_nullable_to_non_nullable
              as String,
      $createdAt: null == $createdAt
          ? _value.$createdAt
          : $createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      durationInfo: null == durationInfo
          ? _value.durationInfo
          : durationInfo // ignore: cast_nullable_to_non_nullable
              as DurationInfo,
    ) as $Val);
  }

  /// Create a copy of PaymentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DurationInfoCopyWith<$Res> get durationInfo {
    return $DurationInfoCopyWith<$Res>(_value.durationInfo, (value) {
      return _then(_value.copyWith(durationInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentHistoryModelImplCopyWith<$Res>
    implements $PaymentHistoryModelCopyWith<$Res> {
  factory _$$PaymentHistoryModelImplCopyWith(_$PaymentHistoryModelImpl value,
          $Res Function(_$PaymentHistoryModelImpl) then) =
      __$$PaymentHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      double amount,
      String status,
      String method,
      String $id,
      String $createdAt,
      DurationInfo durationInfo});

  @override
  $DurationInfoCopyWith<$Res> get durationInfo;
}

/// @nodoc
class __$$PaymentHistoryModelImplCopyWithImpl<$Res>
    extends _$PaymentHistoryModelCopyWithImpl<$Res, _$PaymentHistoryModelImpl>
    implements _$$PaymentHistoryModelImplCopyWith<$Res> {
  __$$PaymentHistoryModelImplCopyWithImpl(_$PaymentHistoryModelImpl _value,
      $Res Function(_$PaymentHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? amount = null,
    Object? status = null,
    Object? method = null,
    Object? $id = null,
    Object? $createdAt = null,
    Object? durationInfo = null,
  }) {
    return _then(_$PaymentHistoryModelImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      $id: null == $id
          ? _value.$id
          : $id // ignore: cast_nullable_to_non_nullable
              as String,
      $createdAt: null == $createdAt
          ? _value.$createdAt
          : $createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      durationInfo: null == durationInfo
          ? _value.durationInfo
          : durationInfo // ignore: cast_nullable_to_non_nullable
              as DurationInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentHistoryModelImpl implements _PaymentHistoryModel {
  const _$PaymentHistoryModelImpl(
      {required this.deviceId,
      required this.amount,
      required this.status,
      required this.method,
      required this.$id,
      required this.$createdAt,
      required this.durationInfo});

  factory _$PaymentHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentHistoryModelImplFromJson(json);

  @override
  final String deviceId;
  @override
  final double amount;
  @override
  final String status;
  @override
  final String method;
  @override
  final String $id;
  @override
  final String $createdAt;
  @override
  final DurationInfo durationInfo;

  @override
  String toString() {
    return 'PaymentHistoryModel(deviceId: $deviceId, amount: $amount, status: $status, method: $method, \$id: ${$id}, \$createdAt: ${$createdAt}, durationInfo: $durationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.$id, $id) || other.$id == $id) &&
            (identical(other.$createdAt, $createdAt) ||
                other.$createdAt == $createdAt) &&
            (identical(other.durationInfo, durationInfo) ||
                other.durationInfo == durationInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, amount, status, method,
      $id, $createdAt, durationInfo);

  /// Create a copy of PaymentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryModelImplCopyWith<_$PaymentHistoryModelImpl> get copyWith =>
      __$$PaymentHistoryModelImplCopyWithImpl<_$PaymentHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentHistoryModel implements PaymentHistoryModel {
  const factory _PaymentHistoryModel(
      {required final String deviceId,
      required final double amount,
      required final String status,
      required final String method,
      required final String $id,
      required final String $createdAt,
      required final DurationInfo durationInfo}) = _$PaymentHistoryModelImpl;

  factory _PaymentHistoryModel.fromJson(Map<String, dynamic> json) =
      _$PaymentHistoryModelImpl.fromJson;

  @override
  String get deviceId;
  @override
  double get amount;
  @override
  String get status;
  @override
  String get method;
  @override
  String get $id;
  @override
  String get $createdAt;
  @override
  DurationInfo get durationInfo;

  /// Create a copy of PaymentHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentHistoryModelImplCopyWith<_$PaymentHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DurationInfo _$DurationInfoFromJson(Map<String, dynamic> json) {
  return _DurationInfo.fromJson(json);
}

/// @nodoc
mixin _$DurationInfo {
  int get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_unit')
  String get durationUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_days')
  int? get bonusDays => throw _privateConstructorUsedError;

  /// Serializes this DurationInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DurationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DurationInfoCopyWith<DurationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationInfoCopyWith<$Res> {
  factory $DurationInfoCopyWith(
          DurationInfo value, $Res Function(DurationInfo) then) =
      _$DurationInfoCopyWithImpl<$Res, DurationInfo>;
  @useResult
  $Res call(
      {int duration,
      @JsonKey(name: 'duration_unit') String durationUnit,
      @JsonKey(name: 'bonus_days') int? bonusDays});
}

/// @nodoc
class _$DurationInfoCopyWithImpl<$Res, $Val extends DurationInfo>
    implements $DurationInfoCopyWith<$Res> {
  _$DurationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DurationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? durationUnit = null,
    Object? bonusDays = freezed,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      durationUnit: null == durationUnit
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as String,
      bonusDays: freezed == bonusDays
          ? _value.bonusDays
          : bonusDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DurationInfoImplCopyWith<$Res>
    implements $DurationInfoCopyWith<$Res> {
  factory _$$DurationInfoImplCopyWith(
          _$DurationInfoImpl value, $Res Function(_$DurationInfoImpl) then) =
      __$$DurationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int duration,
      @JsonKey(name: 'duration_unit') String durationUnit,
      @JsonKey(name: 'bonus_days') int? bonusDays});
}

/// @nodoc
class __$$DurationInfoImplCopyWithImpl<$Res>
    extends _$DurationInfoCopyWithImpl<$Res, _$DurationInfoImpl>
    implements _$$DurationInfoImplCopyWith<$Res> {
  __$$DurationInfoImplCopyWithImpl(
      _$DurationInfoImpl _value, $Res Function(_$DurationInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DurationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? durationUnit = null,
    Object? bonusDays = freezed,
  }) {
    return _then(_$DurationInfoImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      durationUnit: null == durationUnit
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as String,
      bonusDays: freezed == bonusDays
          ? _value.bonusDays
          : bonusDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DurationInfoImpl implements _DurationInfo {
  const _$DurationInfoImpl(
      {required this.duration,
      @JsonKey(name: 'duration_unit') required this.durationUnit,
      @JsonKey(name: 'bonus_days') this.bonusDays});

  factory _$DurationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationInfoImplFromJson(json);

  @override
  final int duration;
  @override
  @JsonKey(name: 'duration_unit')
  final String durationUnit;
  @override
  @JsonKey(name: 'bonus_days')
  final int? bonusDays;

  @override
  String toString() {
    return 'DurationInfo(duration: $duration, durationUnit: $durationUnit, bonusDays: $bonusDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationInfoImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.durationUnit, durationUnit) ||
                other.durationUnit == durationUnit) &&
            (identical(other.bonusDays, bonusDays) ||
                other.bonusDays == bonusDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, duration, durationUnit, bonusDays);

  /// Create a copy of DurationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationInfoImplCopyWith<_$DurationInfoImpl> get copyWith =>
      __$$DurationInfoImplCopyWithImpl<_$DurationInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationInfoImplToJson(
      this,
    );
  }
}

abstract class _DurationInfo implements DurationInfo {
  const factory _DurationInfo(
      {required final int duration,
      @JsonKey(name: 'duration_unit') required final String durationUnit,
      @JsonKey(name: 'bonus_days') final int? bonusDays}) = _$DurationInfoImpl;

  factory _DurationInfo.fromJson(Map<String, dynamic> json) =
      _$DurationInfoImpl.fromJson;

  @override
  int get duration;
  @override
  @JsonKey(name: 'duration_unit')
  String get durationUnit;
  @override
  @JsonKey(name: 'bonus_days')
  int? get bonusDays;

  /// Create a copy of DurationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DurationInfoImplCopyWith<_$DurationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
