import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history_model.freezed.dart';
part 'payment_history_model.g.dart';

@freezed
class PaymentHistoryModel with _$PaymentHistoryModel {
  const factory PaymentHistoryModel({
    required String deviceId,
    required double amount,
    required String status,
    required String method,
    required String $id,
    required String $createdAt,
    required DurationInfo durationInfo, // ✅ added field
  }) = _PaymentHistoryModel;

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) => _$PaymentHistoryModelFromJson(json);
}

@freezed
class DurationInfo with _$DurationInfo {
  const factory DurationInfo({
    required int duration,
    @JsonKey(name: 'duration_unit') required String durationUnit,
    @JsonKey(name: 'bonus_days') int? bonusDays,
  }) = _DurationInfo;

  factory DurationInfo.fromJson(Map<String, dynamic> json) => _$DurationInfoFromJson(json);
}
