// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get login => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  bool? get readonly => throw _privateConstructorUsedError;
  bool? get administrator => throw _privateConstructorUsedError;
  String? get map => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get zoom => throw _privateConstructorUsedError;
  bool? get twelveHourFormat => throw _privateConstructorUsedError;
  String? get coordinateFormat => throw _privateConstructorUsedError;
  bool? get disabled => throw _privateConstructorUsedError;
  String? get expirationTime => throw _privateConstructorUsedError;
  int? get deviceLimit => throw _privateConstructorUsedError;
  int? get userLimit => throw _privateConstructorUsedError;
  bool? get deviceReadonly => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  bool? get limitCommands => throw _privateConstructorUsedError;
  bool? get disableReports => throw _privateConstructorUsedError;
  String? get poiLayer => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? login,
      String? email,
      String? phone,
      bool? readonly,
      bool? administrator,
      String? map,
      double? latitude,
      double? longitude,
      int? zoom,
      bool? twelveHourFormat,
      String? coordinateFormat,
      bool? disabled,
      String? expirationTime,
      int? deviceLimit,
      int? userLimit,
      bool? deviceReadonly,
      String? token,
      bool? limitCommands,
      bool? disableReports,
      String? poiLayer,
      String? password,
      String? avatarUrl,
      Map<String, dynamic>? attributes});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? login = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? readonly = freezed,
    Object? administrator = freezed,
    Object? map = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? zoom = freezed,
    Object? twelveHourFormat = freezed,
    Object? coordinateFormat = freezed,
    Object? disabled = freezed,
    Object? expirationTime = freezed,
    Object? deviceLimit = freezed,
    Object? userLimit = freezed,
    Object? deviceReadonly = freezed,
    Object? token = freezed,
    Object? limitCommands = freezed,
    Object? disableReports = freezed,
    Object? poiLayer = freezed,
    Object? password = freezed,
    Object? avatarUrl = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      readonly: freezed == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool?,
      administrator: freezed == administrator
          ? _value.administrator
          : administrator // ignore: cast_nullable_to_non_nullable
              as bool?,
      map: freezed == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      zoom: freezed == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as int?,
      twelveHourFormat: freezed == twelveHourFormat
          ? _value.twelveHourFormat
          : twelveHourFormat // ignore: cast_nullable_to_non_nullable
              as bool?,
      coordinateFormat: freezed == coordinateFormat
          ? _value.coordinateFormat
          : coordinateFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      expirationTime: freezed == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceLimit: freezed == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      userLimit: freezed == userLimit
          ? _value.userLimit
          : userLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceReadonly: freezed == deviceReadonly
          ? _value.deviceReadonly
          : deviceReadonly // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      limitCommands: freezed == limitCommands
          ? _value.limitCommands
          : limitCommands // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableReports: freezed == disableReports
          ? _value.disableReports
          : disableReports // ignore: cast_nullable_to_non_nullable
              as bool?,
      poiLayer: freezed == poiLayer
          ? _value.poiLayer
          : poiLayer // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? login,
      String? email,
      String? phone,
      bool? readonly,
      bool? administrator,
      String? map,
      double? latitude,
      double? longitude,
      int? zoom,
      bool? twelveHourFormat,
      String? coordinateFormat,
      bool? disabled,
      String? expirationTime,
      int? deviceLimit,
      int? userLimit,
      bool? deviceReadonly,
      String? token,
      bool? limitCommands,
      bool? disableReports,
      String? poiLayer,
      String? password,
      String? avatarUrl,
      Map<String, dynamic>? attributes});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? login = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? readonly = freezed,
    Object? administrator = freezed,
    Object? map = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? zoom = freezed,
    Object? twelveHourFormat = freezed,
    Object? coordinateFormat = freezed,
    Object? disabled = freezed,
    Object? expirationTime = freezed,
    Object? deviceLimit = freezed,
    Object? userLimit = freezed,
    Object? deviceReadonly = freezed,
    Object? token = freezed,
    Object? limitCommands = freezed,
    Object? disableReports = freezed,
    Object? poiLayer = freezed,
    Object? password = freezed,
    Object? avatarUrl = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      readonly: freezed == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool?,
      administrator: freezed == administrator
          ? _value.administrator
          : administrator // ignore: cast_nullable_to_non_nullable
              as bool?,
      map: freezed == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      zoom: freezed == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as int?,
      twelveHourFormat: freezed == twelveHourFormat
          ? _value.twelveHourFormat
          : twelveHourFormat // ignore: cast_nullable_to_non_nullable
              as bool?,
      coordinateFormat: freezed == coordinateFormat
          ? _value.coordinateFormat
          : coordinateFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      expirationTime: freezed == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceLimit: freezed == deviceLimit
          ? _value.deviceLimit
          : deviceLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      userLimit: freezed == userLimit
          ? _value.userLimit
          : userLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceReadonly: freezed == deviceReadonly
          ? _value.deviceReadonly
          : deviceReadonly // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      limitCommands: freezed == limitCommands
          ? _value.limitCommands
          : limitCommands // ignore: cast_nullable_to_non_nullable
              as bool?,
      disableReports: freezed == disableReports
          ? _value.disableReports
          : disableReports // ignore: cast_nullable_to_non_nullable
              as bool?,
      poiLayer: freezed == poiLayer
          ? _value.poiLayer
          : poiLayer // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      this.login,
      this.email,
      this.phone,
      this.readonly,
      this.administrator,
      this.map,
      this.latitude,
      this.longitude,
      this.zoom,
      this.twelveHourFormat,
      this.coordinateFormat,
      this.disabled,
      this.expirationTime,
      this.deviceLimit,
      this.userLimit,
      this.deviceReadonly,
      this.token,
      this.limitCommands,
      this.disableReports,
      this.poiLayer,
      this.password,
      this.avatarUrl,
      final Map<String, dynamic>? attributes})
      : _attributes = attributes;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? login;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final bool? readonly;
  @override
  final bool? administrator;
  @override
  final String? map;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? zoom;
  @override
  final bool? twelveHourFormat;
  @override
  final String? coordinateFormat;
  @override
  final bool? disabled;
  @override
  final String? expirationTime;
  @override
  final int? deviceLimit;
  @override
  final int? userLimit;
  @override
  final bool? deviceReadonly;
  @override
  final String? token;
  @override
  final bool? limitCommands;
  @override
  final bool? disableReports;
  @override
  final String? poiLayer;
  @override
  final String? password;
  @override
  final String? avatarUrl;
  final Map<String, dynamic>? _attributes;
  @override
  Map<String, dynamic>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, login: $login, email: $email, phone: $phone, readonly: $readonly, administrator: $administrator, map: $map, latitude: $latitude, longitude: $longitude, zoom: $zoom, twelveHourFormat: $twelveHourFormat, coordinateFormat: $coordinateFormat, disabled: $disabled, expirationTime: $expirationTime, deviceLimit: $deviceLimit, userLimit: $userLimit, deviceReadonly: $deviceReadonly, token: $token, limitCommands: $limitCommands, disableReports: $disableReports, poiLayer: $poiLayer, password: $password, avatarUrl: $avatarUrl, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.readonly, readonly) ||
                other.readonly == readonly) &&
            (identical(other.administrator, administrator) ||
                other.administrator == administrator) &&
            (identical(other.map, map) || other.map == map) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.zoom, zoom) || other.zoom == zoom) &&
            (identical(other.twelveHourFormat, twelveHourFormat) ||
                other.twelveHourFormat == twelveHourFormat) &&
            (identical(other.coordinateFormat, coordinateFormat) ||
                other.coordinateFormat == coordinateFormat) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.expirationTime, expirationTime) ||
                other.expirationTime == expirationTime) &&
            (identical(other.deviceLimit, deviceLimit) ||
                other.deviceLimit == deviceLimit) &&
            (identical(other.userLimit, userLimit) ||
                other.userLimit == userLimit) &&
            (identical(other.deviceReadonly, deviceReadonly) ||
                other.deviceReadonly == deviceReadonly) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.limitCommands, limitCommands) ||
                other.limitCommands == limitCommands) &&
            (identical(other.disableReports, disableReports) ||
                other.disableReports == disableReports) &&
            (identical(other.poiLayer, poiLayer) ||
                other.poiLayer == poiLayer) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        login,
        email,
        phone,
        readonly,
        administrator,
        map,
        latitude,
        longitude,
        zoom,
        twelveHourFormat,
        coordinateFormat,
        disabled,
        expirationTime,
        deviceLimit,
        userLimit,
        deviceReadonly,
        token,
        limitCommands,
        disableReports,
        poiLayer,
        password,
        avatarUrl,
        const DeepCollectionEquality().hash(_attributes)
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String name,
      final String? login,
      final String? email,
      final String? phone,
      final bool? readonly,
      final bool? administrator,
      final String? map,
      final double? latitude,
      final double? longitude,
      final int? zoom,
      final bool? twelveHourFormat,
      final String? coordinateFormat,
      final bool? disabled,
      final String? expirationTime,
      final int? deviceLimit,
      final int? userLimit,
      final bool? deviceReadonly,
      final String? token,
      final bool? limitCommands,
      final bool? disableReports,
      final String? poiLayer,
      final String? password,
      final String? avatarUrl,
      final Map<String, dynamic>? attributes}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get login;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  bool? get readonly;
  @override
  bool? get administrator;
  @override
  String? get map;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get zoom;
  @override
  bool? get twelveHourFormat;
  @override
  String? get coordinateFormat;
  @override
  bool? get disabled;
  @override
  String? get expirationTime;
  @override
  int? get deviceLimit;
  @override
  int? get userLimit;
  @override
  bool? get deviceReadonly;
  @override
  String? get token;
  @override
  bool? get limitCommands;
  @override
  bool? get disableReports;
  @override
  String? get poiLayer;
  @override
  String? get password;
  @override
  String? get avatarUrl;
  @override
  Map<String, dynamic>? get attributes;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
