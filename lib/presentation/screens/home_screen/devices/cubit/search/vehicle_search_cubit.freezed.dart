// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VehicleSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inactive,
    required TResult Function(List<DeviceCubit> devices) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inactive,
    TResult? Function(List<DeviceCubit> devices)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inactive,
    TResult Function(List<DeviceCubit> devices)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InactiveState value) inactive,
    required TResult Function(_IdleState value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InactiveState value)? inactive,
    TResult? Function(_IdleState value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InactiveState value)? inactive,
    TResult Function(_IdleState value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleSearchStateCopyWith<$Res> {
  factory $VehicleSearchStateCopyWith(
          VehicleSearchState value, $Res Function(VehicleSearchState) then) =
      _$VehicleSearchStateCopyWithImpl<$Res, VehicleSearchState>;
}

/// @nodoc
class _$VehicleSearchStateCopyWithImpl<$Res, $Val extends VehicleSearchState>
    implements $VehicleSearchStateCopyWith<$Res> {
  _$VehicleSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InactiveStateImplCopyWith<$Res> {
  factory _$$InactiveStateImplCopyWith(
          _$InactiveStateImpl value, $Res Function(_$InactiveStateImpl) then) =
      __$$InactiveStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InactiveStateImplCopyWithImpl<$Res>
    extends _$VehicleSearchStateCopyWithImpl<$Res, _$InactiveStateImpl>
    implements _$$InactiveStateImplCopyWith<$Res> {
  __$$InactiveStateImplCopyWithImpl(
      _$InactiveStateImpl _value, $Res Function(_$InactiveStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InactiveStateImpl implements _InactiveState {
  const _$InactiveStateImpl();

  @override
  String toString() {
    return 'VehicleSearchState.inactive()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InactiveStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inactive,
    required TResult Function(List<DeviceCubit> devices) idle,
  }) {
    return inactive();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inactive,
    TResult? Function(List<DeviceCubit> devices)? idle,
  }) {
    return inactive?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inactive,
    TResult Function(List<DeviceCubit> devices)? idle,
    required TResult orElse(),
  }) {
    if (inactive != null) {
      return inactive();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InactiveState value) inactive,
    required TResult Function(_IdleState value) idle,
  }) {
    return inactive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InactiveState value)? inactive,
    TResult? Function(_IdleState value)? idle,
  }) {
    return inactive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InactiveState value)? inactive,
    TResult Function(_IdleState value)? idle,
    required TResult orElse(),
  }) {
    if (inactive != null) {
      return inactive(this);
    }
    return orElse();
  }
}

abstract class _InactiveState implements VehicleSearchState {
  const factory _InactiveState() = _$InactiveStateImpl;
}

/// @nodoc
abstract class _$$IdleStateImplCopyWith<$Res> {
  factory _$$IdleStateImplCopyWith(
          _$IdleStateImpl value, $Res Function(_$IdleStateImpl) then) =
      __$$IdleStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DeviceCubit> devices});
}

/// @nodoc
class __$$IdleStateImplCopyWithImpl<$Res>
    extends _$VehicleSearchStateCopyWithImpl<$Res, _$IdleStateImpl>
    implements _$$IdleStateImplCopyWith<$Res> {
  __$$IdleStateImplCopyWithImpl(
      _$IdleStateImpl _value, $Res Function(_$IdleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$IdleStateImpl(
      null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceCubit>,
    ));
  }
}

/// @nodoc

class _$IdleStateImpl implements _IdleState {
  const _$IdleStateImpl(final List<DeviceCubit> devices) : _devices = devices;

  final List<DeviceCubit> _devices;
  @override
  List<DeviceCubit> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'VehicleSearchState.idle(devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleStateImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  /// Create a copy of VehicleSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleStateImplCopyWith<_$IdleStateImpl> get copyWith =>
      __$$IdleStateImplCopyWithImpl<_$IdleStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inactive,
    required TResult Function(List<DeviceCubit> devices) idle,
  }) {
    return idle(devices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inactive,
    TResult? Function(List<DeviceCubit> devices)? idle,
  }) {
    return idle?.call(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inactive,
    TResult Function(List<DeviceCubit> devices)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(devices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InactiveState value) inactive,
    required TResult Function(_IdleState value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InactiveState value)? inactive,
    TResult? Function(_IdleState value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InactiveState value)? inactive,
    TResult Function(_IdleState value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleState implements VehicleSearchState {
  const factory _IdleState(final List<DeviceCubit> devices) = _$IdleStateImpl;

  List<DeviceCubit> get devices;

  /// Create a copy of VehicleSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdleStateImplCopyWith<_$IdleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
