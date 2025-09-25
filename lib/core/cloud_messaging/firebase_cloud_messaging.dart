// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'dart:io';

import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/app_permission.dart';
import 'package:gpspro/core/cloud_messaging/local_notification_service.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/data/sources/local_source.dart';
import 'package:gpspro/data/sources/sources_impl/local_source_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_alert_window/system_alert_window.dart';

@LazySingleton()
class CloudMessaging {
  late final FirebaseMessaging _fcm;
  late final String _fcmToken;

  String get fcmToken => _fcmToken;
  bool isFlutterLocalNotificationsInitialized = false;
  late AndroidNotificationChannel channel;

  Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyCxycdtFmkmDfmLrf895tMKdqGGtOBvPrk',
          appId: '1:303684458367:android:1e2198ab2370acd3b8ac4a',
          messagingSenderId: '303684458367',
          projectId: 'trackon-32270',
        ),
      );
      _fcm = FirebaseMessaging.instance;
      _fcm.setAutoInitEnabled(true);
      await _requestPermission();
      await _getToken();
      _listenInitialMessage();
      _listenOnMessageOpenApp();
      _listenForegroundMessage();
      _listenBackgroundMessage();
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _requestPermission() async {
    if (Platform.isAndroid) {
      locator
          .get<LocalNotificationService>()
          .flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    } else if (Platform.isIOS) {
      final NotificationSettings settings = await _fcm.requestPermission(provisional: true);
      AppLogger.info('CM user grant permission ==> ${settings.authorizationStatus}');
    }
  }

  Future<void> _getToken() async {
    try {
      _fcmToken = await _fcm.getToken() ?? '';
      _fcm.onTokenRefresh.listen((newFcmToken) {
        _fcmToken = newFcmToken;
      });
      AppLogger.info('FCM get token ==> $_fcmToken');
    } catch (e) {
      _fcmToken = '';
      AppLogger.error('FCM get token ==>$e');
    }
  }

  Future<void> _listenInitialMessage() async {
    final RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      AppLogger.info('CM initial message');
      _handleMessage(initialMessage);
    }
    final RemoteMessage? message = await _fcm.getInitialMessage();
    if (message != null) {
      AppLogger.info('CM initial message ==> $_fcmToken');
    }
  }

  void _listenOnMessageOpenApp() {
    AppLogger.info('CM onclick open app');
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _listenForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AppLogger.info('CM foreground message ==> ${message.data}');
      _handleMessage(message);

      if (message.notification != null) {
        AppLogger.info(
            'CM foreground message notification ==> title: ${message.notification?.title}  body: ${message.notification?.body}');
        final RemoteNotification notification = message.notification!;
        final isInstant = message.data['is_instant'];
        final bool isInstantNotification = isInstant == 'true';
        final String? devicename = message.notification?.body?.split('ignition')[0];
        log('---$devicename---');
      }
    });
  }

  void _listenBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

void _handleMessage(RemoteMessage message) async {
  try {
    if (!locator.get<AuthCubit>().isAuthenticated) return;
    if (message.notification != null) {
      AppLogger.info('Notification ==> title: ${message.notification?.title}  body: ${message.notification?.body}');
      final RemoteNotification notification = message.notification!;
      if (notification.body?.toLowerCase().contains('ignition on') ?? false) {
        final String devicename = notification.body!.split('ignition')[0].trim();
        final isAntiTheftEnabled = locator.get<LocalSource>().getBool(devicename);
        AppLogger.debug('Anti-theft enabled ===> $isAntiTheftEnabled');
        if (isAntiTheftEnabled ?? true) {
          AppPermissions.checkSystemAlertPermission();
          await SystemAlertWindow.sendMessageToOverlay(
            'show_antitheft_alert:$devicename',
          );
          SystemAlertWindow.showSystemWindow(
            height: 400,
            width: 400,
            gravity: SystemWindowGravity.CENTER,
            prefMode: SystemWindowPrefMode.OVERLAY,
          );
        } else {
          locator<LocalNotificationService>().showNotification(
            notification.title,
            notification.body,
            message.data,
          );
        }
      } else {
        locator<LocalNotificationService>().showNotification(
          notification.title,
          notification.body,
          message.data,
        );
      }
    }
  } catch (e, s) {
    AppLogger.error(e, stackTrace: s);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message: ${message.messageId}');
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCxycdtFmkmDfmLrf895tMKdqGGtOBvPrk',
        appId: '1:303684458367:android:1e2198ab2370acd3b8ac4a',
        messagingSenderId: '303684458367',
        projectId: 'trackon-32270',
      ),
    );
    try {
      if (message.notification != null) {
        await LaunchApp.openApp(
          androidPackageName: 'com.itsoch.trackon',
          iosUrlScheme: 'pulsesecure://',
          openStore: false,
        );
        AppLogger.info('Notification ==> title: ${message.notification?.title}  body: ${message.notification?.body}');
        final RemoteNotification notification = message.notification!;
        if (notification.body?.toLowerCase().contains('ignition on') ?? false) {
          final String devicename = notification.body!.split('ignition')[0].trim();
          final isAntiTheftEnabled = LocalSourceImpl(
            sharedPref: await SharedPreferences.getInstance(),
          ).getBool(devicename);
          AppLogger.debug('Anti-theft enabled ===> $isAntiTheftEnabled');
          if (isAntiTheftEnabled ?? true) {
            AppPermissions.checkSystemAlertPermission();
            await SystemAlertWindow.sendMessageToOverlay(
              'show_antitheft_alert:$devicename',
            );
            SystemAlertWindow.showSystemWindow(
              height: 400,
              width: 400,
              gravity: SystemWindowGravity.CENTER,
              prefMode: SystemWindowPrefMode.OVERLAY,
            );
          }
        }
      }
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
    }
  } on PlatformException catch (e) {
    AppLogger.error('Failed to handle background message.\n${e.details}');
  }
}
