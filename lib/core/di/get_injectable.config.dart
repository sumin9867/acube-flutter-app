// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:gpspro/app_config/app_config.dart' as _i608;
import 'package:gpspro/auth/cubit/auth_cubit.dart' as _i497;
import 'package:gpspro/core/cloud_messaging/firebase_cloud_messaging.dart' as _i957;
import 'package:gpspro/core/cloud_messaging/local_notification_service.dart' as _i882;
import 'package:gpspro/core/di/modules.dart' as _i138;
import 'package:gpspro/data/auth_storage.dart' as _i351;
import 'package:gpspro/data/sources/database_source.dart' as _i632;
import 'package:gpspro/data/sources/local_source.dart' as _i415;
import 'package:gpspro/data/sources/remote_source.dart' as _i104;
import 'package:gpspro/data/sources/sources_impl/database_source_imp.dart' as _i282;
import 'package:gpspro/data/sources/sources_impl/local_source_impl.dart' as _i353;
import 'package:gpspro/data/sources/sources_impl/remote_source_impl.dart' as _i976;
import 'package:gpspro/database/position_database.dart' as _i61;
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart' as _i6;
import 'package:gpspro/presentation/repository/i_auth_repo.dart' as _i656;
import 'package:gpspro/presentation/repository/i_device_repo.dart' as _i1061;
import 'package:gpspro/presentation/repository/i_event_repo.dart' as _i582;
import 'package:gpspro/presentation/repository/i_notification_repo.dart' as _i49;
import 'package:gpspro/presentation/repository/i_search_location_repo.dart' as _i46;
import 'package:gpspro/presentation/repository/i_share_repo.dart' as _i882;
import 'package:gpspro/presentation/repository/i_share_repo_imp.dart' as _i934;
import 'package:gpspro/presentation/repository/i_websocket_repo.dart' as _i361;
import 'package:gpspro/presentation/repository/implementation/auth_repo.dart' as _i401;
import 'package:gpspro/presentation/repository/implementation/device_repo.dart' as _i1025;
import 'package:gpspro/presentation/repository/implementation/event_repo.dart' as _i959;
import 'package:gpspro/presentation/repository/implementation/notification_repo.dart' as _i1041;
import 'package:gpspro/presentation/repository/implementation/search_repo_impl.dart' as _i947;
import 'package:gpspro/presentation/repository/implementation/websocket_repo.dart' as _i883;
import 'package:gpspro/presentation/screens/add_vehicle/cubit/add_vehicle_cubit.dart' as _i548;
import 'package:gpspro/presentation/screens/anti_theft/cubit/vehicle_anti_theft_cubit.dart' as _i662;
import 'package:gpspro/presentation/screens/auth/forgot_password/cubit/forgot_password_cubit.dart' as _i144;
import 'package:gpspro/presentation/screens/auth/sign_in/cubit/signin_cubit.dart' as _i975;
import 'package:gpspro/presentation/screens/auth/sign_up/cubit/signup_cubit.dart' as _i827;
import 'package:gpspro/presentation/screens/change_password/cubit/change_password_cubit.dart' as _i1071;
import 'package:gpspro/presentation/screens/engine_lock/cubit/engine_lock_cubit.dart' as _i213;
import 'package:gpspro/presentation/screens/geofence/application/add_geofence/add_geofence_cubit.dart' as _i589;
import 'package:gpspro/presentation/screens/geofence/application/reverse_location_cubit/reverse_location_cubit.dart'
    as _i817;
import 'package:gpspro/presentation/screens/geofence/application/search_location/search_location_cubit.dart' as _i587;
import 'package:gpspro/presentation/screens/geofence/application/view_geofence/geofence_cubit.dart' as _i941;
import 'package:gpspro/presentation/screens/geofence/infrastructure/geofence_repo.dart' as _i695;
import 'package:gpspro/presentation/screens/geofence/infrastructure/i_geofence_repo.dart' as _i927;
import 'package:gpspro/presentation/screens/home_screen/cubit/home_screen_cubit.dart' as _i712;
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/filter/vehicle_filter_cubit.dart' as _i663;
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart' as _i305;
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/search/vehicle_search_cubit.dart' as _i176;
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/cubit/vehicle_dashboard_cubit.dart'
    as _i953;
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/tabs/telematics/cubit/vehicle_telematics_cubit.dart'
    as _i738;
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/payment_history_detail_cubit.dart'
    as _i405;
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/cubit/subscription_cubit.dart' as _i109;
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/repository/i_payment_repo.dart' as _i702;
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/repository/payment_repo.dart' as _i52;
import 'package:gpspro/presentation/screens/home_screen/events/cubit/cubit/single_event_cubit.dart' as _i471;
import 'package:gpspro/presentation/screens/home_screen/events/cubit/events_cubit.dart' as _i559;
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart' as _i716;
import 'package:gpspro/presentation/screens/notification_settings/cubit/notification_settings_cubit.dart' as _i941;
import 'package:gpspro/presentation/screens/share_location/cubit/share_location_cubit.dart' as _i381;
import 'package:gpspro/presentation/screens/vehicle_playback/cubit/vehicle_playback_cubit.dart' as _i516;
import 'package:gpspro/router/app_router.dart' as _i279;
import 'package:gpspro/router/no_connection_cubit.dart' as _i1054;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt servicesLocator({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diModules = _$DiModules();
    gh.factory<_i176.VehicleSearchCubit>(() => _i176.VehicleSearchCubit());
    gh.singleton<_i361.Dio>(() => diModules.dio);
    gh.singleton<_i558.FlutterSecureStorage>(() => diModules.flutterSecureStorage);
    gh.singletonAsync<_i460.SharedPreferences>(() => diModules.sharedPreferences);
    gh.singleton<_i895.Connectivity>(() => diModules.connectivity);
    gh.singleton<_i279.AppRouter>(() => _i279.AppRouter());
    gh.lazySingleton<_i957.CloudMessaging>(() => _i957.CloudMessaging());
    gh.lazySingleton<_i882.LocalNotificationService>(() => _i882.LocalNotificationService());
    gh.lazySingleton<_i882.IShareRepo>(() => diModules.shareRepo);
    gh.lazySingleton<_i305.PolylineCubit>(() => _i305.PolylineCubit());
    gh.lazySingleton<_i632.DatabaseSource>(() => _i282.DatabaseSourceImp());
    gh.lazySingleton<_i934.ShareRepo>(() => _i934.ShareRepo(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i702.IPaymentRepo>(() => _i52.PaymentRepo(dio: gh<_i361.Dio>()));
    gh.lazySingletonAsync<_i415.LocalSource>(
        () async => _i353.LocalSourceImpl(sharedPref: await getAsync<_i460.SharedPreferences>()));
    gh.factory<_i381.ShareLocationCubit>(() => _i381.ShareLocationCubit(gh<_i882.IShareRepo>()));
    gh.lazySingleton<_i351.AuthStorage>(() => _i351.AuthStorage(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i1054.ConnectivityCubit>(() => _i1054.ConnectivityCubit(gh<_i895.Connectivity>()));
    gh.singleton<_i61.PositionDatabase>(() => _i61.PositionDatabase(gh<_i632.DatabaseSource>()));
    gh.factory<_i405.PaymentHistoryDetailCubit>(() => _i405.PaymentHistoryDetailCubit(gh<_i702.IPaymentRepo>()));
    gh.factory<_i109.SubscriptionCubit>(() => _i109.SubscriptionCubit(gh<_i702.IPaymentRepo>()));
    gh.lazySingleton<_i104.RemoteSource>(() => _i976.RemoteSourceImpl(
          dio: gh<_i361.Dio>(),
          authStorage: gh<_i351.AuthStorage>(),
          connectivity: gh<_i895.Connectivity>(),
        ));
    gh.lazySingleton<_i49.NotificationRepo>(() => _i1041.NotificationRepoImp(remoteSource: gh<_i104.RemoteSource>()));
    gh.factory<_i941.NotificationSettingsCubit>(() => _i941.NotificationSettingsCubit(gh<_i49.NotificationRepo>()));
    gh.lazySingleton<_i46.SearchLocationRepo>(() => _i947.SearchRepoImpl(remoteSource: gh<_i104.RemoteSource>()));
    gh.factory<_i817.ReverseLocationCubit>(() => _i817.ReverseLocationCubit(gh<_i46.SearchLocationRepo>()));
    gh.factory<_i587.SearchLocationCubit>(() => _i587.SearchLocationCubit(gh<_i46.SearchLocationRepo>()));
    gh.lazySingleton<_i1061.DeviceRepo>(() => _i1025.DeviceRepoImp(
          remoteSource: gh<_i104.RemoteSource>(),
          positionDB: gh<_i61.PositionDatabase>(),
        ));
    gh.factory<_i738.VehicleTelematicsCubit>(() => _i738.VehicleTelematicsCubit(deviceRepo: gh<_i1061.DeviceRepo>()));
    gh.lazySingleton<_i305.MyDevicesCubit>(() => _i305.MyDevicesCubit(deviceRepo: gh<_i1061.DeviceRepo>()));
    gh.lazySingleton<_i927.GeofenceRepo>(() => _i695.GeofenceRepoImp(remoteSource: gh<_i104.RemoteSource>()));
    gh.lazySingleton<_i656.AuthRepo>(() => _i401.AuthRepoImp(remoteSource: gh<_i104.RemoteSource>()));
    gh.lazySingleton<_i582.EventRepo>(() => _i959.EventRepoImp(remoteSource: gh<_i104.RemoteSource>()));
    gh.lazySingleton<_i361.WebSocketRepo>(() => _i883.WebSocketRepoImp(remoteSource: gh<_i104.RemoteSource>()));
    gh.factory<_i548.AddVehicleCubit>(() => _i548.AddVehicleCubit(gh<_i1061.DeviceRepo>()));
    gh.factory<_i663.VehicleFilterCubit>(() => _i663.VehicleFilterCubit(gh<_i305.MyDevicesCubit>()));
    gh.lazySingleton<_i716.LiveMapCubit>(() => _i716.LiveMapCubit(gh<_i305.MyDevicesCubit>()));
    gh.lazySingleton<_i559.EventsCubit>(() => _i559.EventsCubit(
          gh<_i582.EventRepo>(),
          gh<_i305.MyDevicesCubit>(),
        ));
    gh.singleton<_i497.AuthCubit>(() => _i497.AuthCubit(
          authStorage: gh<_i351.AuthStorage>(),
          authRepo: gh<_i656.AuthRepo>(),
          appRouter: gh<_i279.AppRouter>(),
        ));
    gh.factory<_i662.VehicleAntiTheftCubit>(() => _i662.VehicleAntiTheftCubit(gh<_i1061.DeviceRepo>()));
    gh.factory<_i213.EngineLockCubit>(() => _i213.EngineLockCubit(gh<_i1061.DeviceRepo>()));
    gh.singletonAsync<_i608.AppConfig>(() async => _i608.AppConfig(
          authStorage: gh<_i351.AuthStorage>(),
          authCubit: gh<_i497.AuthCubit>(),
          localSource: await getAsync<_i415.LocalSource>(),
        ));
    gh.factory<_i712.DevicesQuickCheckCubit>(() => _i712.DevicesQuickCheckCubit(gh<_i1061.DeviceRepo>()));
    gh.factory<_i589.AddGeofenceCubit>(() => _i589.AddGeofenceCubit(gh<_i927.GeofenceRepo>()));
    gh.factory<_i941.GeofenceCubit>(() => _i941.GeofenceCubit(gh<_i927.GeofenceRepo>()));
    gh.factory<_i1071.ChangePasswordCubit>(() => _i1071.ChangePasswordCubit(gh<_i656.AuthRepo>()));
    gh.factory<_i953.VehicleDashboardCubit>(() => _i953.VehicleDashboardCubit(
          deviceRepo: gh<_i1061.DeviceRepo>(),
          eventRepo: gh<_i582.EventRepo>(),
        ));
    gh.lazySingleton<_i471.SingleEventCubit>(() => _i471.SingleEventCubit(gh<_i582.EventRepo>()));
    gh.factory<_i516.VehiclePlaybackCubit>(() => _i516.VehiclePlaybackCubit(
          gh<_i1061.DeviceRepo>(),
          gh<_i305.MyDevicesCubit>(),
        ));
    gh.factory<_i975.SigninCubit>(() => _i975.SigninCubit(
          gh<_i497.AuthCubit>(),
          gh<_i305.MyDevicesCubit>(),
        ));
    gh.factory<_i144.ForgotPasswordCubit>(() => _i144.ForgotPasswordCubit(gh<_i497.AuthCubit>()));
    gh.factory<_i827.SignupCubit>(() => _i827.SignupCubit(gh<_i497.AuthCubit>()));
    gh.singleton<_i6.WebsocketCubit>(() => _i6.WebsocketCubit(
          websocketRepo: gh<_i361.WebSocketRepo>(),
          deviceCubit: gh<_i305.MyDevicesCubit>(),
          liveMapCubit: gh<_i716.LiveMapCubit>(),
        ));
    return this;
  }
}

class _$DiModules extends _i138.DiModules {}
