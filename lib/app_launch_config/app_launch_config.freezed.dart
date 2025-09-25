// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_launch_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LaunchConfiguration {
  String get newRelicToken => throw _privateConstructorUsedError;

  /// Create a copy of LaunchConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchConfigurationCopyWith<LaunchConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchConfigurationCopyWith<$Res> {
  factory $LaunchConfigurationCopyWith(
          LaunchConfiguration value, $Res Function(LaunchConfiguration) then) =
      _$LaunchConfigurationCopyWithImpl<$Res, LaunchConfiguration>;
  @useResult
  $Res call({String newRelicToken});
}

/// @nodoc
class _$LaunchConfigurationCopyWithImpl<$Res, $Val extends LaunchConfiguration>
    implements $LaunchConfigurationCopyWith<$Res> {
  _$LaunchConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRelicToken = null,
  }) {
    return _then(_value.copyWith(
      newRelicToken: null == newRelicToken
          ? _value.newRelicToken
          : newRelicToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LaunchConfigurationImplCopyWith<$Res>
    implements $LaunchConfigurationCopyWith<$Res> {
  factory _$$LaunchConfigurationImplCopyWith(_$LaunchConfigurationImpl value,
          $Res Function(_$LaunchConfigurationImpl) then) =
      __$$LaunchConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newRelicToken});
}

/// @nodoc
class __$$LaunchConfigurationImplCopyWithImpl<$Res>
    extends _$LaunchConfigurationCopyWithImpl<$Res, _$LaunchConfigurationImpl>
    implements _$$LaunchConfigurationImplCopyWith<$Res> {
  __$$LaunchConfigurationImplCopyWithImpl(_$LaunchConfigurationImpl _value,
      $Res Function(_$LaunchConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRelicToken = null,
  }) {
    return _then(_$LaunchConfigurationImpl(
      newRelicToken: null == newRelicToken
          ? _value.newRelicToken
          : newRelicToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LaunchConfigurationImpl extends _LaunchConfiguration {
  const _$LaunchConfigurationImpl({required this.newRelicToken}) : super._();

  @override
  final String newRelicToken;

  @override
  String toString() {
    return 'LaunchConfiguration(newRelicToken: $newRelicToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchConfigurationImpl &&
            (identical(other.newRelicToken, newRelicToken) ||
                other.newRelicToken == newRelicToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newRelicToken);

  /// Create a copy of LaunchConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchConfigurationImplCopyWith<_$LaunchConfigurationImpl> get copyWith =>
      __$$LaunchConfigurationImplCopyWithImpl<_$LaunchConfigurationImpl>(
          this, _$identity);
}

abstract class _LaunchConfiguration extends LaunchConfiguration {
  const factory _LaunchConfiguration({required final String newRelicToken}) =
      _$LaunchConfigurationImpl;
  const _LaunchConfiguration._() : super._();

  @override
  String get newRelicToken;

  /// Create a copy of LaunchConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchConfigurationImplCopyWith<_$LaunchConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
