// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/domain/models/user_session.dart';
import 'package:gpspro/presentation/repository/implementation/push_notification_repo.dart';

class NotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize(User user, UserSession session) async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );

    // Initialize local notifications
    await _initLocalNotifications();

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });

    // Handle when the app is opened from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print('App opened from terminated state via notification');
      }
    });

    // Handle app open from background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('App opened from background via notification');
    });

    // Retrieve and send the FCM token
    await saveFcmTokenToServer(user, session);
  }

  Future<void> _initLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@drawable/notification');
    const iosSettings = DarwinInitializationSettings(
      requestSoundPermission: false,
      defaultPresentSound: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        print('Notification tapped with payload: ${response.payload}');
      },
    );

    // Create notification channel for Android
    const androidChannel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is for important notifications.',
      importance: Importance.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notif_sound'),
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
  }

  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print('Handling background message: ${message.notification?.title}');
    print(message.notification?.body);
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notif_sound'),
    );

    const iosDetails = DarwinNotificationDetails(
      presentSound: true,
      sound: 'default',
    );

    const platformDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    if (message.notification != null && message.notification!.title != null && message.notification!.body != null) {
      await _localNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformDetails,
      );
    }
  }

  // Retrieves the FCM token and sends it to your server
  Future<void> saveFcmTokenToServer(User user, UserSession session) async {
    try {
      final pushNotfication = PushNotificationRepo();
      final fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken == null) {
        log('Failed to retrieve FCM token');
        return;
      }

      final isSaved = await pushNotfication.saveFcmToken(user, session, fcmToken);

      if (!isSaved) {
        throw Exception('FCM Token could not be saved');
      }

      log('TOKEN SAVED');
    } catch (e) {
      log('Error saving FCM token: $e');
    }
  }

// Remove FCM token
  Future<void> removeFcmTokenFromServer(User user, UserSession session) async {
    try {
      final pushNotfication = PushNotificationRepo();
      final fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken == null) {
        log('Failed to retrieve FCM token');
        return;
      }

      final isSaved = await pushNotfication.removeFcmToken(user, session, fcmToken);

      if (!isSaved) {
        throw Exception('FCM Token could not be removed');
      }

      log('TOKEN REMOVED');
    } catch (e) {
      log('Error removing FCM token: $e');
    }
  }
}
