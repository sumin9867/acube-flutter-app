// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'esewa_init_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EsewaInitPaymentModel _$EsewaInitPaymentModelFromJson(
    Map<String, dynamic> json) {
  return _EsewaInitPaymentModel.fromJson(json);
}

/// @nodoc
mixin _$EsewaInitPaymentModel {
  @JsonKey(name: 'amount')
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'failure_url')
  String? get failureUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_delivery_charge')
  String? get productDeliveryCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_service_charge')
  String? get productServiceCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_code')
  String? get productCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'signature')
  String? get signature => throw _privateConstructorUsedError;
  @JsonKey(name: 'signed_field_names')
  String? get signedFieldNames => throw _privateConstructorUsedError;
  @JsonKey(name: 'success_url')
  String? get successUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_amount')
  String? get taxAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  String? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_uuid')
  String get transactionUuid => throw _privateConstructorUsedError;

  /// Serializes this EsewaInitPaymentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EsewaInitPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EsewaInitPaymentModelCopyWith<EsewaInitPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsewaInitPaymentModelCopyWith<$Res> {
  factory $EsewaInitPaymentModelCopyWith(EsewaInitPaymentModel value,
          $Res Function(EsewaInitPaymentModel) then) =
      _$EsewaInitPaymentModelCopyWithImpl<$Res, EsewaInitPaymentModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') String? amount,
      @JsonKey(name: 'failure_url') String? failureUrl,
      @JsonKey(name: 'product_delivery_charge') String? productDeliveryCharge,
      @JsonKey(name: 'product_service_charge') String? productServiceCharge,
      @JsonKey(name: 'product_code') String? productCode,
      @JsonKey(name: 'signature') String? signature,
      @JsonKey(name: 'signed_field_names') String? signedFieldNames,
      @JsonKey(name: 'success_url') String? successUrl,
      @JsonKey(name: 'tax_amount') String? taxAmount,
      @JsonKey(name: 'total_amount') String? totalAmount,
      @JsonKey(name: 'transaction_uuid') String transactionUuid});
}

/// @nodoc
class _$EsewaInitPaymentModelCopyWithImpl<$Res,
        $Val extends EsewaInitPaymentModel>
    implements $EsewaInitPaymentModelCopyWith<$Res> {
  _$EsewaInitPaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EsewaInitPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? failureUrl = freezed,
    Object? productDeliveryCharge = freezed,
    Object? productServiceCharge = freezed,
    Object? productCode = freezed,
    Object? signature = freezed,
    Object? signedFieldNames = freezed,
    Object? successUrl = freezed,
    Object? taxAmount = freezed,
    Object? totalAmount = freezed,
    Object? transactionUuid = null,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      failureUrl: freezed == failureUrl
          ? _value.failureUrl
          : failureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productDeliveryCharge: freezed == productDeliveryCharge
          ? _value.productDeliveryCharge
          : productDeliveryCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      productServiceCharge: freezed == productServiceCharge
          ? _value.productServiceCharge
          : productServiceCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      signedFieldNames: freezed == signedFieldNames
          ? _value.signedFieldNames
          : signedFieldNames // ignore: cast_nullable_to_non_nullable
              as String?,
      successUrl: freezed == successUrl
          ? _value.successUrl
          : successUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUuid: null == transactionUuid
          ? _value.transactionUuid
          : transactionUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EsewaInitPaymentModelImplCopyWith<$Res>
    implements $EsewaInitPaymentModelCopyWith<$Res> {
  factory _$$EsewaInitPaymentModelImplCopyWith(
          _$EsewaInitPaymentModelImpl value,
          $Res Function(_$EsewaInitPaymentModelImpl) then) =
      __$$EsewaInitPaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') String? amount,
      @JsonKey(name: 'failure_url') String? failureUrl,
      @JsonKey(name: 'product_delivery_charge') String? productDeliveryCharge,
      @JsonKey(name: 'product_service_charge') String? productServiceCharge,
      @JsonKey(name: 'product_code') String? productCode,
      @JsonKey(name: 'signature') String? signature,
      @JsonKey(name: 'signed_field_names') String? signedFieldNames,
      @JsonKey(name: 'success_url') String? successUrl,
      @JsonKey(name: 'tax_amount') String? taxAmount,
      @JsonKey(name: 'total_amount') String? totalAmount,
      @JsonKey(name: 'transaction_uuid') String transactionUuid});
}

/// @nodoc
class __$$EsewaInitPaymentModelImplCopyWithImpl<$Res>
    extends _$EsewaInitPaymentModelCopyWithImpl<$Res,
        _$EsewaInitPaymentModelImpl>
    implements _$$EsewaInitPaymentModelImplCopyWith<$Res> {
  __$$EsewaInitPaymentModelImplCopyWithImpl(_$EsewaInitPaymentModelImpl _value,
      $Res Function(_$EsewaInitPaymentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EsewaInitPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? failureUrl = freezed,
    Object? productDeliveryCharge = freezed,
    Object? productServiceCharge = freezed,
    Object? productCode = freezed,
    Object? signature = freezed,
    Object? signedFieldNames = freezed,
    Object? successUrl = freezed,
    Object? taxAmount = freezed,
    Object? totalAmount = freezed,
    Object? transactionUuid = null,
  }) {
    return _then(_$EsewaInitPaymentModelImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      failureUrl: freezed == failureUrl
          ? _value.failureUrl
          : failureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productDeliveryCharge: freezed == productDeliveryCharge
          ? _value.productDeliveryCharge
          : productDeliveryCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      productServiceCharge: freezed == productServiceCharge
          ? _value.productServiceCharge
          : productServiceCharge // ignore: cast_nullable_to_non_nullable
              as String?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      signedFieldNames: freezed == signedFieldNames
          ? _value.signedFieldNames
          : signedFieldNames // ignore: cast_nullable_to_non_nullable
              as String?,
      successUrl: freezed == successUrl
          ? _value.successUrl
          : successUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUuid: null == transactionUuid
          ? _value.transactionUuid
          : transactionUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EsewaInitPaymentModelImpl implements _EsewaInitPaymentModel {
  const _$EsewaInitPaymentModelImpl(
      {@JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'failure_url') this.failureUrl,
      @JsonKey(name: 'product_delivery_charge') this.productDeliveryCharge,
      @JsonKey(name: 'product_service_charge') this.productServiceCharge,
      @JsonKey(name: 'product_code') this.productCode,
      @JsonKey(name: 'signature') this.signature,
      @JsonKey(name: 'signed_field_names') this.signedFieldNames,
      @JsonKey(name: 'success_url') this.successUrl,
      @JsonKey(name: 'tax_amount') this.taxAmount,
      @JsonKey(name: 'total_amount') this.totalAmount,
      @JsonKey(name: 'transaction_uuid') required this.transactionUuid});

  factory _$EsewaInitPaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EsewaInitPaymentModelImplFromJson(json);

  @override
  @JsonKey(name: 'amount')
  final String? amount;
  @override
  @JsonKey(name: 'failure_url')
  final String? failureUrl;
  @override
  @JsonKey(name: 'product_delivery_charge')
  final String? productDeliveryCharge;
  @override
  @JsonKey(name: 'product_service_charge')
  final String? productServiceCharge;
  @override
  @JsonKey(name: 'product_code')
  final String? productCode;
  @override
  @JsonKey(name: 'signature')
  final String? signature;
  @override
  @JsonKey(name: 'signed_field_names')
  final String? signedFieldNames;
  @override
  @JsonKey(name: 'success_url')
  final String? successUrl;
  @override
  @JsonKey(name: 'tax_amount')
  final String? taxAmount;
  @override
  @JsonKey(name: 'total_amount')
  final String? totalAmount;
  @override
  @JsonKey(name: 'transaction_uuid')
  final String transactionUuid;

  @override
  String toString() {
    return 'EsewaInitPaymentModel(amount: $amount, failureUrl: $failureUrl, productDeliveryCharge: $productDeliveryCharge, productServiceCharge: $productServiceCharge, productCode: $productCode, signature: $signature, signedFieldNames: $signedFieldNames, successUrl: $successUrl, taxAmount: $taxAmount, totalAmount: $totalAmount, transactionUuid: $transactionUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsewaInitPaymentModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.failureUrl, failureUrl) ||
                other.failureUrl == failureUrl) &&
            (identical(other.productDeliveryCharge, productDeliveryCharge) ||
                other.productDeliveryCharge == productDeliveryCharge) &&
            (identical(other.productServiceCharge, productServiceCharge) ||
                other.productServiceCharge == productServiceCharge) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.signedFieldNames, signedFieldNames) ||
                other.signedFieldNames == signedFieldNames) &&
            (identical(other.successUrl, successUrl) ||
                other.successUrl == successUrl) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.transactionUuid, transactionUuid) ||
                other.transactionUuid == transactionUuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      failureUrl,
      productDeliveryCharge,
      productServiceCharge,
      productCode,
      signature,
      signedFieldNames,
      successUrl,
      taxAmount,
      totalAmount,
      transactionUuid);

  /// Create a copy of EsewaInitPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EsewaInitPaymentModelImplCopyWith<_$EsewaInitPaymentModelImpl>
      get copyWith => __$$EsewaInitPaymentModelImplCopyWithImpl<
          _$EsewaInitPaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EsewaInitPaymentModelImplToJson(
      this,
    );
  }
}

abstract class _EsewaInitPaymentModel implements EsewaInitPaymentModel {
  const factory _EsewaInitPaymentModel(
      {@JsonKey(name: 'amount') final String? amount,
      @JsonKey(name: 'failure_url') final String? failureUrl,
      @JsonKey(name: 'product_delivery_charge')
      final String? productDeliveryCharge,
      @JsonKey(name: 'product_service_charge')
      final String? productServiceCharge,
      @JsonKey(name: 'product_code') final String? productCode,
      @JsonKey(name: 'signature') final String? signature,
      @JsonKey(name: 'signed_field_names') final String? signedFieldNames,
      @JsonKey(name: 'success_url') final String? successUrl,
      @JsonKey(name: 'tax_amount') final String? taxAmount,
      @JsonKey(name: 'total_amount') final String? totalAmount,
      @JsonKey(name: 'transaction_uuid')
      required final String transactionUuid}) = _$EsewaInitPaymentModelImpl;

  factory _EsewaInitPaymentModel.fromJson(Map<String, dynamic> json) =
      _$EsewaInitPaymentModelImpl.fromJson;

  @override
  @JsonKey(name: 'amount')
  String? get amount;
  @override
  @JsonKey(name: 'failure_url')
  String? get failureUrl;
  @override
  @JsonKey(name: 'product_delivery_charge')
  String? get productDeliveryCharge;
  @override
  @JsonKey(name: 'product_service_charge')
  String? get productServiceCharge;
  @override
  @JsonKey(name: 'product_code')
  String? get productCode;
  @override
  @JsonKey(name: 'signature')
  String? get signature;
  @override
  @JsonKey(name: 'signed_field_names')
  String? get signedFieldNames;
  @override
  @JsonKey(name: 'success_url')
  String? get successUrl;
  @override
  @JsonKey(name: 'tax_amount')
  String? get taxAmount;
  @override
  @JsonKey(name: 'total_amount')
  String? get totalAmount;
  @override
  @JsonKey(name: 'transaction_uuid')
  String get transactionUuid;

  /// Create a copy of EsewaInitPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsewaInitPaymentModelImplCopyWith<_$EsewaInitPaymentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
