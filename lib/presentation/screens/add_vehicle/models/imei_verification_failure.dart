import 'package:freezed_annotation/freezed_annotation.dart';

part 'imei_verification_failure.freezed.dart';

@freezed
class ImeiVerificationFailure with _$ImeiVerificationFailure {
  const factory ImeiVerificationFailure.server() = _Server;
  const factory ImeiVerificationFailure.storage() = _Storage;
  const factory ImeiVerificationFailure.network() = _Network;
  const factory ImeiVerificationFailure.client({required String message}) =
      _Client;
}
