// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppConfigModel _$AppConfigModelFromJson(Map<String, dynamic> json) {
  return _AppConfigModel.fromJson(json);
}

/// @nodoc
mixin _$AppConfigModel {
  bool get isFirstRun => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'locale',
      fromJson: _localeFromLanguageCode,
      toJson: _languageCodeFromLocale)
  Locale get locale => throw _privateConstructorUsedError;
  bool get showAds => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  String get baseUrl => throw _privateConstructorUsedError;
  String get callCenterContactNumber => throw _privateConstructorUsedError;
  String get helpCenterContactNumber => throw _privateConstructorUsedError;
  String get termsAndConditionUrl => throw _privateConstructorUsedError;
  String get privacyPolicyUrl => throw _privateConstructorUsedError;

  /// Serializes this AppConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigModelCopyWith<AppConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigModelCopyWith<$Res> {
  factory $AppConfigModelCopyWith(
          AppConfigModel value, $Res Function(AppConfigModel) then) =
      _$AppConfigModelCopyWithImpl<$Res, AppConfigModel>;
  @useResult
  $Res call(
      {bool isFirstRun,
      @JsonKey(
          name: 'locale',
          fromJson: _localeFromLanguageCode,
          toJson: _languageCodeFromLocale)
      Locale locale,
      bool showAds,
      ThemeMode themeMode,
      String baseUrl,
      String callCenterContactNumber,
      String helpCenterContactNumber,
      String termsAndConditionUrl,
      String privacyPolicyUrl});
}

/// @nodoc
class _$AppConfigModelCopyWithImpl<$Res, $Val extends AppConfigModel>
    implements $AppConfigModelCopyWith<$Res> {
  _$AppConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstRun = null,
    Object? locale = null,
    Object? showAds = null,
    Object? themeMode = null,
    Object? baseUrl = null,
    Object? callCenterContactNumber = null,
    Object? helpCenterContactNumber = null,
    Object? termsAndConditionUrl = null,
    Object? privacyPolicyUrl = null,
  }) {
    return _then(_value.copyWith(
      isFirstRun: null == isFirstRun
          ? _value.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      showAds: null == showAds
          ? _value.showAds
          : showAds // ignore: cast_nullable_to_non_nullable
              as bool,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      callCenterContactNumber: null == callCenterContactNumber
          ? _value.callCenterContactNumber
          : callCenterContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      helpCenterContactNumber: null == helpCenterContactNumber
          ? _value.helpCenterContactNumber
          : helpCenterContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      termsAndConditionUrl: null == termsAndConditionUrl
          ? _value.termsAndConditionUrl
          : termsAndConditionUrl // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigModelImplCopyWith<$Res>
    implements $AppConfigModelCopyWith<$Res> {
  factory _$$AppConfigModelImplCopyWith(_$AppConfigModelImpl value,
          $Res Function(_$AppConfigModelImpl) then) =
      __$$AppConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFirstRun,
      @JsonKey(
          name: 'locale',
          fromJson: _localeFromLanguageCode,
          toJson: _languageCodeFromLocale)
      Locale locale,
      bool showAds,
      ThemeMode themeMode,
      String baseUrl,
      String callCenterContactNumber,
      String helpCenterContactNumber,
      String termsAndConditionUrl,
      String privacyPolicyUrl});
}

/// @nodoc
class __$$AppConfigModelImplCopyWithImpl<$Res>
    extends _$AppConfigModelCopyWithImpl<$Res, _$AppConfigModelImpl>
    implements _$$AppConfigModelImplCopyWith<$Res> {
  __$$AppConfigModelImplCopyWithImpl(
      _$AppConfigModelImpl _value, $Res Function(_$AppConfigModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstRun = null,
    Object? locale = null,
    Object? showAds = null,
    Object? themeMode = null,
    Object? baseUrl = null,
    Object? callCenterContactNumber = null,
    Object? helpCenterContactNumber = null,
    Object? termsAndConditionUrl = null,
    Object? privacyPolicyUrl = null,
  }) {
    return _then(_$AppConfigModelImpl(
      isFirstRun: null == isFirstRun
          ? _value.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      showAds: null == showAds
          ? _value.showAds
          : showAds // ignore: cast_nullable_to_non_nullable
              as bool,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      callCenterContactNumber: null == callCenterContactNumber
          ? _value.callCenterContactNumber
          : callCenterContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      helpCenterContactNumber: null == helpCenterContactNumber
          ? _value.helpCenterContactNumber
          : helpCenterContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      termsAndConditionUrl: null == termsAndConditionUrl
          ? _value.termsAndConditionUrl
          : termsAndConditionUrl // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigModelImpl extends _AppConfigModel {
  const _$AppConfigModelImpl(
      {this.isFirstRun = true,
      @JsonKey(
          name: 'locale',
          fromJson: _localeFromLanguageCode,
          toJson: _languageCodeFromLocale)
      required this.locale,
      required this.showAds,
      required this.themeMode,
      required this.baseUrl,
      required this.callCenterContactNumber,
      required this.helpCenterContactNumber,
      required this.termsAndConditionUrl,
      required this.privacyPolicyUrl})
      : super._();

  factory _$AppConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigModelImplFromJson(json);

  @override
  @JsonKey()
  final bool isFirstRun;
  @override
  @JsonKey(
      name: 'locale',
      fromJson: _localeFromLanguageCode,
      toJson: _languageCodeFromLocale)
  final Locale locale;
  @override
  final bool showAds;
  @override
  final ThemeMode themeMode;
  @override
  final String baseUrl;
  @override
  final String callCenterContactNumber;
  @override
  final String helpCenterContactNumber;
  @override
  final String termsAndConditionUrl;
  @override
  final String privacyPolicyUrl;

  @override
  String toString() {
    return 'AppConfigModel(isFirstRun: $isFirstRun, locale: $locale, showAds: $showAds, themeMode: $themeMode, baseUrl: $baseUrl, callCenterContactNumber: $callCenterContactNumber, helpCenterContactNumber: $helpCenterContactNumber, termsAndConditionUrl: $termsAndConditionUrl, privacyPolicyUrl: $privacyPolicyUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigModelImpl &&
            (identical(other.isFirstRun, isFirstRun) ||
                other.isFirstRun == isFirstRun) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.showAds, showAds) || other.showAds == showAds) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(
                    other.callCenterContactNumber, callCenterContactNumber) ||
                other.callCenterContactNumber == callCenterContactNumber) &&
            (identical(
                    other.helpCenterContactNumber, helpCenterContactNumber) ||
                other.helpCenterContactNumber == helpCenterContactNumber) &&
            (identical(other.termsAndConditionUrl, termsAndConditionUrl) ||
                other.termsAndConditionUrl == termsAndConditionUrl) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFirstRun,
      locale,
      showAds,
      themeMode,
      baseUrl,
      callCenterContactNumber,
      helpCenterContactNumber,
      termsAndConditionUrl,
      privacyPolicyUrl);

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigModelImplCopyWith<_$AppConfigModelImpl> get copyWith =>
      __$$AppConfigModelImplCopyWithImpl<_$AppConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigModelImplToJson(
      this,
    );
  }
}

abstract class _AppConfigModel extends AppConfigModel {
  const factory _AppConfigModel(
      {final bool isFirstRun,
      @JsonKey(
          name: 'locale',
          fromJson: _localeFromLanguageCode,
          toJson: _languageCodeFromLocale)
      required final Locale locale,
      required final bool showAds,
      required final ThemeMode themeMode,
      required final String baseUrl,
      required final String callCenterContactNumber,
      required final String helpCenterContactNumber,
      required final String termsAndConditionUrl,
      required final String privacyPolicyUrl}) = _$AppConfigModelImpl;
  const _AppConfigModel._() : super._();

  factory _AppConfigModel.fromJson(Map<String, dynamic> json) =
      _$AppConfigModelImpl.fromJson;

  @override
  bool get isFirstRun;
  @override
  @JsonKey(
      name: 'locale',
      fromJson: _localeFromLanguageCode,
      toJson: _languageCodeFromLocale)
  Locale get locale;
  @override
  bool get showAds;
  @override
  ThemeMode get themeMode;
  @override
  String get baseUrl;
  @override
  String get callCenterContactNumber;
  @override
  String get helpCenterContactNumber;
  @override
  String get termsAndConditionUrl;
  @override
  String get privacyPolicyUrl;

  /// Create a copy of AppConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigModelImplCopyWith<_$AppConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
