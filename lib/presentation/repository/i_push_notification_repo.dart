import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/domain/models/user_session.dart';

abstract class IPushNotificationRepo {
  Future<bool> saveFcmToken(
    User user,
    UserSession session,
    String token,
  );
  Future<bool> removeFcmToken(
    User user,
    UserSession session,
    String token,
  );
}
