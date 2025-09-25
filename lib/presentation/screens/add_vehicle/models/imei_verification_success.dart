import 'package:freezed_annotation/freezed_annotation.dart';

part 'imei_verification_success.freezed.dart';

@freezed
class ImeiVerificationSuccess with _$ImeiVerificationSuccess {
  const factory ImeiVerificationSuccess.network(
      {required String apiData}) = _Network;

}
