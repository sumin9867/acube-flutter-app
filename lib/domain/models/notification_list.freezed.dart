// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notificaionlist _$NotificaionlistFromJson(Map<String, dynamic> json) {
  return _Notificaionlist.fromJson(json);
}

/// @nodoc
mixin _$Notificaionlist {
  int get id => throw _privateConstructorUsedError;
  Attributes? get attributes => throw _privateConstructorUsedError;
  int? get calendarId => throw _privateConstructorUsedError;
  bool? get always => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get notificators => throw _privateConstructorUsedError;

  /// Serializes this Notificaionlist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notificaionlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificaionlistCopyWith<Notificaionlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificaionlistCopyWith<$Res> {
  factory $NotificaionlistCopyWith(
          Notificaionlist value, $Res Function(Notificaionlist) then) =
      _$NotificaionlistCopyWithImpl<$Res, Notificaionlist>;
  @useResult
  $Res call(
      {int id,
      Attributes? attributes,
      int? calendarId,
      bool? always,
      String? type,
      String? notificators});

  $AttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$NotificaionlistCopyWithImpl<$Res, $Val extends Notificaionlist>
    implements $NotificaionlistCopyWith<$Res> {
  _$NotificaionlistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notificaionlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = freezed,
    Object? calendarId = freezed,
    Object? always = freezed,
    Object? type = freezed,
    Object? notificators = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
      calendarId: freezed == calendarId
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as int?,
      always: freezed == always
          ? _value.always
          : always // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notificators: freezed == notificators
          ? _value.notificators
          : notificators // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Notificaionlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $AttributesCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificaionlistImplCopyWith<$Res>
    implements $NotificaionlistCopyWith<$Res> {
  factory _$$NotificaionlistImplCopyWith(_$NotificaionlistImpl value,
          $Res Function(_$NotificaionlistImpl) then) =
      __$$NotificaionlistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Attributes? attributes,
      int? calendarId,
      bool? always,
      String? type,
      String? notificators});

  @override
  $AttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$NotificaionlistImplCopyWithImpl<$Res>
    extends _$NotificaionlistCopyWithImpl<$Res, _$NotificaionlistImpl>
    implements _$$NotificaionlistImplCopyWith<$Res> {
  __$$NotificaionlistImplCopyWithImpl(
      _$NotificaionlistImpl _value, $Res Function(_$NotificaionlistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notificaionlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = freezed,
    Object? calendarId = freezed,
    Object? always = freezed,
    Object? type = freezed,
    Object? notificators = freezed,
  }) {
    return _then(_$NotificaionlistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
      calendarId: freezed == calendarId
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as int?,
      always: freezed == always
          ? _value.always
          : always // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      notificators: freezed == notificators
          ? _value.notificators
          : notificators // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificaionlistImpl implements _Notificaionlist {
  _$NotificaionlistImpl(
      {required this.id,
      this.attributes,
      this.calendarId,
      this.always,
      this.type,
      this.notificators});

  factory _$NotificaionlistImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificaionlistImplFromJson(json);

  @override
  final int id;
  @override
  final Attributes? attributes;
  @override
  final int? calendarId;
  @override
  final bool? always;
  @override
  final String? type;
  @override
  final String? notificators;

  @override
  String toString() {
    return 'Notificaionlist(id: $id, attributes: $attributes, calendarId: $calendarId, always: $always, type: $type, notificators: $notificators)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificaionlistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes) &&
            (identical(other.calendarId, calendarId) ||
                other.calendarId == calendarId) &&
            (identical(other.always, always) || other.always == always) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notificators, notificators) ||
                other.notificators == notificators));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, attributes, calendarId, always, type, notificators);

  /// Create a copy of Notificaionlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificaionlistImplCopyWith<_$NotificaionlistImpl> get copyWith =>
      __$$NotificaionlistImplCopyWithImpl<_$NotificaionlistImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificaionlistImplToJson(
      this,
    );
  }
}

abstract class _Notificaionlist implements Notificaionlist {
  factory _Notificaionlist(
      {required final int id,
      final Attributes? attributes,
      final int? calendarId,
      final bool? always,
      final String? type,
      final String? notificators}) = _$NotificaionlistImpl;

  factory _Notificaionlist.fromJson(Map<String, dynamic> json) =
      _$NotificaionlistImpl.fromJson;

  @override
  int get id;
  @override
  Attributes? get attributes;
  @override
  int? get calendarId;
  @override
  bool? get always;
  @override
  String? get type;
  @override
  String? get notificators;

  /// Create a copy of Notificaionlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificaionlistImplCopyWith<_$NotificaionlistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return _Attributes.fromJson(json);
}

/// @nodoc
mixin _$Attributes {
  /// Serializes this Attributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributesCopyWith<$Res> {
  factory $AttributesCopyWith(
          Attributes value, $Res Function(Attributes) then) =
      _$AttributesCopyWithImpl<$Res, Attributes>;
}

/// @nodoc
class _$AttributesCopyWithImpl<$Res, $Val extends Attributes>
    implements $AttributesCopyWith<$Res> {
  _$AttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attributes
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AttributesImplCopyWith<$Res> {
  factory _$$AttributesImplCopyWith(
          _$AttributesImpl value, $Res Function(_$AttributesImpl) then) =
      __$$AttributesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AttributesImplCopyWithImpl<$Res>
    extends _$AttributesCopyWithImpl<$Res, _$AttributesImpl>
    implements _$$AttributesImplCopyWith<$Res> {
  __$$AttributesImplCopyWithImpl(
      _$AttributesImpl _value, $Res Function(_$AttributesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attributes
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AttributesImpl implements _Attributes {
  _$AttributesImpl();

  factory _$AttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributesImplFromJson(json);

  @override
  String toString() {
    return 'Attributes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AttributesImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributesImplToJson(
      this,
    );
  }
}

abstract class _Attributes implements Attributes {
  factory _Attributes() = _$AttributesImpl;

  factory _Attributes.fromJson(Map<String, dynamic> json) =
      _$AttributesImpl.fromJson;
}
