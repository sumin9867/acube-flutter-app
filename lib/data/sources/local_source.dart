abstract class LocalSource {
  Future<void> setValue(String key, String value);
  String getValue(String key);
  Future<void> setBool(String key, bool value);
  bool? getBool(String key);
  Future<bool> remove(String key);
  Future<bool> clear();
}

class LocalSourceKeys {
  static const String user = 'user';
  static const String hasRunBefore = 'HAS_RUN_BEFORE';
}
