part of 'signin_cubit.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState.initial() = _Initial;
  const factory SigninState.loading() = _Loading;
  const factory SigninState.success(User user) = _Success;
  const factory SigninState.phoneLogin(String userName) = PhoneLogin;

  const factory SigninState.error(AppException exception) = _Error;
}
