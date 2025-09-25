import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/data/auth_storage.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/domain/models/user_session.dart';
import 'package:gpspro/presentation/global_widgets/app_dialog.dart';
import 'package:gpspro/presentation/repository/i_auth_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/filter/vehicle_filter_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/router/app_router.dart';
import 'package:gpspro/router/route_helper.dart';
import 'package:gpspro/services/notification_services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@Singleton()
class AuthCubit extends Cubit<AuthState> {
  final AuthStorage authStorage;
  final AppRouter appRouter;
  final AuthRepo authRepo;

  AuthCubit({
    required this.authStorage,
    required this.authRepo,
    required this.appRouter,
  }) : super(const UnAuthenticatedState());

  User? user;
  UserSession? userSession;

  bool get isAuthenticated => state is AuthenticatedState;

  String? profilePicId;

  Future<void> initialize() async {
    try {
      final UserSession? cacheSession = await authStorage.getUserSession();
      userSession = cacheSession;
      log('[AuthCubit] Cached session: $cacheSession');

      if (cacheSession != null) {
        await _refreshSessionOnAppOpen();
      } else {
        emit(const UnAuthenticatedState());
      }
    } catch (e) {
      emit(const ErrorState('Auth Initialization failure!'));
    }
  }

  Future<void> _refreshSessionOnAppOpen() async {
    final session = userSession;
    if (session == null) return;

    try {
      log('[AuthCubit] Refreshing session on app open...');
      final response = await authRepo.login(
        username: session.username,
        password: session.password,
      );

      await requestAuthentication(response.userSession, response.user);
      await locator<MyDevicesCubit>().init();

      log('[AuthCubit] Session refreshed successfully on app open');

      try {
        await locator.get<DevicesQuickCheckCubit>().checkDevices();
      } catch (e) {
        log('[AuthCubit] Failed to check devices after auth refresh: $e');
      }
    } catch (e, s) {
      log('[AuthCubit] Session refresh failed on app open: $e', stackTrace: s);

      await _loadUser();
      final currentUser = user;
      final currentSession = userSession;
      if (currentUser != null && currentSession != null) {
        await _saveUser();
        await requestAuthentication(currentSession, currentUser);
        await locator<MyDevicesCubit>().init();

        try {
          await locator.get<DevicesQuickCheckCubit>().checkDevices();
        } catch (e) {
          log('[AuthCubit] Failed to check devices after fallback auth: $e');
        }
      } else {
        requestUnAuthentication();
      }
    }
  }

  Future<void> requestAuthentication(UserSession session, User newUser) async {
    log('[AuthCubit] requestAuthentication called with user: ${newUser.id}');
    userSession = session;
    user = newUser;
    await _saveSession();
    await _saveUser();

    await NotificationService().initialize(newUser, session);
    loadCachedProfilePic();

    emit(AuthenticatedState(newUser));
    log('[AuthCubit] AuthenticatedState emitted, isAuthenticated: $isAuthenticated');
  }

  Future<void> refetchUserSession() async {
    final session = userSession;
    if (session != null) {
      final response = await authRepo.login(
        username: session.username,
        password: session.password,
      );

      await requestAuthentication(
        response.userSession,
        response.user,
      );
    }
  }

  Future<void> refetchUserSessionLogin() async {
    final session = userSession;
    if (session != null) {
      final response = await authRepo.login(
        username: session.username,
        password: session.password,
      );
      await _saveUser();

      await requestAuthentication(
        response.userSession,
        response.user,
      );
      await locator<MyDevicesCubit>().init();
    }
  }

  Future<void> refetchUserSessionAfterPasswordChange(String password) async {
    final session = userSession;
    if (session != null) {
      log('I am new passowrd $password');
      final response = await authRepo.login(
        username: session.username,
        password: password,
      );
      await _saveUser();

      await requestAuthentication(
        response.userSession,
        response.user,
      );
    }
  }

  Future<void> uploadProfilePIcture(File image) async {
    try {
      emit(const AuthState.loading('errorMessage'));
      await authRepo.uploadProfilePic(image);
      emit(const AuthState.success('Profile picture changed!'));
    } catch (e) {
      log('Error uploading image: $e');
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> updateProfile(User user) async {
    await authRepo.updateUser(user);
  }

  Future<void> handleUnauthorized() async {
    await authStorage.clear();
    userSession = null;
    user = null;
    emit(const UnAuthenticatedState());
    RouteHelper.pushReplaceSignInPage();
  }

  Future<bool> confirmPassword(String password) async {
    emit(const AuthState.loading('Confirming Password'));

    final result = await authRepo.confirmPassword(confirmPassword: password);

    return result.fold(
      (error) {
        log('I am confirmed $error');
        emit(AuthState.error(error));
        return false;
      },
      (_) {
        emit(const AuthState.success('Password Verified!'));
        return true;
      },
    );
  }

  Future<void> deleteUser(int userID) async {
    emit(const AuthState.loading('Deleting Account...'));

    final result = await authRepo.deleteAccount(userID);

    result.fold(
      (error) => emit(AuthState.error(error)),
      (_) => emit(const AuthState.success('Account Deletion Success')),
    );
  }

  Future<void> requestUnAuthentication() async {
    try {
      final currentUser = user;
      final currentSession = userSession;
      if (currentUser != null && currentSession != null) {
        log('User or UserSession is cleared');
        await NotificationService().removeFcmTokenFromServer(currentUser, currentSession);
        await FirebaseMessaging.instance.deleteToken();
      }

      await locator<MyDevicesCubit>().clearState();
      await locator<LiveMapCubit>().clearState();
      await locator<VehicleFilterCubit>().close();

      userSession = null;
      user = null;
      _deleteUserSession();
      _deleteUser();

      emit(const UnAuthenticatedState());
      log('All processes done');
    } catch (e, stackTrace) {
      log('Error during unauthentication: $e', stackTrace: stackTrace);
      // Still complete unauthentication even if some operations fail
      userSession = null;
      user = null;
      _deleteUserSession();
      _deleteUser();
      emit(const UnAuthenticatedState());
    }
  }

  Future<void> _loadUser() async {
    user = await authStorage.getUser();
  }

  Future<String> forgotPassword(String email) async {
    return 'email';
  }

  Future<void> _saveSession() async {
    final sessionMap = jsonEncode(userSession);
    authStorage.setUserSession(sessionMap);
  }

  Future<void> _saveUser() async {
    final userMap = jsonEncode(user);
    authStorage.setUser(userMap);
  }

  void setProfilePic(String latestPicId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profilePicId', latestPicId);

    profilePicId = latestPicId;
  }

  void loadCachedProfilePic() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedPicId = prefs.getString('profilePicId');

    if (cachedPicId != null) {
      profilePicId = cachedPicId;
    }

    if (cachedPicId == null) getMyProfile();
  }

  Future<void> getMyProfile() async {
    try {
      final response = await authRepo.getMyProfile();
      final latestPicId = response['attributes']['profilePicId'];
      log('I am from response user card user$response');
      if (latestPicId != profilePicId) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('profilePicId', latestPicId);

        profilePicId = latestPicId;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void _deleteUserSession() => authStorage.deleteUserSession();

  void _deleteUser() => authStorage.deleteUser();

  Future<void> logoutUser({bool navigateToLogin = true}) async {
    try {
      if (isAuthenticated) {
        await authRepo.logout();

        authStorage.clear();

        locator.reset();

        requestUnAuthentication();

        if (navigateToLogin) {
          RouteHelper.pushReplaceSignInPage();
        }
      } else {
        log('User is already unauthenticated, no need to log out');
      }
    } catch (e, stackTrace) {
      log('Error during logout: $e', error: e, stackTrace: stackTrace);

      emit(const ErrorState('Please try again'));
      final currentUser = user;
      if (currentUser != null) {
        emit(AuthenticatedState(currentUser));
      } else {
        requestUnAuthentication();
      }
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    await state.whenOrNull(
      authenticated: (user) async {
        await AppDialogs.showConfirmation(
          title: 'Delete account',
          content: 'Are you sure?',
          onYes: () async {
            await authRepo.deleteAccount(user.id);

            logoutUser();
          },
        );
      },
    );
  }
}
