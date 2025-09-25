part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.resendInProgress() = _ResendInProgress;

  const factory ForgotPasswordState.success(String email) = _Success;
  const factory ForgotPasswordState.error(AppException exception) = _Error;
}
