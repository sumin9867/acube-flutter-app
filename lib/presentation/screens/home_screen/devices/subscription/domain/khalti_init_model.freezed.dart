// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'khalti_init_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KhaltiInitModel _$KhaltiInitModelFromJson(Map<String, dynamic> json) {
  return _KhaltiInitModel.fromJson(json);
}

/// @nodoc
mixin _$KhaltiInitModel {
  String get pidx => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_url')
  String get paymentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this KhaltiInitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KhaltiInitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KhaltiInitModelCopyWith<KhaltiInitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KhaltiInitModelCopyWith<$Res> {
  factory $KhaltiInitModelCopyWith(
          KhaltiInitModel value, $Res Function(KhaltiInitModel) then) =
      _$KhaltiInitModelCopyWithImpl<$Res, KhaltiInitModel>;
  @useResult
  $Res call(
      {String pidx,
      @JsonKey(name: 'payment_url') String paymentUrl,
      @JsonKey(name: 'expires_at') DateTime expiresAt,
      @JsonKey(name: 'expires_in') int expiresIn});
}

/// @nodoc
class _$KhaltiInitModelCopyWithImpl<$Res, $Val extends KhaltiInitModel>
    implements $KhaltiInitModelCopyWith<$Res> {
  _$KhaltiInitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KhaltiInitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pidx = null,
    Object? paymentUrl = null,
    Object? expiresAt = null,
    Object? expiresIn = null,
  }) {
    return _then(_value.copyWith(
      pidx: null == pidx
          ? _value.pidx
          : pidx // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KhaltiInitModelImplCopyWith<$Res>
    implements $KhaltiInitModelCopyWith<$Res> {
  factory _$$KhaltiInitModelImplCopyWith(_$KhaltiInitModelImpl value,
          $Res Function(_$KhaltiInitModelImpl) then) =
      __$$KhaltiInitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pidx,
      @JsonKey(name: 'payment_url') String paymentUrl,
      @JsonKey(name: 'expires_at') DateTime expiresAt,
      @JsonKey(name: 'expires_in') int expiresIn});
}

/// @nodoc
class __$$KhaltiInitModelImplCopyWithImpl<$Res>
    extends _$KhaltiInitModelCopyWithImpl<$Res, _$KhaltiInitModelImpl>
    implements _$$KhaltiInitModelImplCopyWith<$Res> {
  __$$KhaltiInitModelImplCopyWithImpl(
      _$KhaltiInitModelImpl _value, $Res Function(_$KhaltiInitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KhaltiInitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pidx = null,
    Object? paymentUrl = null,
    Object? expiresAt = null,
    Object? expiresIn = null,
  }) {
    return _then(_$KhaltiInitModelImpl(
      pidx: null == pidx
          ? _value.pidx
          : pidx // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KhaltiInitModelImpl implements _KhaltiInitModel {
  _$KhaltiInitModelImpl(
      {required this.pidx,
      @JsonKey(name: 'payment_url') required this.paymentUrl,
      @JsonKey(name: 'expires_at') required this.expiresAt,
      @JsonKey(name: 'expires_in') required this.expiresIn});

  factory _$KhaltiInitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KhaltiInitModelImplFromJson(json);

  @override
  final String pidx;
  @override
  @JsonKey(name: 'payment_url')
  final String paymentUrl;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  @override
  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @override
  String toString() {
    return 'KhaltiInitModel(pidx: $pidx, paymentUrl: $paymentUrl, expiresAt: $expiresAt, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KhaltiInitModelImpl &&
            (identical(other.pidx, pidx) || other.pidx == pidx) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pidx, paymentUrl, expiresAt, expiresIn);

  /// Create a copy of KhaltiInitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KhaltiInitModelImplCopyWith<_$KhaltiInitModelImpl> get copyWith =>
      __$$KhaltiInitModelImplCopyWithImpl<_$KhaltiInitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KhaltiInitModelImplToJson(
      this,
    );
  }
}

abstract class _KhaltiInitModel implements KhaltiInitModel {
  factory _KhaltiInitModel(
          {required final String pidx,
          @JsonKey(name: 'payment_url') required final String paymentUrl,
          @JsonKey(name: 'expires_at') required final DateTime expiresAt,
          @JsonKey(name: 'expires_in') required final int expiresIn}) =
      _$KhaltiInitModelImpl;

  factory _KhaltiInitModel.fromJson(Map<String, dynamic> json) =
      _$KhaltiInitModelImpl.fromJson;

  @override
  String get pidx;
  @override
  @JsonKey(name: 'payment_url')
  String get paymentUrl;
  @override
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;
  @override
  @JsonKey(name: 'expires_in')
  int get expiresIn;

  /// Create a copy of KhaltiInitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KhaltiInitModelImplCopyWith<_$KhaltiInitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
