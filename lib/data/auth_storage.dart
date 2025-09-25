import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gpspro/app_config/app_config_model.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/domain/models/user_session.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthStorage {
  final FlutterSecureStorage storage;

  AuthStorage(this.storage);

  final String _token = 'TOKEN';
  final String _refreshToken = 'REFRESH_TOKEN';
  final String _expiryTime = 'EXPIRY_TIME';
  final String _mobileNumber = 'MOBILE_NUMBER';
  final String _password = 'PASSWORD';
  final String _appConfigData = 'APP_CONFIG_DATA';
  final String _userData = 'USER_DATA';
  final String _userSession = 'USER_SESSION';

  // ---------------- App Config ----------------
  Future<void> setAppConfigData(String? value) async {
    await storage.write(key: _appConfigData, value: value ?? '');
  }

  Future<AppConfigModel?> getAppConfig() async {
    final jsonString = await storage.read(key: _appConfigData);
    if (jsonString?.isNotEmpty == true) {
      return AppConfigModel.fromJson(jsonDecode(jsonString!));
    }
    return null;
  }

  // ---------------- User ----------------
  Future<void> setUser(String? value) async {
    await storage.write(key: _userData, value: value ?? '');
  }

  Future<User?> getUser() async {
    final jsonString = await storage.read(key: _userData);
    if (jsonString?.isNotEmpty == true) {
      return User.fromJson(jsonDecode(jsonString!));
    }
    return null;
  }

  Future<void> deleteUser() async {
    await storage.delete(key: _userData);
  }

  // ---------------- User Session ----------------
  Future<void> setUserSession(String? value) async {
    await storage.write(key: _userSession, value: value ?? '');
  }

  Future<UserSession?> getUserSession() async {
    final jsonString = await storage.read(key: _userSession);
    if (jsonString?.isNotEmpty == true) {
      return UserSession.fromJson(jsonDecode(jsonString!));
    }
    return null;
  }

  Future<void> deleteUserSession() async {
    await storage.delete(key: _userSession);
    await storage.delete(key: _token);
    await storage.delete(key: _refreshToken);
    // optionally delete _appConfigData if needed
  }

  // ---------------- Token ----------------
  Future<void> setToken(String value) async {
    await storage.write(key: _token, value: value);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _token);
  }

  Future<void> deleteToken() async {
    await storage.delete(key: _token);
  }

  // ---------------- Refresh Token ----------------
  Future<void> setRefreshToken(String value) async {
    await storage.write(key: _refreshToken, value: value);
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: _refreshToken);
  }

  // ---------------- Expiry Time ----------------
  Future<void> setExpiryTime(int value) async {
    await storage.write(key: _expiryTime, value: (value * 1000).toString());
  }

  Future<int?> getExpiryTime() async {
    final value = await storage.read(key: _expiryTime);
    return value != null ? int.tryParse(value) : null;
  }

  // ---------------- Mobile Number ----------------
  Future<void> setMobileNumber(String value) async {
    await storage.write(key: _mobileNumber, value: value);
  }

  Future<String?> getMobileNumber() async {
    return await storage.read(key: _mobileNumber);
  }

  Future<void> deleteMobileNumber() async {
    await storage.delete(key: _mobileNumber);
  }

  // ---------------- Password ----------------
  Future<void> setPassword(String? value) async {
    await storage.write(key: _password, value: value ?? '');
  }

  Future<String?> getPassword() async {
    return await storage.read(key: _password);
  }

  // ---------------- Clear All ----------------
  Future<void> clear() async {
    await storage.deleteAll();
  }
}
