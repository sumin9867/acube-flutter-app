import 'package:gpspro/core/exceptions/nodata_exception.dart';
import 'package:gpspro/data/sources/local_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LocalSource)
class LocalSourceImpl implements LocalSource {
  SharedPreferences sharedPref;
  LocalSourceImpl({required this.sharedPref});

  @override
  Future<void> setValue(String key, String value) async {
    await sharedPref.setString(key, value);
  }

  @override
  String getValue(String key) {
    final value = sharedPref.getString(key);
    if (value == null) throw NoDataException();
    return value;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await sharedPref.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return sharedPref.getBool(key);
  }

  @override
  Future<bool> clear() async {
    final bool isCleared = await sharedPref.clear();
    return isCleared;
  }

  @override
  Future<bool> remove(String key) async {
    final isRemoved = await sharedPref.remove(key);
    return isRemoved;
  }
}
