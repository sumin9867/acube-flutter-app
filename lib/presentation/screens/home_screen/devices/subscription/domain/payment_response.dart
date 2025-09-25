import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response.freezed.dart';
part 'payment_response.g.dart';

@freezed
class PaymentResponse with _$PaymentResponse {
  const factory PaymentResponse({
    @JsonKey(name: 'UpdatedDevice') required UpdatedDevice? updatedDevice,
    required PaymentInfo? paymentInfo,
    required String? message,
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
}

@freezed
class UpdatedDevice with _$UpdatedDevice {
  const factory UpdatedDevice({
    required int? id,
    required String? name,
    required DateTime? expirationTime,
  }) = _UpdatedDevice;

  factory UpdatedDevice.fromJson(Map<String, dynamic> json) =>
      _$UpdatedDeviceFromJson(json);
}

@freezed
class PaymentInfo with _$PaymentInfo {
  const factory PaymentInfo({
    required int? amount,
    required String? status,
    required String? refId,
  }) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}
