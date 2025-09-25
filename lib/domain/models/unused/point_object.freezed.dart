// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PointObject {
  Widget? get child => throw _privateConstructorUsedError;
  LatLng? get location => throw _privateConstructorUsedError;

  /// Create a copy of PointObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointObjectCopyWith<PointObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointObjectCopyWith<$Res> {
  factory $PointObjectCopyWith(
          PointObject value, $Res Function(PointObject) then) =
      _$PointObjectCopyWithImpl<$Res, PointObject>;
  @useResult
  $Res call({Widget? child, LatLng? location});
}

/// @nodoc
class _$PointObjectCopyWithImpl<$Res, $Val extends PointObject>
    implements $PointObjectCopyWith<$Res> {
  _$PointObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      child: freezed == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointObjectImplCopyWith<$Res>
    implements $PointObjectCopyWith<$Res> {
  factory _$$PointObjectImplCopyWith(
          _$PointObjectImpl value, $Res Function(_$PointObjectImpl) then) =
      __$$PointObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget? child, LatLng? location});
}

/// @nodoc
class __$$PointObjectImplCopyWithImpl<$Res>
    extends _$PointObjectCopyWithImpl<$Res, _$PointObjectImpl>
    implements _$$PointObjectImplCopyWith<$Res> {
  __$$PointObjectImplCopyWithImpl(
      _$PointObjectImpl _value, $Res Function(_$PointObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = freezed,
    Object? location = freezed,
  }) {
    return _then(_$PointObjectImpl(
      child: freezed == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$PointObjectImpl implements _PointObject {
  const _$PointObjectImpl({this.child, this.location});

  @override
  final Widget? child;
  @override
  final LatLng? location;

  @override
  String toString() {
    return 'PointObject(child: $child, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointObjectImpl &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, child, location);

  /// Create a copy of PointObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointObjectImplCopyWith<_$PointObjectImpl> get copyWith =>
      __$$PointObjectImplCopyWithImpl<_$PointObjectImpl>(this, _$identity);
}

abstract class _PointObject implements PointObject {
  const factory _PointObject({final Widget? child, final LatLng? location}) =
      _$PointObjectImpl;

  @override
  Widget? get child;
  @override
  LatLng? get location;

  /// Create a copy of PointObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointObjectImplCopyWith<_$PointObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
