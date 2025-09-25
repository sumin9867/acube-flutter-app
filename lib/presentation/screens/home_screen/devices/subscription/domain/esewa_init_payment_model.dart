import 'package:freezed_annotation/freezed_annotation.dart';

part 'esewa_init_payment_model.freezed.dart';
part 'esewa_init_payment_model.g.dart';

@freezed
class EsewaInitPaymentModel with _$EsewaInitPaymentModel {
  const factory EsewaInitPaymentModel({
    @JsonKey(name: 'amount') String? amount,
    @JsonKey(name: 'failure_url') String? failureUrl,
    @JsonKey(name: 'product_delivery_charge') String? productDeliveryCharge,
    @JsonKey(name: 'product_service_charge') String? productServiceCharge,
    @JsonKey(name: 'product_code') String? productCode,
    @JsonKey(name: 'signature') String? signature,
    @JsonKey(name: 'signed_field_names') String? signedFieldNames,
    @JsonKey(name: 'success_url') String? successUrl,
    @JsonKey(name: 'tax_amount') String? taxAmount,
    @JsonKey(name: 'total_amount') String? totalAmount,
    @JsonKey(name: 'transaction_uuid') required String transactionUuid,
  }) = _EsewaInitPaymentModel;

  factory EsewaInitPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$EsewaInitPaymentModelFromJson(json);
}
