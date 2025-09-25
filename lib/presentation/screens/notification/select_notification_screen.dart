// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_button.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/notification/prefs/prefs_helper.dart';
import 'package:gpspro/presentation/screens/notification_settings/cubit/notification_settings_cubit.dart';
import 'package:gpspro/presentation/wrappers/header_footer_wrapper.dart';
import 'package:gpspro/router/route_constants.dart';
import 'package:gpspro/theme/app_colors.dart';

enum NotificationStatus { ignitionStatus, geofenceStatus, alarm }

class SelectNotificationScreen extends StatefulWidget {
  const SelectNotificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SelectNotificationScreenState();
}

class _SelectNotificationScreenState extends State<SelectNotificationScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final PrefsHelper prefsHelper = PrefsHelper();
  bool isInitial = true;
  bool isNotificationOn = false;

  Map<NotificationStatus, bool> localNotificationState = {
    NotificationStatus.ignitionStatus: false,
    NotificationStatus.geofenceStatus: false,
    NotificationStatus.alarm: false,
  };

  void _onNotificationToggle(BuildContext context, NotificationStatus type, bool isSelected) {
    setState(() {
      isInitial = false;
      localNotificationState[type] = isSelected;
    });

    // Get the Cubit instance
    final cubit = context.read<NotificationSettingsCubit>();

    // Determine which notifications to toggle
    final List<Map<String, bool>> notificationsToToggle = [];

    switch (type) {
      case NotificationStatus.ignitionStatus:
        final Map<String, bool> notif1 = {
          'ignition': localNotificationState[NotificationStatus.ignitionStatus] ?? false,
        };

        notificationsToToggle.addAll([
          notif1,
        ]);
        break;

      case NotificationStatus.geofenceStatus:
        final Map<String, bool> notif1 = {
          'geofence': localNotificationState[NotificationStatus.geofenceStatus] ?? false,
        };

        notificationsToToggle.addAll([
          notif1,
        ]);
        break;

      case NotificationStatus.alarm:
        final Map<String, bool> notif1 = {
          'alarm': localNotificationState[NotificationStatus.alarm] ?? false,
        };

        notificationsToToggle.addAll([
          notif1,
        ]);
        break;
    }

    cubit.updateNotificationAll(notificationsToToggle, context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => locator.get<NotificationSettingsCubit>()..init(),
        child: BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const SizedBox.shrink(),
              error: (errMessage) => Center(
                child: Text(errMessage),
              ),
              idle: (notifications) {
                final notificationMap = {
                  for (var item in notifications) item.keys.first: item.values.first,
                };
                localNotificationState = {
                  NotificationStatus.alarm: notificationMap['alarm'] ?? false,
                  NotificationStatus.geofenceStatus: (notificationMap['geofence'] ?? false),
                  NotificationStatus.ignitionStatus: (notificationMap['ignition'] ?? false),
                };
                return Scaffold(
                  body: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: HeaderFooterWrapper(
                            footer: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AppButton(
                                  label: context.locale.done,
                                  onPressed: () async {
                                    // List<Future<void>> updateFutures = [];

                                    // localNotificationState
                                    //     .forEach((type, isSelected) {
                                    //   final notificationsToToggle =
                                    //       <NotificationType>[];

                                    //   switch (type) {
                                    //     case NotificationStatus.ignitionStatus:
                                    //       notificationsToToggle.addAll([
                                    //         NotificationType.ignitionOn,
                                    //         NotificationType.ignitionOff,
                                    //       ]);
                                    //       break;

                                    //     case NotificationStatus.geofenceStatus:
                                    //       notificationsToToggle.addAll([
                                    //         NotificationType.geofenceEnter,
                                    //         NotificationType.geofenceExit,
                                    //       ]);
                                    //       break;

                                    //     case NotificationStatus.alarm:
                                    //       notificationsToToggle
                                    //           .add(NotificationType.alarm);
                                    //       break;
                                    //   }

                                    //   // Collect futures instead of calling updateNotification directly
                                    //   for (var notification
                                    //       in notificationsToToggle) {
                                    //     updateFutures.add(cubit.updateNotification(
                                    //         notification, isSelected));
                                    //   }
                                    // });

                                    // // Ensure all updateNotification calls complete before proceeding
                                    // await Future.wait(updateFutures);

                                    // // Delay if needed
                                    // await Future.delayed(Duration(seconds: 3));

                                    // Save to shared preferences
                                    await prefsHelper.setHasSeenNotificationScreen(true);

                                    // Redirect to home
                                    context.go(RouteConstant.home);
                                  },
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 60.0, bottom: 40),
                                  child: _NotificationHeaderView(),
                                ),
                                _NotificationSelectionCard(
                                  title: 'Ignition Status',
                                  description:
                                      'Receive alerts/notifications when your vehicle’s ignition is turned on or off.',
                                  isSelected: localNotificationState[NotificationStatus.ignitionStatus]!,
                                  onChanged: (value) {
                                    _onNotificationToggle(context, NotificationStatus.ignitionStatus, value ?? false);
                                  },
                                ),
                                const SizedBox(height: 12),
                                _NotificationSelectionCard(
                                  title: 'Geofence Status',
                                  description:
                                      'Receive alerts/notifications when your vehicle enters or exits predefined geo fence areas.',
                                  isSelected: localNotificationState[NotificationStatus.geofenceStatus]!,
                                  onChanged: (value) {
                                    _onNotificationToggle(context, NotificationStatus.geofenceStatus, value ?? false);
                                  },
                                ),
                                const SizedBox(height: 12),
                                _NotificationSelectionCard(
                                  title: 'Alarm',
                                  description:
                                      'Receive alerts/notifications for features like motion sensor, device unplug, etc.',
                                  isSelected: localNotificationState[NotificationStatus.alarm]!,
                                  onChanged: (value) {
                                    _onNotificationToggle(context, NotificationStatus.alarm, value ?? false);
                                  },
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ));
  }
}

class _NotificationHeaderView extends StatelessWidget {
  const _NotificationHeaderView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // Add slight transparency
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.secondaryFixedDim,
          width: .2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Assets.icons.bellNoticeAlert.svg(),
            Assets.icons.bellNoticeAlert.image(
              height: 80,
            ),
            AppText(
              'Notifications',
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppText(
                'Please choose and enable the notifications you would like to receive on your phone.',
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

class _NotificationSelectionCard extends StatelessWidget {
  const _NotificationSelectionCard({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onChanged,
  });

  final String title;
  final String description;
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.8), // Background color with transparency
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(
            color: context.colorScheme.secondaryFixedDim,
            width: .2,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1), // Soft shadow
          //     spreadRadius: 0,
          //     blurRadius: 0,
          //     offset: const Offset(0, 1), // Shadow position
          //   ),
          // ],
        ),
        child: Card(
          elevation: 0,
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.key),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: context.textTheme.titleLarge,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              description,
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Transform.scale(
                        scale: 2,
                        child: Checkbox(
                          value: isSelected,
                          onChanged: onChanged,
                          fillColor: isSelected
                              ? WidgetStateProperty.all(context.colorScheme.primary)
                              : WidgetStateProperty.all(AppColors.neutral3.withOpacity(0.5)),
                          shape: CircleBorder(
                            side: isSelected
                                ? BorderSide.none
                                : const BorderSide(
                                    width: 0.1,
                                    color: AppColors.neutral3,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// class GradientBoxBorder extends BoxBorder {
//   const GradientBoxBorder({required this.gradient, this.width = 1.0});

//   final Gradient gradient;

//   final double width;

//   @override
//   BorderSide get bottom => BorderSide.none;

//   @override
//   BorderSide get top => BorderSide.none;

//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

//   @override
//   bool get isUniform => true;

//   @override
//   void paint(
//     Canvas canvas,
//     Rect rect, {
//     TextDirection? textDirection,
//     BoxShape shape = BoxShape.rectangle,
//     BorderRadius? borderRadius,
//   }) {
//     switch (shape) {
//       case BoxShape.circle:
//         assert(
//           borderRadius == null,
//           'A borderRadius can only be given for rectangular boxes.',
//         );
//         _paintCircle(canvas, rect);
//         break;
//       case BoxShape.rectangle:
//         if (borderRadius != null) {
//           _paintRRect(canvas, rect, borderRadius);
//           return;
//         }
//         _paintRect(canvas, rect);
//         break;
//     }
//   }

//   void _paintRect(Canvas canvas, Rect rect) {
//     canvas.drawRect(rect.deflate(width / 2), _getPaint(rect));
//   }

//   void _paintRRect(Canvas canvas, Rect rect, BorderRadius borderRadius) {
//     final rrect = borderRadius.toRRect(rect).deflate(width / 2);
//     canvas.drawRRect(rrect, _getPaint(rect));
//   }

//   void _paintCircle(Canvas canvas, Rect rect) {
//     final paint = _getPaint(rect);
//     final radius = (rect.shortestSide - width) / 2.0;
//     canvas.drawCircle(rect.center, radius, paint);
//   }

//   @override
//   ShapeBorder scale(double t) {
//     return this;
//   }

//   Paint _getPaint(Rect rect) {
//     return Paint()
//       ..strokeWidth = width
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke;
//   }
// }
