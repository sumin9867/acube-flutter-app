import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config_model.freezed.dart';
part 'app_config_model.g.dart';

@freezed
class AppConfigModel with _$AppConfigModel {
  const AppConfigModel._();

  const factory AppConfigModel({
    @Default(true) bool isFirstRun,
    @JsonKey(
        name: 'locale',
        fromJson: _localeFromLanguageCode,
        toJson: _languageCodeFromLocale)
    required Locale locale,
    required bool showAds,
    required ThemeMode themeMode,
    required String baseUrl,
    required String callCenterContactNumber,
    required String helpCenterContactNumber,
    required String termsAndConditionUrl,
    required String privacyPolicyUrl,
  }) = _AppConfigModel;

  factory AppConfigModel.fromJson(Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);
}

Locale _localeFromLanguageCode(String value) =>
    Locale.fromSubtags(languageCode: value);
String _languageCodeFromLocale(Locale value) => value.toLanguageTag();
