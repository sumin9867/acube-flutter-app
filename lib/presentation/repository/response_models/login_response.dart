import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/domain/models/user_session.dart';

class LoginResponse {
  final UserSession userSession;
  final User user;

  const LoginResponse({
    required this.userSession,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userSession: UserSession.fromJson(json),
        user: User.fromJson(json),
      );
}
