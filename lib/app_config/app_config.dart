import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/app_config/app_config_model.dart';
import 'package:gpspro/app_config/flavor.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/data/auth_storage.dart';
import 'package:gpspro/data/sources/local_source.dart';
import 'package:injectable/injectable.dart';

part 'app_config.freezed.dart';
part 'app_config_state.dart';

@Singleton()
class AppConfig extends Cubit<AppConfigState> {
  AuthStorage authStorage;
  AuthCubit authCubit;
  LocalSource localSource;

  late AppConfigModel configModel;
  AppConfig({
    required this.authStorage,
    required this.authCubit,
    required this.localSource,
  }) : super(const LoadingState()) {
    _initialize();
  }

  bool get isDarkMode => configModel.themeMode == ThemeMode.dark;
  ThemeMode get themeMode => state is IdleState ? configModel.themeMode : ThemeMode.system;

  Future<AppConfigModel?> get _getConfigModelFromStorage => authStorage.getAppConfig();
  Future<void> _saveConfigModelToStorage() => authStorage.setAppConfigData(jsonEncode(configModel));

  Future<void> _initialize() async {
    final cacheConfig = await _getConfigModelFromStorage;
    configModel = AppConfigModel(
      showAds: cacheConfig?.showAds ?? false,
      themeMode: cacheConfig?.themeMode ?? ThemeMode.light,
      locale: cacheConfig?.locale ?? const Locale.fromSubtags(languageCode: 'en'),
      baseUrl: FlavorConfig.appFlavor.baseUrl,
      callCenterContactNumber: '+9779812363691',
      helpCenterContactNumber: '+9779812363691',
      termsAndConditionUrl: 'https://www.trackon-gps.com/pages/terms-and-conditions/',
      privacyPolicyUrl: 'https://www.trackon-gps.com/pages/privacy-policy/',
      isFirstRun: cacheConfig?.isFirstRun ?? true,
    );

    emit(IdleState(configModel));
    _saveConfigModelToStorage();
  }

  void markAsFirstRunCompleted() {
    configModel = configModel.copyWith(isFirstRun: false);
    _saveConfigModelToStorage();
  }

  // void toggleThemeMode() {
  //   configModel = configModel.copyWith(themeMode: isDarkMode ? ThemeMode.light : ThemeMode.dark);
  //   _saveConfigModelToStorage();
  //   emit(IdleState(configModel));
  // }

  // void loadLocale(Locale l) {
  //   configModel = configModel.copyWith(locale: l);
  //   _saveConfigModelToStorage();
  //   emit(IdleState(configModel));
  // }
}
