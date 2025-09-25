import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final MethodChannel platform = const MethodChannel('dexterx.dev/flutter_local_notifications_example');
  String? selectedNotificationPayload;
  int id = 0;
  // initialise the plugin. app_icon needs to be a added as a drawable
  // resource to the Android head project
  LocalNotificationService() {
    initialize();
  }

  Future initialize() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        !kIsWeb && Platform.isLinux ? null : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload = notificationAppLaunchDetails!.notificationResponse?.payload;
    }
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsIOS = const DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            selectNotification(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            if (notificationResponse.actionId == 'NOTIF_ACTION_ID') {
              selectNotification(notificationResponse.payload);
            }
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  Future<void> onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    showNotification(title, body, payload);
  }

  Future selectNotification(String? payload) async {
    AppLogger.info("On select notification ==> ${payload ?? ""}");

    if (payload != null) {}
  }

  Future<void> showNotification(String? title, String? message, dynamic data) async {
    if (!locator.get<AuthCubit>().isAuthenticated) return;
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      '@string/default_notification_channel_id',
      'Default channel',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      category: AndroidNotificationCategory.system,
      styleInformation: BigTextStyleInformation(''),
      visibility: NotificationVisibility.public,
    );
    const iOSNotificationDetails = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSNotificationDetails,
    );
    final String titleToDisplay = title ?? '';
    final String messageToDisplay = message ?? '';
    if (Platform.isIOS) {
      final permissionResult = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      if (!permissionResult!) {
        return;
      }
    }
    await flutterLocalNotificationsPlugin.show(id++, titleToDisplay, messageToDisplay, notificationDetails,
        payload: json.encode(data));
  }

  Future<void> clearAllNotification() async {
    flutterLocalNotificationsPlugin.cancelAll();
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print('notification action tapped with input: ${notificationResponse.input}');
  }
}
