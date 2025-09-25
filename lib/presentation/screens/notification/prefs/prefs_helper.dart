import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static const String hasSeenNotificationScreenKey =
      'hasSeenNotificationScreen';

  // Save that user has seen the notification screen
  Future<void> setHasSeenNotificationScreen(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(hasSeenNotificationScreenKey, value);
  }

  // Check if user has seen the notification screen
  Future<bool> hasSeenNotificationScreen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(hasSeenNotificationScreenKey) ?? false;
  }

  Future<void> clearHasSeenNotificationScreen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(hasSeenNotificationScreenKey);
  }
}
