import 'dart:async';
import 'dart:math';

import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> directPhoneCall(String phoneNumber) async {
  final url = 'tel:${Uri.encodeComponent(phoneNumber)}';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
}

Future<bool> launchURL(String url) async {
  try {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      return await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      return false;
    }
  } catch (e) {
    AppLogger.error(e);
    return false;
  }
}

String getPrice(price, {String? currency = 'Rs', double factor = 1.0, int round = 0}) {
  final formatCurrency =
      NumberFormat.currency(symbol: currency, decimalDigits: round, customPattern: '\u00A4\u00A0#,##,##0.00');
  try {
    String number = '';
    if (price is String) {
      final String fprice = price.toString().replaceAll(',', '');
      number = formatCurrency.format(fprice.isNotEmpty ? double.parse(fprice) * factor : 1);
    } else {
      number = formatCurrency.format(price * factor);
    }
    return number;
  } catch (err) {
    AppLogger.error('Currency conversion error==>', error: err);
    return formatCurrency.format(0);
  }
}

DateTime timeFromJson(dynamic ts) {
  if (ts == null) return DateTime.now();
  switch (ts.runtimeType) {
    case const (DateTime):
      return ts as DateTime;
    case const (String):
      return DateTime.parse(ts as String).toLocal();
    case const (int):
      return DateTime.fromMillisecondsSinceEpoch(ts as int).toLocal();
    default:
      return DateTime.now();
  }
}

bool isURL(String s) => RegExp(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
    ).hasMatch(s);

Future<T> functionCallTimes<T>(Function function, int count) async {
  for (int i = 1; i <= count; i++) {
    try {
      return await function() as FutureOr<T>;
    } catch (e) {
      continue;
    }
  }
  throw AppException(message: 'Still error after $count try');
}

String generateHexId(int i, {int length = 20}) {
  final Random random = Random();
  const String chars = '0123456789abcdef';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}
