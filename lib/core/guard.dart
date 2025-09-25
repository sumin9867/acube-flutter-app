import 'package:gpspro/core/app_logger.dart';

T? guard<T>(T Function() callback, [T? defaultValue, bool log = true]) {
  T? result;
  try {
    result = callback();
  } catch (e) {
    if (log) AppLogger.error(e);
  }
  return result ?? defaultValue;
}

Future<T?> asyncGuard<T>(Future<T> Function() callback,
    [T? defaultValue, bool log = true]) async {
  T? result;
  try {
    result = await callback();
  } catch (e) {
    if (log) AppLogger.error(e);
  }
  return result ?? defaultValue;
}
