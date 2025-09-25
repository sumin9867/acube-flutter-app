// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geofence_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeofenceModel _$GeofenceModelFromJson(Map<String, dynamic> json) {
  return _GeofenceModel.fromJson(json);
}

/// @nodoc
mixin _$GeofenceModel {
  int? get id => throw _privateConstructorUsedError;
  int? get calendarId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;
  String? get area => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this GeofenceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeofenceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeofenceModelCopyWith<GeofenceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeofenceModelCopyWith<$Res> {
  factory $GeofenceModelCopyWith(
          GeofenceModel value, $Res Function(GeofenceModel) then) =
      _$GeofenceModelCopyWithImpl<$Res, GeofenceModel>;
  @useResult
  $Res call(
      {int? id,
      int? calendarId,
      String? name,
      String? description,
      Map<String, dynamic>? attributes,
      String? area,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isSelected});
}

/// @nodoc
class _$GeofenceModelCopyWithImpl<$Res, $Val extends GeofenceModel>
    implements $GeofenceModelCopyWith<$Res> {
  _$GeofenceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeofenceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? attributes = freezed,
    Object? area = freezed,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      calendarId: freezed == calendarId
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeofenceModelImplCopyWith<$Res>
    implements $GeofenceModelCopyWith<$Res> {
  factory _$$GeofenceModelImplCopyWith(
          _$GeofenceModelImpl value, $Res Function(_$GeofenceModelImpl) then) =
      __$$GeofenceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? calendarId,
      String? name,
      String? description,
      Map<String, dynamic>? attributes,
      String? area,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isSelected});
}

/// @nodoc
class __$$GeofenceModelImplCopyWithImpl<$Res>
    extends _$GeofenceModelCopyWithImpl<$Res, _$GeofenceModelImpl>
    implements _$$GeofenceModelImplCopyWith<$Res> {
  __$$GeofenceModelImplCopyWithImpl(
      _$GeofenceModelImpl _value, $Res Function(_$GeofenceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeofenceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? attributes = freezed,
    Object? area = freezed,
    Object? isSelected = null,
  }) {
    return _then(_$GeofenceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      calendarId: freezed == calendarId
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeofenceModelImpl implements _GeofenceModel {
  const _$GeofenceModelImpl(
      {this.id,
      this.calendarId,
      this.name,
      this.description,
      final Map<String, dynamic>? attributes,
      this.area,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.isSelected = false})
      : _attributes = attributes;

  factory _$GeofenceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeofenceModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? calendarId;
  @override
  final String? name;
  @override
  final String? description;
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
  final String? area;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isSelected;

  @override
  String toString() {
    return 'GeofenceModel(id: $id, calendarId: $calendarId, name: $name, description: $description, attributes: $attributes, area: $area, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeofenceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.calendarId, calendarId) ||
                other.calendarId == calendarId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      calendarId,
      name,
      description,
      const DeepCollectionEquality().hash(_attributes),
      area,
      isSelected);

  /// Create a copy of GeofenceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeofenceModelImplCopyWith<_$GeofenceModelImpl> get copyWith =>
      __$$GeofenceModelImplCopyWithImpl<_$GeofenceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeofenceModelImplToJson(
      this,
    );
  }
}

abstract class _GeofenceModel implements GeofenceModel {
  const factory _GeofenceModel(
      {final int? id,
      final int? calendarId,
      final String? name,
      final String? description,
      final Map<String, dynamic>? attributes,
      final String? area,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool isSelected}) = _$GeofenceModelImpl;

  factory _GeofenceModel.fromJson(Map<String, dynamic> json) =
      _$GeofenceModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get calendarId;
  @override
  String? get name;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get attributes;
  @override
  String? get area;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isSelected;

  /// Create a copy of GeofenceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeofenceModelImplCopyWith<_$GeofenceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
