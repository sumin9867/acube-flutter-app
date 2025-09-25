import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/presentation/app_shadow.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/screens/home_screen/app_scaffold.dart';
import 'package:gpspro/presentation/screens/notification_settings/cubit/notification_settings_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> with WidgetsBindingObserver {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  bool isNotificationOn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkNotificationPermission(isInitial: true);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkNotificationPermission(isInitial: false);
    }
  }

  Future<void> _checkNotificationPermission({required bool isInitial}) async {
    if (Platform.isIOS) {
      await _requestIOSPermission(isInitial);
    } else {
      final status = await Permission.notification.status;
      setState(() {
        isNotificationOn = status.isGranted;
      });
    }
  }

  Future<void> _requestIOSPermission(bool isInitial) async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    final NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      providesAppNotificationSettings: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      setState(() => isNotificationOn = true);
    } else if (settings.authorizationStatus == AuthorizationStatus.denied && !isInitial) {
      _openSettings();
    }
  }

  void _openSettings() {
    AppSettings.openAppSettings();
  }

  String _amendSentence(String input) {
    final buffer = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      if (i > 0 && input[i].toUpperCase() == input[i]) {
        buffer.write(' ');
      }
      buffer.write(input[i]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Notifications',
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BlocProvider(
              create: (_) => locator<NotificationSettingsCubit>()..init(),
              child: BlocConsumer<NotificationSettingsCubit, NotificationSettingsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    error: (msg) => AppToast.showError(context: context, message: msg),
                    orElse: () => null,
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () {
                      final screenHeight = MediaQuery.of(context).size.height;
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * 0.4,
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    idle: (notifications) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [AppShadow.normal],
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notifications.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 3.0, child: Divider()),
                          itemBuilder: (context, index) {
                            final key = notifications[index].keys.first;
                            bool tempValue = notifications[index][key]!;

                            return StatefulBuilder(
                              builder: (context, setSwitchState) {
                                return SwitchListTile.adaptive(
                                  value: tempValue,
                                  title: Text(
                                    _amendSentence(key.capitalizeFirstofEach),
                                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                                  ),
                                  onChanged: (bool newValue) {
                                    setSwitchState(() => tempValue = newValue);
                                    context
                                        .read<NotificationSettingsCubit>()
                                        .updateNotification(key, newValue, context);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
            if (!isNotificationOn)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.notifications_active, color: Colors.black54),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'Enable notifications to stay updated.',
                                    style: TextStyle(fontSize: 16, color: Colors.black87),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () => _checkNotificationPermission(isInitial: false),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: context.colorScheme.primary,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Enable'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
