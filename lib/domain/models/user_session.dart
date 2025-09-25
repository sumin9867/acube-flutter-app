import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

@freezed
class UserSession with _$UserSession {
  const factory UserSession({
    @JsonKey(name: 'id') required final int userId,
    @JsonKey(name: 'token') required final String? accessToken,
    @JsonKey(name: 'cookie') required final String? cookie,
    @JsonKey(name: 'username') required final String username,
    @JsonKey(name: 'password') required final String password,
  }) = _UserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}
