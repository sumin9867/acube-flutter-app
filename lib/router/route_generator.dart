import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/screens/anti_theft/vehicle_anti_theft_page.dart';
import 'package:gpspro/presentation/screens/app_start_screen/splash_screen/splash_screen.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:gpspro/presentation/screens/auth/forgot_password/password_reset_confirm.dart';
import 'package:gpspro/presentation/screens/auth/sign_in/signin_screen.dart';
import 'package:gpspro/presentation/screens/auth/sign_up/signup_screen.dart';
import 'package:gpspro/presentation/screens/change_password/change_password_screen.dart';
import 'package:gpspro/presentation/screens/engine_lock/vehicle_engine_lock_page.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/add_geofence_page.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/geofence_list/geofence_page.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/view_geofence/view_geofence_page.dart';
import 'package:gpspro/presentation/screens/home_screen/customer_services/customer_care_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/customer_services/customer_service_landing_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/vehicle_dashboard_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/devices_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/info/vehicle_info_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/vehicle_subscription_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/error_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/events/events_map.dart';
import 'package:gpspro/presentation/screens/home_screen/events/events_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/home_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/live_map_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/pages/vehicle_map/vehicle_details_page.dart';
import 'package:gpspro/presentation/screens/home_screen/preferences/preference_screen.dart';
import 'package:gpspro/presentation/screens/notification/select_notification_screen.dart';
import 'package:gpspro/presentation/screens/notification_settings/notification_settings_screen.dart';
import 'package:gpspro/presentation/screens/onboarding_screen.dart';
import 'package:gpspro/presentation/screens/share_location/share_dialog.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/vehicle_playback_screen.dart';
import 'package:gpspro/presentation/screens/vehicle_settings/vehicle_settings_page.dart';
import 'package:gpspro/presentation/screens/web_view/web_view_screen.dart';
import 'package:gpspro/presentation/transition/page_transition.dart';
import 'package:gpspro/router/router.dart';
import 'package:newrelic_mobile/newrelic_navigation_observer.dart';

GoRouter generateRoutes() {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: locator.get<AppRouter>().navigationKey,
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(locator<AuthCubit>().stream),
    observers: [
      NewRelicNavigationObserver(),
    ],
    errorPageBuilder: _errorRoute,
    // redirect: (context, state) async {
    //   final config = locator<AppConfig>().configModel;
    //   final authCubit = locator<AuthCubit>();

    //   try {
    //     if (config.isFirstRun) {
    //       return RouteConstant.onBoarding;
    //     }

    //     if (authCubit.isAuthenticated) {
    //       return RouteConstant.home;
    //     }

    //     return RouteConstant.signin;
    //   } catch (e) {
    //     return RouteConstant.signin;
    //   }
    // },
    routes: [
      _rootRoute(),
      GoRoute(
        path: RouteConstant.onBoarding,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),
      _signInScreenRoute(),
      _signupScreenRoute(),
      _forgotPasswordScreenRoute(),
      _changePasswordScreenRoute(),
      _notificationSettingscreenRoute(),
      _selectNotificationScreenRoute(),
      _homeScreenRoute(),
      _vehicleInfoScreen(),
      _vehicleDetailsRoute(),
      _vehicleDashboardRoute(),
      _vehiclePlaybackRoute(),
      // _vehicleMapTripRoute(),

      // _addvehicleRoute(),
      _webViewScreenRoute(),
      _geofenceRoute(),
      _subscriptionRoute(),
      // _customerCareRoute(),
      _eventMapRoute(),
      _shareLocationRoute(),
      _vehicleInfoScreen(),
      GoRoute(
        path: RouteConstant.viewGeofence(),
        pageBuilder: (context, state) {
          return PageTransition(
            child: ViewGeofencePage(
              geofenceModel: (state.extra as ViewGeofenceRouteParams).geofenceModel,
            ),
          );
        },
      ),
      GoRoute(
        path: RouteConstant.customerCare(),
        pageBuilder: (context, state) {
          return PageTransition(
            child: CustomerCareScreen(
              isLoggedIn: (state.extra as CustomerCareParams).isLoggedIn,
            ),
          );
        },
      ),
      GoRoute(
        path: RouteConstant.customerServiceLandingScreen,
        pageBuilder: (context, state) {
          return PageTransition(
            child: const CustomerServiceLandingScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteConstant.passwordResetConfirmation,
        pageBuilder: (context, state) {
          return PageTransition(
            child: const PasswordResetConfirm(),
          );
        },
      )
    ],
  );
}

GoRoute _webViewScreenRoute() {
  return GoRoute(
    path: RouteConstant.webView,
    pageBuilder: (context, state) {
      final params = (state.extra as WebViewRouteParams);
      return PageTransition(
        type: PageTransitionType.rightToLeft,
        child: WebViewScreen(
          params: params,
        ),
      );
    },
  );
}

Page _errorRoute(BuildContext context, GoRouterState state) {
  return PageTransition(
    type: PageTransitionType.fade,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR ROUTING'),
      ),
    ),
  );
}

GoRoute _rootRoute() {
  return GoRoute(
    path: RouteConstant.splash,
    pageBuilder: (context, state) {
      return PageTransition(
        type: PageTransitionType.fade,
        child: const SplashScreen(),
      );
    },
  );
}

GoRoute _signInScreenRoute() {
  return GoRoute(
    path: RouteConstant.signin,
    pageBuilder: (context, state) {
      return PageTransition(
        type: PageTransitionType.fade,
        child: const SigninScreen(),
      );
    },
  );
}

GoRoute _signupScreenRoute() {
  return GoRoute(
    path: RouteConstant.signup,
    pageBuilder: (context, state) {
      return PageTransition(
        type: PageTransitionType.fade,
        child: const SignupScreen(),
      );
    },
  );
}

GoRoute _forgotPasswordScreenRoute() {
  return GoRoute(
    path: RouteConstant.forgotPassword,
    pageBuilder: (context, state) {
      return PageTransition(
        type: PageTransitionType.fade,
        child: const ForgotPasswordScreen(),
      );
    },
  );
}

GoRoute _changePasswordScreenRoute() {
  return GoRoute(
    path: RouteConstant.changePassword,
    pageBuilder: (context, state) {
      return PageTransition(
        type: PageTransitionType.rightToLeft,
        child: const ChangePasswordScreen(),
      );
    },
  );
}

GoRoute _notificationSettingscreenRoute() {
  return GoRoute(
    path: RouteConstant.notificationSettings,
    pageBuilder: (context, state) {
      return PageTransition(
        type: PageTransitionType.rightToLeft,
        child: const NotificationSettingsScreen(),
      );
    },
  );
}

GoRoute _selectNotificationScreenRoute() {
  return GoRoute(
    path: RouteConstant.selectNotification,
    pageBuilder: (context, state) {
      return PageTransition(
        type: PageTransitionType.fade,
        child: const SelectNotificationScreen(),
      );
    },
  );
}

GoRoute _vehicleInfoScreen() {
  return GoRoute(
    path: RouteConstant.vehicleInfo, // 'info/:deviceId'
    pageBuilder: (context, state) {
      final params = state.extra as VehicleInfoRouteParams;
      return PageTransition(
        type: PageTransitionType.fade,
        child: VehicleInfoScreen(model: params.device),
      );
    },
  );
}

StatefulShellRoute _homeScreenRoute() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return HomeScreen(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        initialLocation: RouteConstant.home,
        routes: <RouteBase>[
          GoRoute(
            path: RouteConstant.home,
            builder: (BuildContext context, GoRouterState state) {
              return const LiveMapScreen();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: <RouteBase>[
          GoRoute(
            path: RouteConstant.devices,
            builder: (BuildContext context, GoRouterState state) {
              return const DevicesScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                path: RouteConstant.vehicleInfo,
                pageBuilder: (context, state) {
                  return PageTransition(
                    child: VehicleInfoScreen(
                      model: (state.extra as VehicleInfoRouteParams).device,
                    ),
                  );
                },
                redirect: (context, state) {
                  final VehicleInfoRouteParams? params = state.extra as VehicleInfoRouteParams?;
                  if (params == null) {
                    return RouteConstant.devices;
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
      StatefulShellBranch(
        routes: <RouteBase>[
          GoRoute(
            path: RouteConstant.events,
            builder: (BuildContext context, GoRouterState state) {
              return const EventsScreen();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: <RouteBase>[
          GoRoute(
            path: RouteConstant.settings,
            builder: (BuildContext context, GoRouterState state) {
              return const PreferenceScreen();
            },
          ),
        ],
      ),
    ],
  );
}

GoRoute _subscriptionRoute() {
  return GoRoute(
    // parentNavigatorKey: locator.get<AppRouter>().navigationKey,
    path: RouteConstant.subscription,
    pageBuilder: (context, state) {
      return PageTransition(
        child: const VehicleSubscriptionScreen(),
      );
    },
  );
}
// GoRoute _customerCareRoute() {
//   return GoRoute(
//     // parentNavigatorKey: locator.get<AppRouter>().navigationKey,
//     path: RouteConstant.customerCare,
//     pageBuilder: (context, state) {
//         final User params =
//                       state.extra as User;
//       return PageTransition(
//         child:  CustomerCareScreen(user: params,),
//       );
//     },
//   );
// }

GoRoute _vehicleDetailsRoute() {
  return GoRoute(
    path: RouteConstant.vehicleDetails(),
    pageBuilder: (context, state) {
      final extra = state.extra;

      late final String vehicleId;

      if (extra is VehicleDetailsRouteParams) {
        vehicleId = extra.device.id.toString();
      } else if (extra is Map<String, dynamic>) {
        try {
          final params = VehicleDetailsRouteParams.fromJson(extra);
          vehicleId = params.device.id.toString();
        } catch (e) {
          return PageTransition(
            child: ErrorScreen(
              message: 'Invalid route data',
              title: '',
              onRetry: () {},
            ),
          );
        }
      } else {
        return PageTransition(
          child: ErrorScreen(
            message: 'Missing route data',
            title: '',
            onRetry: () {},
          ),
        );
      }

      return PageTransition(
        child: VehicleDetailsPage(vehicleId: vehicleId),
      );
    },
    routes: [
      GoRoute(
        path: 'engine_lock',
        pageBuilder: (context, state) {
          final params = (state.extra as VehicleEngineLockRouteParams);
          return PageTransition(
            child: VehicleEngineLockPage(
              vehicle: params.device,
            ),
          );
        },
      ),
      GoRoute(
        path: 'anti_theft',
        pageBuilder: (context, state) {
          final params = (state.extra as VehicleAntiTheftRouteParams);
          return PageTransition(
            child: VehicleAntiTheftPage(
              vehicle: params.device,
            ),
          );
        },
      ),
      GoRoute(
        path: 'settings',
        pageBuilder: (context, state) {
          final params = (state.extra as VehicleSettingsRouteParams);
          return PageTransition(
            child: VehicleSettingsPage(
              vehicle: params.device,
            ),
          );
        },
      ),
    ],
  );
}

// GoRoute _vehicleMapTripRoute() {
//   return GoRoute(
//     path: RouteConstant.vehicleMapTripDetails,
//     pageBuilder: (context, state) {
//       return PageTransition(
//         child: VehicleMapTripPage(
//           params: (state.extra as VehicleMapTripRouteParams),
//         ),
//       );
//     },
//     redirect: (context, state) {
//       final VehicleMapTripRouteParams? params = state.extra as VehicleMapTripRouteParams?;
//       if (params == null) {
//         return RouteConstant.devices;
//       }
//       return null;
//     },
//   );
// }

// GoRoute _vehicleMapStopRoute() {
//   return GoRoute(
//     path: RouteConstant.vehicleMapStopDetails,
//     pageBuilder: (context, state) {
//       return PageTransition(
//         child: VehicleMapStopPage(
//           params: (state.extra as VehicleMapStopRouteParams),
//         ),
//       );
//     },
//     redirect: (context, state) {
//       final VehicleMapStopRouteParams? params = state.extra as VehicleMapStopRouteParams?;
//       if (params == null) {
//         return RouteConstant.devices;
//       }
//       return null;
//     },
//   );
// }

GoRoute _vehiclePlaybackRoute() {
  return GoRoute(
    path: RouteConstant.vehiclePlayback,
    pageBuilder: (context, state) {
      final extra = state.extra;

      late final String vehicleId;

      if (extra is VehiclePlaybackRouteParams) {
        vehicleId = extra.vehicleId.toString();
      } else if (extra is Map<String, dynamic>) {
        vehicleId = extra['vehicleId'].toString();
      } else {
        return PageTransition(
            child: ErrorScreen(
          message: 'Invalid route data',
          title: '',
          onRetry: () {},
        ));
      }

      return PageTransition(
        child: VehiclePlaybackScreen(vehicleId: vehicleId),
      );
    },
    redirect: (context, state) {
      log('Redirecting from VehiclePlaybackRoute ${state.extra}');

      final extra = state.extra;

      if (extra is VehiclePlaybackRouteParams) {
        return null;
      }

      if (extra is Map<String, dynamic>) {
        try {
          final params = VehiclePlaybackRouteParams.fromJson(extra);
          return null;
        } catch (e) {
          log('❌ Redirect deserialization failed: $e');
          return RouteConstant.devices;
        }
      }

      return RouteConstant.devices;
    },
  );
}

GoRoute _eventMapRoute() {
  return GoRoute(
    path: RouteConstant.eventMap,
    pageBuilder: (context, state) {
      return PageTransition(
        child: EventsMap(vehicleEvent: (state.extra as EventMapRouteParams).vehicleEvent),
      );
    },
    redirect: (context, state) {
      final EventMapRouteParams? params = state.extra as EventMapRouteParams?;
      if (params == null) {
        return RouteConstant.devices;
      }
      return null;
    },
  );
}

GoRoute _shareLocationRoute() {
  return GoRoute(
    path: RouteConstant.shareLocation,
    pageBuilder: (context, state) {
      return PageTransition(
        child: ShareDialog(
          deviceId: (state.extra as ShareLocationRouteParams).deviceId,
          vehicle: (state.extra as ShareLocationRouteParams).vehicle,
        ),
      );
    },
    redirect: (context, state) {
      final ShareLocationRouteParams? params = state.extra as ShareLocationRouteParams?;
      if (params == null) {
        return RouteConstant.devices;
      }
      return null;
    },
  );
}

GoRoute _vehicleDashboardRoute() {
  return GoRoute(
    path: RouteConstant.vehicleDashboard,
    pageBuilder: (context, state) {
      final extra = state.extra;

      late final Device device;

      if (extra is VehicleDashboardRouteParams) {
        device = extra.device;
      } else if (extra is Map<String, dynamic>) {
        try {
          final params = VehicleDashboardRouteParams.fromJson(extra);
          device = params.device;
        } catch (e) {
          return PageTransition(
            child: ErrorScreen(
              message: 'Invalid route data',
              title: '',
              onRetry: () {},
            ),
          );
        }
      } else {
        return PageTransition(
          child: ErrorScreen(
            message: 'Missing route data',
            title: '',
            onRetry: () {},
          ),
        );
      }

      return PageTransition(
        child: VehicleDashboardScreen(model: device),
      );
    },
    redirect: (context, state) {
      final extra = state.extra;

      if (extra is VehicleDashboardRouteParams) return null;

      if (extra is Map<String, dynamic>) {
        try {
          final params = VehicleDashboardRouteParams.fromJson(extra);
          return null;
        } catch (_) {
          return RouteConstant.devices;
        }
      }

      return RouteConstant.devices;
    },
  );
}

GoRoute _geofenceRoute() {
  return GoRoute(
    path: RouteConstant.geofence,
    pageBuilder: (context, state) {
      final extra = state.extra;

      late final String vehicleId;

      if (extra is GeofenceRouteParams) {
        vehicleId = extra.vehicleId;
      } else if (extra is Map<String, dynamic>) {
        try {
          final params = GeofenceRouteParams.fromJson(extra);
          vehicleId = params.vehicleId;
        } catch (e) {
          return PageTransition(
            child: ErrorScreen(
              message: 'Invalid route data',
              title: '',
              onRetry: () {},
            ),
          );
        }
      } else {
        return PageTransition(
          child: ErrorScreen(
            message: 'Missing route data',
            title: '',
            onRetry: () {},
          ),
        );
      }

      return PageTransition(child: GeofencePage(vehicleId: vehicleId));
    },
    redirect: (context, state) {
      final extra = state.extra;

      if (extra is GeofenceRouteParams) return null;

      if (extra is Map<String, dynamic>) {
        try {
          final params = GeofenceRouteParams.fromJson(extra);
          return params.vehicleId.isEmpty ? RouteConstant.devices : null;
        } catch (_) {
          return RouteConstant.devices;
        }
      }

      return RouteConstant.devices;
    },
    routes: [
      GoRoute(
        path: RouteConstant.add,
        pageBuilder: (context, state) {
          final extra = state.extra;

          late final String vehicleId;

          if (extra is GeofenceRouteParams) {
            vehicleId = extra.vehicleId;
          } else if (extra is Map<String, dynamic>) {
            try {
              final params = GeofenceRouteParams.fromJson(extra);
              vehicleId = params.vehicleId;
            } catch (e) {
              return PageTransition(
                child: ErrorScreen(
                  message: 'Invalid route data',
                  title: '',
                  onRetry: () {},
                ),
              );
            }
          } else {
            return PageTransition(
              child: ErrorScreen(
                message: 'Missing route data',
                title: '',
                onRetry: () {},
              ),
            );
          }

          return PageTransition(child: AddGeofencePage(vehicleId: vehicleId));
        },
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
