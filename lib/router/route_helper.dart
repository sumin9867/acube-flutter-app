import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:gpspro/router/app_router.dart';
import 'package:gpspro/router/route_constants.dart';
import 'package:gpspro/router/route_params.dart';

class RouteHelper {
  static void pushReplaceSignInPage() {
    locator<AppRouter>().pushReplacement(
      RouteConstant.signin,
    );
  }

  static void pushChangePasswordPage() {
    locator<AppRouter>().push(
      RouteConstant.changePassword,
    );
  }

  static void pushDeviceInfoPage(VehicleInfoRouteParams params) {
    final path = RouteConstant.vehicleInfo.replaceFirst(
      ':deviceId',
      params.device.id.toString(),
    );

    locator<AppRouter>().push(
      path,
      extra: params,
    );
  }

  static void pushVehicleDashboardPage(VehicleDashboardRouteParams params) {
    locator<AppRouter>().push(
      '${RouteConstant.vehicleDetails(params.device.id.toString())}/dashboard',
      extra: params,
    );
  }

  static Future pushDeviceDetailsPage(VehicleDetailsRouteParams params) {
    return locator<AppRouter>().push(
      RouteConstant.vehicleDetails(params.device.id.toString()),
      extra: params,
    );
  }

  static void pushDeviceMapTripDetailsPage(VehicleMapTripRouteParams params) {
    locator<AppRouter>().push(
      '/vehicle/${params.trip.deviceId}/trip',
      extra: params,
    );
  }

  static void pushDeviceMapStopDetailsPage(VehicleMapStopRouteParams params) {
    locator<AppRouter>().push(
      '/vehicle/${params.stop.deviceId}/stop',
      extra: params,
    );
  }

  static void pushVehiclePlaybackPage(VehiclePlaybackRouteParams params) {
    locator<AppRouter>().push(
      '/vehicle/${params.vehicleId}/playback',
      extra: params,
    );
  }

  static void pushAddVehiclePage() {
    locator<AppRouter>().push(
      RouteConstant.addVehicle,
    );
  }

  static void pushNotificationSettingsPage() {
    locator<AppRouter>().push(
      RouteConstant.notificationSettings,
    );
  }

  static void pushSubscriptionPage() {
    locator<AppRouter>().push(
      RouteConstant.subscription,
    );
  }

  static void pushCustomerCarePage(CustomerCareParams isLoggedIn) {
    locator<AppRouter>().push(RouteConstant.customerCare(), extra: isLoggedIn);
  }

  static void pushCustomerCareLandingPage() {
    locator<AppRouter>().push(
      RouteConstant.customerServiceLandingScreen,
    );
  }

  static void pushWebViewPage(WebViewRouteParams params) {
    locator<AppRouter>().push(
      RouteConstant.webView,
      extra: params,
    );
  }

  static void pushGeofenceRoute(GeofenceRouteParams params) {
    locator<AppRouter>().push(
      RouteConstant.geofence,
      extra: params,
    );
  }

  static Future pushAddGeofenceRoute(GeofenceRouteParams params) {
    return locator<AppRouter>().push(
      RouteConstant.addGeofence,
      extra: params,
    );
  }

  static Future pushViewGeofenceRoute(ViewGeofenceRouteParams params) {
    return locator<AppRouter>().push(
      RouteConstant.viewGeofence(params.geofenceModel.id.toString()),
      extra: params,
    );
  }

  static void pushVehicleEngineLockPage(VehicleEngineLockRouteParams params) {
    locator<AppRouter>().push(
      RouteConstant.vehicleEngineLock(
        params.device.id.toString(),
      ),
      extra: params,
    );
  }

  static void pushVehicleAntiTheftPage(VehicleAntiTheftRouteParams params) {
    locator<AppRouter>().push(
      RouteConstant.vehicleAntiTheftLock(
        params.device.id.toString(),
      ),
      extra: params,
    );
  }

  static void pushVehicleSettingsPage(VehicleSettingsRouteParams params) {
    locator<AppRouter>().push(
      RouteConstant.vehicleSettings(
        params.device.id.toString(),
      ),
      extra: params,
    );
  }

  static void pushEventMapPage(EventMapRouteParams params) {
    locator<AppRouter>().push(
      RouteConstant.eventMap,
      extra: params,
    );
  }

  static void pushShareLocationPage(ShareLocationRouteParams params) {
    locator<AppRouter>().push(
      RouteConstant.shareLocation,
      extra: params,
    );
  }
}
