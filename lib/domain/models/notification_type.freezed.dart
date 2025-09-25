// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationTypeModel _$NotificationTypeModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationTypeModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationTypeModel {
  @JsonKey(unknownEnumValue: NotificationType.unknown)
  NotificationType get type => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? get enabled => throw _privateConstructorUsedError;

  /// Serializes this NotificationTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationTypeModelCopyWith<NotificationTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTypeModelCopyWith<$Res> {
  factory $NotificationTypeModelCopyWith(NotificationTypeModel value,
          $Res Function(NotificationTypeModel) then) =
      _$NotificationTypeModelCopyWithImpl<$Res, NotificationTypeModel>;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: NotificationType.unknown)
      NotificationType type,
      @JsonKey(includeFromJson: false, includeToJson: false) bool? enabled});
}

/// @nodoc
class _$NotificationTypeModelCopyWithImpl<$Res,
        $Val extends NotificationTypeModel>
    implements $NotificationTypeModelCopyWith<$Res> {
  _$NotificationTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? enabled = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationTypeModelImplCopyWith<$Res>
    implements $NotificationTypeModelCopyWith<$Res> {
  factory _$$NotificationTypeModelImplCopyWith(
          _$NotificationTypeModelImpl value,
          $Res Function(_$NotificationTypeModelImpl) then) =
      __$$NotificationTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: NotificationType.unknown)
      NotificationType type,
      @JsonKey(includeFromJson: false, includeToJson: false) bool? enabled});
}

/// @nodoc
class __$$NotificationTypeModelImplCopyWithImpl<$Res>
    extends _$NotificationTypeModelCopyWithImpl<$Res,
        _$NotificationTypeModelImpl>
    implements _$$NotificationTypeModelImplCopyWith<$Res> {
  __$$NotificationTypeModelImplCopyWithImpl(_$NotificationTypeModelImpl _value,
      $Res Function(_$NotificationTypeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? enabled = freezed,
  }) {
    return _then(_$NotificationTypeModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationTypeModelImpl implements _NotificationTypeModel {
  const _$NotificationTypeModelImpl(
      {@JsonKey(unknownEnumValue: NotificationType.unknown) required this.type,
      @JsonKey(includeFromJson: false, includeToJson: false) this.enabled});

  factory _$NotificationTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTypeModelImplFromJson(json);

  @override
  @JsonKey(unknownEnumValue: NotificationType.unknown)
  final NotificationType type;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool? enabled;

  @override
  String toString() {
    return 'NotificationTypeModel(type: $type, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTypeModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, enabled);

  /// Create a copy of NotificationTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTypeModelImplCopyWith<_$NotificationTypeModelImpl>
      get copyWith => __$$NotificationTypeModelImplCopyWithImpl<
          _$NotificationTypeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTypeModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationTypeModel implements NotificationTypeModel {
  const factory _NotificationTypeModel(
      {@JsonKey(unknownEnumValue: NotificationType.unknown)
      required final NotificationType type,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool? enabled}) = _$NotificationTypeModelImpl;

  factory _NotificationTypeModel.fromJson(Map<String, dynamic> json) =
      _$NotificationTypeModelImpl.fromJson;

  @override
  @JsonKey(unknownEnumValue: NotificationType.unknown)
  NotificationType get type;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? get enabled;

  /// Create a copy of NotificationTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationTypeModelImplCopyWith<_$NotificationTypeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
