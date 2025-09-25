class RouteConstant {
  static const String splash = '/';
  static const String onBoarding = '/on_boarding';
  static const String verificationPayment = '/verificationPayment';

  static const String signin = '/signin';
  static const String forgotPassword = '/forgot_password';
  static const String changePassword = '/change_password';
  static const String selectNotification = '/select_notification';
  static const String customerServiceLandingScreen = '/customer_service_landingScreen';
  static const String passwordResetConfirmation = '/password_reset_confirmation';

  // static const String welcome = '/welcome';

  // SIGNUP
  static const String signup = '/signup';

  // ADD VEHICLE
  static const String addVehicle = '/add_vehicle';
  static const String noConnection = '/noConnection';

  // HOME
  static const String home = '/home';
  static const String devices = '/devices';
  static const String events = '/events';
  static const String settings = '/settings';

  // DEVICES
  static const String vehicleInfo = 'info/:${RoutePathParams.deviceId}';
  static const String vehicleDashboard = '/vehicle/:${RoutePathParams.deviceId}/dashboard';
  static String vehicleDetails([String? vehicleId]) => '/vehicle/${vehicleId ?? ':${RoutePathParams.deviceId}'}';
  static const String vehiclePlayback = '/vehicle/:${RoutePathParams.deviceId}/playback';
  static const String vehicleMapTripDetails = '/vehicle/:${RoutePathParams.deviceId}/trip';
  static const String vehicleMapStopDetails = '/vehicle/:${RoutePathParams.deviceId}/stop';

  static String vehicleEngineLock([String? vehicleId]) => '${vehicleDetails(vehicleId)}/$_engineLock';
  static String vehicleAntiTheftLock([String? vehicleId]) => '${vehicleDetails(vehicleId)}/$_antiTheft';
  static String vehicleSettings([String? vehicleId]) => '${vehicleDetails(vehicleId)}/$_settings';

  // Event Map
  static const String eventMap = '/event/map';

  // share location
  static const String shareLocation = '/share/location';

  // GEOFENCE
  static const String geofence = '/geofence';
  static const String addGeofence = '/geofence/$add';
  static String viewGeofence([String? id]) => '/geofence/${id ?? ':${RoutePathParams.geofenceId}'}/view';
  static String customerCare([bool? isLoggedIn]) => '/customerCare';

  // PREFERENCES
  static const String notificationSettings = '/notification_settings';
  static const String subscription = '/subscription';

  // WEB VIEW
  static const String webView = '/webView';

  //GENERIC SUB ROUTE
  static const String add = 'add';
  static const String _engineLock = 'engine_lock';
  static const String _antiTheft = 'anti_theft';
  static const String _settings = 'settings';

// static const String trackDevice = '/trackDevice';
  // static const String deviceDashboard = '/deviceDashboard';
  // static const String deviceInfo = '/deviceInfo';
  // static const String reportList = '/reportList';
  // static const String reportRoute = '/reportRoute';
  // static const String reportEvent = '/reportEvent';
  // static const String reportTrip = '/reportTrip';
  // static const String reportStop = '/reportStop';
  // static const String reportSummary = '/reportSummary';
  // static const String playback = '/playback';
  // static const String intro = '/intro';
  // static const String eventMap = '/eventMap';
  // static const String geofence = '/geofence';
  // static const String geofenceList = '/geofenceList';
  // static const String geofenceAdd = '/geofenceAdd';
  // static const String addDevice = '/addDevice';
  // static const String noconnection = '/noconnection';
  // static const String adddash = '/adddash';
  // static const String oss = '/oss';
}

class RoutePathParams {
  static const String deviceId = 'deviceId';
  static const String geofenceId = 'geofenceId';
}
