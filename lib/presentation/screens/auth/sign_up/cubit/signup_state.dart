part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _InitialState;

  const factory SignupState.loading() = _LoadingState;

  const factory SignupState.otpSent(String message) = _OtpSentState;

  const factory SignupState.otpVerified() = _OtpVerifiedState;

  const factory SignupState.resendOtp(String message) = _ResendOtpState;

  const factory SignupState.success(User user) = _SuccessState;

  const factory SignupState.error(String errorMsg) = _ErrorState;
}
