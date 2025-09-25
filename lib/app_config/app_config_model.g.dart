// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigModelImpl _$$AppConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigModelImpl(
      isFirstRun: json['isFirstRun'] as bool? ?? true,
      locale: _localeFromLanguageCode(json['locale'] as String),
      showAds: json['showAds'] as bool,
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
      baseUrl: json['baseUrl'] as String,
      callCenterContactNumber: json['callCenterContactNumber'] as String,
      helpCenterContactNumber: json['helpCenterContactNumber'] as String,
      termsAndConditionUrl: json['termsAndConditionUrl'] as String,
      privacyPolicyUrl: json['privacyPolicyUrl'] as String,
    );

Map<String, dynamic> _$$AppConfigModelImplToJson(
        _$AppConfigModelImpl instance) =>
    <String, dynamic>{
      'isFirstRun': instance.isFirstRun,
      'locale': _languageCodeFromLocale(instance.locale),
      'showAds': instance.showAds,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'baseUrl': instance.baseUrl,
      'callCenterContactNumber': instance.callCenterContactNumber,
      'helpCenterContactNumber': instance.helpCenterContactNumber,
      'termsAndConditionUrl': instance.termsAndConditionUrl,
      'privacyPolicyUrl': instance.privacyPolicyUrl,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
