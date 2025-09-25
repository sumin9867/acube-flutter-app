part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated(User user) = AuthenticatedState;
  const factory AuthState.unAuthenticated() = UnAuthenticatedState;
  const factory AuthState.error(String errorMessage) = ErrorState;
  const factory AuthState.loading(String errorMessage) = _Loading;
  const factory AuthState.success(String errorMessage) = _Success;
}
