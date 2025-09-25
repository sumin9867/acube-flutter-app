import 'package:freezed_annotation/freezed_annotation.dart';

part 'khalti_init_model.freezed.dart';
part 'khalti_init_model.g.dart';

@freezed
class KhaltiInitModel with _$KhaltiInitModel {
  factory KhaltiInitModel({
    required String pidx,
    @JsonKey(name: 'payment_url') required String paymentUrl,
    @JsonKey(name: 'expires_at') required DateTime expiresAt,
    @JsonKey(name: 'expires_in') required int expiresIn,
  }) = _KhaltiInitModel;

  factory KhaltiInitModel.fromJson(Map<String, dynamic> json) =>
      _$KhaltiInitModelFromJson(json);
}
