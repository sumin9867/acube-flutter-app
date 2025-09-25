import 'dart:developer';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_alert_window/system_alert_window.dart';

class AppPermissions {
  static bool _hasRequestedAllPermissions = false;

  static Future<bool> askForAllPermissions() async {
    if (_hasRequestedAllPermissions) return true;

    try {
      log('Requesting location permission...');
      await Permission.location.request();

      log('Requesting location when in use permission...');
      await Permission.locationWhenInUse.request();

      log('Requesting location always permission...');
      await Permission.locationAlways.request();

      log('Requesting notification permission...');
      // Add code if you want to ask for notification permission here.

      log('Requesting system alert permission...');
      // await SystemAlertWindow.requestPermissions(
      //     prefMode: SystemWindowPrefMode.OVERLAY);

      final PermissionStatus locationAlwayPermission = await Permission.locationAlways.status;
      final LocationPermission geolocatorPermission = await Geolocator.checkPermission();

      _hasRequestedAllPermissions = true;

      if (locationAlwayPermission == PermissionStatus.granted) {
        return true;
      } else if (geolocatorPermission == LocationPermission.deniedForever ||
          locationAlwayPermission.isPermanentlyDenied) {
        Geolocator.openLocationSettings();
      }
      return false;
    } catch (e) {
      log('Error requesting permissions: $e');
      return false;
    }
  }

  static bool _isCameraGranted = false;
  static Future<bool> checkCameraPermission() async {
    if (_isCameraGranted) return true;
    _isCameraGranted = await Permission.camera.isGranted;
    if (_isCameraGranted == false) {
      _isCameraGranted = (await Permission.camera.request()).isGranted;
    }
    return _isCameraGranted;
  }

  static bool _isPhotosGranted = false;
  static Future<bool> checkPhotoPermission() async {
    if (_isPhotosGranted) return true;
    _isPhotosGranted = await Permission.photos.isGranted;
    if (_isPhotosGranted == false) {
      _isPhotosGranted = (await Permission.photos.request()).isGranted;
    }
    return _isPhotosGranted;
  }

  static bool _isStorageGranted = false;
  static Future<bool> checkStoragePermission() async {
    if (_isStorageGranted) return true;
    if (!Platform.isAndroid) {
      _isStorageGranted = true;
    }
    _isStorageGranted = await Permission.storage.isGranted;
    if (_isStorageGranted == false) {
      _isStorageGranted = (await Permission.storage.request()).isGranted;
    }
    return _isStorageGranted;
  }

  static bool _isPhoneCallGranted = false;
  static Future<bool> checkPhoneCallPermission() async {
    if (_isPhoneCallGranted) return true;
    _isPhoneCallGranted = await Permission.phone.isGranted;
    if (_isPhoneCallGranted == false) {
      _isPhoneCallGranted = (await Permission.phone.request()).isGranted;
    }
    return _isPhoneCallGranted;
  }

  static bool _isLocationGranted = false;
  static Future<bool> checkLocationPermission() async {
    if (_isLocationGranted) return true;
    if (await Permission.location.serviceStatus.isEnabled) {
      _isLocationGranted = await Permission.location.isGranted;
      if (_isLocationGranted == false) {
        _isLocationGranted = (await Permission.location.request()).isGranted;
        if (!_isLocationGranted) await openAppSettings();
      }
      return _isLocationGranted;
    }
    return _isLocationGranted;
  }

  static bool _isSystemAlertGranted = false;
  static Future<bool> checkSystemAlertPermission() async {
    if (_isSystemAlertGranted) return true;
    _isSystemAlertGranted = await Permission.systemAlertWindow.isGranted;
    if (_isSystemAlertGranted == false) {
      _isSystemAlertGranted = (await Permission.phone.request()).isGranted;
    }
    await SystemAlertWindow.requestPermissions(prefMode: SystemWindowPrefMode.OVERLAY);
    return _isSystemAlertGranted;
  }
}
