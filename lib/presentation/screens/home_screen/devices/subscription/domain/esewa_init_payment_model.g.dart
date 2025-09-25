// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esewa_init_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EsewaInitPaymentModelImpl _$$EsewaInitPaymentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EsewaInitPaymentModelImpl(
      amount: json['amount'] as String?,
      failureUrl: json['failure_url'] as String?,
      productDeliveryCharge: json['product_delivery_charge'] as String?,
      productServiceCharge: json['product_service_charge'] as String?,
      productCode: json['product_code'] as String?,
      signature: json['signature'] as String?,
      signedFieldNames: json['signed_field_names'] as String?,
      successUrl: json['success_url'] as String?,
      taxAmount: json['tax_amount'] as String?,
      totalAmount: json['total_amount'] as String?,
      transactionUuid: json['transaction_uuid'] as String,
    );

Map<String, dynamic> _$$EsewaInitPaymentModelImplToJson(
        _$EsewaInitPaymentModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'failure_url': instance.failureUrl,
      'product_delivery_charge': instance.productDeliveryCharge,
      'product_service_charge': instance.productServiceCharge,
      'product_code': instance.productCode,
      'signature': instance.signature,
      'signed_field_names': instance.signedFieldNames,
      'success_url': instance.successUrl,
      'tax_amount': instance.taxAmount,
      'total_amount': instance.totalAmount,
      'transaction_uuid': instance.transactionUuid,
    };
