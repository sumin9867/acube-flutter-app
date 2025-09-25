// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_custom_speed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceCustomSpeed _$DeviceCustomSpeedFromJson(Map<String, dynamic> json) {
  return _DeviceCustomSpeed.fromJson(json);
}

/// @nodoc
mixin _$DeviceCustomSpeed {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get uniqueId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this DeviceCustomSpeed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceCustomSpeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCustomSpeedCopyWith<DeviceCustomSpeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCustomSpeedCopyWith<$Res> {
  factory $DeviceCustomSpeedCopyWith(
          DeviceCustomSpeed value, $Res Function(DeviceCustomSpeed) then) =
      _$DeviceCustomSpeedCopyWithImpl<$Res, DeviceCustomSpeed>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? uniqueId,
      Map<String, dynamic>? attributes,
      String? category});
}

/// @nodoc
class _$DeviceCustomSpeedCopyWithImpl<$Res, $Val extends DeviceCustomSpeed>
    implements $DeviceCustomSpeedCopyWith<$Res> {
  _$DeviceCustomSpeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceCustomSpeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? uniqueId = freezed,
    Object? attributes = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueId: freezed == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceCustomSpeedImplCopyWith<$Res>
    implements $DeviceCustomSpeedCopyWith<$Res> {
  factory _$$DeviceCustomSpeedImplCopyWith(_$DeviceCustomSpeedImpl value,
          $Res Function(_$DeviceCustomSpeedImpl) then) =
      __$$DeviceCustomSpeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? uniqueId,
      Map<String, dynamic>? attributes,
      String? category});
}

/// @nodoc
class __$$DeviceCustomSpeedImplCopyWithImpl<$Res>
    extends _$DeviceCustomSpeedCopyWithImpl<$Res, _$DeviceCustomSpeedImpl>
    implements _$$DeviceCustomSpeedImplCopyWith<$Res> {
  __$$DeviceCustomSpeedImplCopyWithImpl(_$DeviceCustomSpeedImpl _value,
      $Res Function(_$DeviceCustomSpeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCustomSpeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? uniqueId = freezed,
    Object? attributes = freezed,
    Object? category = freezed,
  }) {
    return _then(_$DeviceCustomSpeedImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueId: freezed == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCustomSpeedImpl implements _DeviceCustomSpeed {
  const _$DeviceCustomSpeedImpl(
      {this.id,
      this.name,
      this.uniqueId,
      final Map<String, dynamic>? attributes,
      this.category})
      : _attributes = attributes;

  factory _$DeviceCustomSpeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceCustomSpeedImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? uniqueId;
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
  final String? category;

  @override
  String toString() {
    return 'DeviceCustomSpeed(id: $id, name: $name, uniqueId: $uniqueId, attributes: $attributes, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCustomSpeedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, uniqueId,
      const DeepCollectionEquality().hash(_attributes), category);

  /// Create a copy of DeviceCustomSpeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCustomSpeedImplCopyWith<_$DeviceCustomSpeedImpl> get copyWith =>
      __$$DeviceCustomSpeedImplCopyWithImpl<_$DeviceCustomSpeedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCustomSpeedImplToJson(
      this,
    );
  }
}

abstract class _DeviceCustomSpeed implements DeviceCustomSpeed {
  const factory _DeviceCustomSpeed(
      {final int? id,
      final String? name,
      final String? uniqueId,
      final Map<String, dynamic>? attributes,
      final String? category}) = _$DeviceCustomSpeedImpl;

  factory _DeviceCustomSpeed.fromJson(Map<String, dynamic> json) =
      _$DeviceCustomSpeedImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get uniqueId;
  @override
  Map<String, dynamic>? get attributes;
  @override
  String? get category;

  /// Create a copy of DeviceCustomSpeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCustomSpeedImplCopyWith<_$DeviceCustomSpeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
