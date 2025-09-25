import 'dart:developer';

import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();
  static final Logger _logger = Logger(
    output: _CustomConsoleOutput(),
    printer: PrettyPrinter(
      // Do not print call stack for verbose, debug and info
      methodCount: 0,
      errorMethodCount: 10,
    ),
  );

  /// Log a object at level [Level.trace].
  static void trace(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.t(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a object at level [Level.debug].
  static void debug(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a object at level [Level.info].
  static void info(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a object at level [Level.warning].
  static void warning(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a object at level [Level.error].
  static void error(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a object at level [Level.fatal].
  static void fatal(dynamic message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    _logger.f(message, time: time, error: error, stackTrace: stackTrace);
  }
}

class _CustomConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(printWrapped);
  }

  void printWrapped(String text) {
    // 800 is the size of each chunk
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => log(match.group(0).toString()));
  }
}
