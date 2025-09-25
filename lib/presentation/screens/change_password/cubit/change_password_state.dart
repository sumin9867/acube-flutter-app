part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _InitialState;
  const factory ChangePasswordState.loading({String? message}) = _LoadingState;
  const factory ChangePasswordState.failed({required String message}) = _FailedState;
  const factory ChangePasswordState.success({String? message}) = _SuccessState;
}
