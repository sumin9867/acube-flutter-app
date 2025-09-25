import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/app_config/app_config.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/cloud_messaging/firebase_cloud_messaging.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/l10n.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/screens/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:gpspro/presentation/screens/anti_theft/cubit/vehicle_anti_theft_cubit.dart';
import 'package:gpspro/presentation/screens/engine_lock/cubit/engine_lock_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/add_geofence/add_geofence_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/reverse_location_cubit/reverse_location_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/search_location/search_location_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/view_geofence/geofence_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/events/cubit/cubit/single_event_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/events/cubit/events_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/presentation/screens/share_location/cubit/share_location_cubit.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/cubit/vehicle_playback_cubit.dart';
import 'package:gpspro/router/no_connection_cubit.dart';
import 'package:gpspro/router/route_generator.dart';
import 'package:gpspro/theme/app_theme.dart';

Future<void> runAppTrackon() async {
  await locator.reset();

  configureDependencies();

  print('🚀 [MAIN] Starting app initialization...');
  print('✅ [MAIN] Dependencies configured, starting app...');

  runApp(const MyApp());

  _initializeCloudMessaging();
}

void _initializeCloudMessaging() {
  locator.get<CloudMessaging>().init().catchError((error) {
    print('⚠️ [MAIN] Cloud messaging initialization failed: $error');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter routerConfig;

  @override
  void initState() {
    super.initState();

    routerConfig = generateRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator.allReady(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const ColoredBox(color: Colors.white);
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppConfig>(create: (context) => locator.get<AppConfig>()),
            BlocProvider<AuthCubit>(create: (context) => locator.get<AuthCubit>()),
            BlocProvider<LiveMapCubit>(create: (context) => locator.get<LiveMapCubit>()),
            BlocProvider<MyDevicesCubit>(create: (context) => locator.get<MyDevicesCubit>()),
            BlocProvider<PolylineCubit>(create: (context) => locator.get<PolylineCubit>()),
            BlocProvider<EventsCubit>(create: (context) => locator.get<EventsCubit>()),
            BlocProvider<ConnectivityCubit>(create: (context) => locator.get<ConnectivityCubit>()),
            BlocProvider<SearchLocationCubit>(create: (context) => locator.get<SearchLocationCubit>()),
            BlocProvider<WebsocketCubit>(create: (context) => locator.get<WebsocketCubit>()),
            BlocProvider<AddGeofenceCubit>(create: (context) => locator.get<AddGeofenceCubit>()),
            BlocProvider(create: (context) => locator.get<ShareLocationCubit>()),
            BlocProvider(create: (context) => locator.get<EngineLockCubit>()),
            BlocProvider<ReverseLocationCubit>(create: (context) => locator.get<ReverseLocationCubit>()),
            BlocProvider<SingleEventCubit>(create: (context) => locator.get<SingleEventCubit>()),
            BlocProvider<VehicleAntiTheftCubit>(create: (context) => locator.get<VehicleAntiTheftCubit>()),
            BlocProvider<AddVehicleCubit>(create: (context) => locator.get<AddVehicleCubit>()),
            BlocProvider<VehiclePlaybackCubit>(create: (context) => locator.get<VehiclePlaybackCubit>()),
            BlocProvider<GeofenceCubit>(create: (context) => locator.get<GeofenceCubit>()),
            BlocProvider(create: (context) => locator.get<SubscriptionCubit>()),
            BlocProvider<DevicesQuickCheckCubit>(create: (context) => locator.get<DevicesQuickCheckCubit>())
          ],
          child: MaterialApp.router(
            useInheritedMediaQuery: true,
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            routerConfig: routerConfig,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: AppTheme.lightTheme,
          ),
        );
      },
    );
  }
}
