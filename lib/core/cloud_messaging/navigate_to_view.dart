// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/router/app_router.dart';

void navigateToView(String? payload) {
  AppLogger.info("On Navigate to View ==> ${payload ?? ""}");
  if (payload != null) {
    final payloadMap = jsonDecode(payload);
    final String notificationId = payloadMap['notification_id'];
    dynamic dataMap = {};
    try {
      dataMap = jsonDecode(payloadMap['data']);
    } catch (err) {
      dataMap = payloadMap['data'];
    }
    final currentCtx = locator.get<AppRouter>().navigationKey.currentContext;

    switch (notificationId) {
      case 'NOTIF_TRACCON_001':
        break;
    }
  }
}
