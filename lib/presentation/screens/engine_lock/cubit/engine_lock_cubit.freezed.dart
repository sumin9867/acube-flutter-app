// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'engine_lock_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EngineLockState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) locking,
    required TResult Function(String message) unlocking,
    required TResult Function(String message) lockSuccess,
    required TResult Function(String message) unlockSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? locking,
    TResult? Function(String message)? unlocking,
    TResult? Function(String message)? lockSuccess,
    TResult? Function(String message)? unlockSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? locking,
    TResult Function(String message)? unlocking,
    TResult Function(String message)? lockSuccess,
    TResult Function(String message)? unlockSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Locking value) locking,
    required TResult Function(_Unlocking value) unlocking,
    required TResult Function(_LockSuccess value) lockSuccess,
    required TResult Function(_UnlockSuccess value) unlockSuccess,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Locking value)? locking,
    TResult? Function(_Unlocking value)? unlocking,
    TResult? Function(_LockSuccess value)? lockSuccess,
    TResult? Function(_UnlockSuccess value)? unlockSuccess,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Locking value)? locking,
    TResult Function(_Unlocking value)? unlocking,
    TResult Function(_LockSuccess value)? lockSuccess,
    TResult Function(_UnlockSuccess value)? unlockSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EngineLockStateCopyWith<$Res> {
  factory $EngineLockStateCopyWith(
          EngineLockState value, $Res Function(EngineLockState) then) =
      _$EngineLockStateCopyWithImpl<$Res, EngineLockState>;
}

/// @nodoc
class _$EngineLockStateCopyWithImpl<$Res, $Val extends EngineLockState>
    implements $EngineLockStateCopyWith<$Res> {
  _$EngineLockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EngineLockStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EngineLockState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) locking,
    required TResult Function(String message) unlocking,
    required TResult Function(String message) lockSuccess,
    required TResult Function(String message) unlockSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? locking,
    TResult? Function(String message)? unlocking,
    TResult? Function(String message)? lockSuccess,
    TResult? Function(String message)? unlockSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? locking,
    TResult Function(String message)? unlocking,
    TResult Function(String message)? lockSuccess,
    TResult Function(String message)? unlockSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Locking value) locking,
    required TResult Function(_Unlocking value) unlocking,
    required TResult Function(_LockSuccess value) lockSuccess,
    required TResult Function(_UnlockSuccess value) unlockSuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Locking value)? locking,
    TResult? Function(_Unlocking value)? unlocking,
    TResult? Function(_LockSuccess value)? lockSuccess,
    TResult? Function(_UnlockSuccess value)? unlockSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Locking value)? locking,
    TResult Function(_Unlocking value)? unlocking,
    TResult Function(_LockSuccess value)? lockSuccess,
    TResult Function(_UnlockSuccess value)? unlockSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EngineLockState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LockingImplCopyWith<$Res> {
  factory _$$LockingImplCopyWith(
          _$LockingImpl value, $Res Function(_$LockingImpl) then) =
      __$$LockingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LockingImplCopyWithImpl<$Res>
    extends _$EngineLockStateCopyWithImpl<$Res, _$LockingImpl>
    implements _$$LockingImplCopyWith<$Res> {
  __$$LockingImplCopyWithImpl(
      _$LockingImpl _value, $Res Function(_$LockingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LockingImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LockingImpl implements _Locking {
  const _$LockingImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EngineLockState.locking(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LockingImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LockingImplCopyWith<_$LockingImpl> get copyWith =>
      __$$LockingImplCopyWithImpl<_$LockingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) locking,
    required TResult Function(String message) unlocking,
    required TResult Function(String message) lockSuccess,
    required TResult Function(String message) unlockSuccess,
    required TResult Function(String message) error,
  }) {
    return locking(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? locking,
    TResult? Function(String message)? unlocking,
    TResult? Function(String message)? lockSuccess,
    TResult? Function(String message)? unlockSuccess,
    TResult? Function(String message)? error,
  }) {
    return locking?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? locking,
    TResult Function(String message)? unlocking,
    TResult Function(String message)? lockSuccess,
    TResult Function(String message)? unlockSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (locking != null) {
      return locking(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Locking value) locking,
    required TResult Function(_Unlocking value) unlocking,
    required TResult Function(_LockSuccess value) lockSuccess,
    required TResult Function(_UnlockSuccess value) unlockSuccess,
    required TResult Function(_Error value) error,
  }) {
    return locking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Locking value)? locking,
    TResult? Function(_Unlocking value)? unlocking,
    TResult? Function(_LockSuccess value)? lockSuccess,
    TResult? Function(_UnlockSuccess value)? unlockSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return locking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Locking value)? locking,
    TResult Function(_Unlocking value)? unlocking,
    TResult Function(_LockSuccess value)? lockSuccess,
    TResult Function(_UnlockSuccess value)? unlockSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (locking != null) {
      return locking(this);
    }
    return orElse();
  }
}

abstract class _Locking implements EngineLockState {
  const factory _Locking(final String message) = _$LockingImpl;

  String get message;

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LockingImplCopyWith<_$LockingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnlockingImplCopyWith<$Res> {
  factory _$$UnlockingImplCopyWith(
          _$UnlockingImpl value, $Res Function(_$UnlockingImpl) then) =
      __$$UnlockingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnlockingImplCopyWithImpl<$Res>
    extends _$EngineLockStateCopyWithImpl<$Res, _$UnlockingImpl>
    implements _$$UnlockingImplCopyWith<$Res> {
  __$$UnlockingImplCopyWithImpl(
      _$UnlockingImpl _value, $Res Function(_$UnlockingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnlockingImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnlockingImpl implements _Unlocking {
  const _$UnlockingImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EngineLockState.unlocking(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlockingImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlockingImplCopyWith<_$UnlockingImpl> get copyWith =>
      __$$UnlockingImplCopyWithImpl<_$UnlockingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) locking,
    required TResult Function(String message) unlocking,
    required TResult Function(String message) lockSuccess,
    required TResult Function(String message) unlockSuccess,
    required TResult Function(String message) error,
  }) {
    return unlocking(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? locking,
    TResult? Function(String message)? unlocking,
    TResult? Function(String message)? lockSuccess,
    TResult? Function(String message)? unlockSuccess,
    TResult? Function(String message)? error,
  }) {
    return unlocking?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? locking,
    TResult Function(String message)? unlocking,
    TResult Function(String message)? lockSuccess,
    TResult Function(String message)? unlockSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unlocking != null) {
      return unlocking(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Locking value) locking,
    required TResult Function(_Unlocking value) unlocking,
    required TResult Function(_LockSuccess value) lockSuccess,
    required TResult Function(_UnlockSuccess value) unlockSuccess,
    required TResult Function(_Error value) error,
  }) {
    return unlocking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Locking value)? locking,
    TResult? Function(_Unlocking value)? unlocking,
    TResult? Function(_LockSuccess value)? lockSuccess,
    TResult? Function(_UnlockSuccess value)? unlockSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return unlocking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Locking value)? locking,
    TResult Function(_Unlocking value)? unlocking,
    TResult Function(_LockSuccess value)? lockSuccess,
    TResult Function(_UnlockSuccess value)? unlockSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unlocking != null) {
      return unlocking(this);
    }
    return orElse();
  }
}

abstract class _Unlocking implements EngineLockState {
  const factory _Unlocking(final String message) = _$UnlockingImpl;

  String get message;

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlockingImplCopyWith<_$UnlockingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LockSuccessImplCopyWith<$Res> {
  factory _$$LockSuccessImplCopyWith(
          _$LockSuccessImpl value, $Res Function(_$LockSuccessImpl) then) =
      __$$LockSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LockSuccessImplCopyWithImpl<$Res>
    extends _$EngineLockStateCopyWithImpl<$Res, _$LockSuccessImpl>
    implements _$$LockSuccessImplCopyWith<$Res> {
  __$$LockSuccessImplCopyWithImpl(
      _$LockSuccessImpl _value, $Res Function(_$LockSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LockSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LockSuccessImpl implements _LockSuccess {
  const _$LockSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EngineLockState.lockSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LockSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LockSuccessImplCopyWith<_$LockSuccessImpl> get copyWith =>
      __$$LockSuccessImplCopyWithImpl<_$LockSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) locking,
    required TResult Function(String message) unlocking,
    required TResult Function(String message) lockSuccess,
    required TResult Function(String message) unlockSuccess,
    required TResult Function(String message) error,
  }) {
    return lockSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? locking,
    TResult? Function(String message)? unlocking,
    TResult? Function(String message)? lockSuccess,
    TResult? Function(String message)? unlockSuccess,
    TResult? Function(String message)? error,
  }) {
    return lockSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? locking,
    TResult Function(String message)? unlocking,
    TResult Function(String message)? lockSuccess,
    TResult Function(String message)? unlockSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (lockSuccess != null) {
      return lockSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Locking value) locking,
    required TResult Function(_Unlocking value) unlocking,
    required TResult Function(_LockSuccess value) lockSuccess,
    required TResult Function(_UnlockSuccess value) unlockSuccess,
    required TResult Function(_Error value) error,
  }) {
    return lockSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Locking value)? locking,
    TResult? Function(_Unlocking value)? unlocking,
    TResult? Function(_LockSuccess value)? lockSuccess,
    TResult? Function(_UnlockSuccess value)? unlockSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return lockSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Locking value)? locking,
    TResult Function(_Unlocking value)? unlocking,
    TResult Function(_LockSuccess value)? lockSuccess,
    TResult Function(_UnlockSuccess value)? unlockSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (lockSuccess != null) {
      return lockSuccess(this);
    }
    return orElse();
  }
}

abstract class _LockSuccess implements EngineLockState {
  const factory _LockSuccess(final String message) = _$LockSuccessImpl;

  String get message;

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LockSuccessImplCopyWith<_$LockSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnlockSuccessImplCopyWith<$Res> {
  factory _$$UnlockSuccessImplCopyWith(
          _$UnlockSuccessImpl value, $Res Function(_$UnlockSuccessImpl) then) =
      __$$UnlockSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnlockSuccessImplCopyWithImpl<$Res>
    extends _$EngineLockStateCopyWithImpl<$Res, _$UnlockSuccessImpl>
    implements _$$UnlockSuccessImplCopyWith<$Res> {
  __$$UnlockSuccessImplCopyWithImpl(
      _$UnlockSuccessImpl _value, $Res Function(_$UnlockSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnlockSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnlockSuccessImpl implements _UnlockSuccess {
  const _$UnlockSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EngineLockState.unlockSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlockSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlockSuccessImplCopyWith<_$UnlockSuccessImpl> get copyWith =>
      __$$UnlockSuccessImplCopyWithImpl<_$UnlockSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) locking,
    required TResult Function(String message) unlocking,
    required TResult Function(String message) lockSuccess,
    required TResult Function(String message) unlockSuccess,
    required TResult Function(String message) error,
  }) {
    return unlockSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? locking,
    TResult? Function(String message)? unlocking,
    TResult? Function(String message)? lockSuccess,
    TResult? Function(String message)? unlockSuccess,
    TResult? Function(String message)? error,
  }) {
    return unlockSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? locking,
    TResult Function(String message)? unlocking,
    TResult Function(String message)? lockSuccess,
    TResult Function(String message)? unlockSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unlockSuccess != null) {
      return unlockSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Locking value) locking,
    required TResult Function(_Unlocking value) unlocking,
    required TResult Function(_LockSuccess value) lockSuccess,
    required TResult Function(_UnlockSuccess value) unlockSuccess,
    required TResult Function(_Error value) error,
  }) {
    return unlockSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Locking value)? locking,
    TResult? Function(_Unlocking value)? unlocking,
    TResult? Function(_LockSuccess value)? lockSuccess,
    TResult? Function(_UnlockSuccess value)? unlockSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return unlockSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Locking value)? locking,
    TResult Function(_Unlocking value)? unlocking,
    TResult Function(_LockSuccess value)? lockSuccess,
    TResult Function(_UnlockSuccess value)? unlockSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unlockSuccess != null) {
      return unlockSuccess(this);
    }
    return orElse();
  }
}

abstract class _UnlockSuccess implements EngineLockState {
  const factory _UnlockSuccess(final String message) = _$UnlockSuccessImpl;

  String get message;

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlockSuccessImplCopyWith<_$UnlockSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$EngineLockStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EngineLockState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) locking,
    required TResult Function(String message) unlocking,
    required TResult Function(String message) lockSuccess,
    required TResult Function(String message) unlockSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? locking,
    TResult? Function(String message)? unlocking,
    TResult? Function(String message)? lockSuccess,
    TResult? Function(String message)? unlockSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? locking,
    TResult Function(String message)? unlocking,
    TResult Function(String message)? lockSuccess,
    TResult Function(String message)? unlockSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Locking value) locking,
    required TResult Function(_Unlocking value) unlocking,
    required TResult Function(_LockSuccess value) lockSuccess,
    required TResult Function(_UnlockSuccess value) unlockSuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Locking value)? locking,
    TResult? Function(_Unlocking value)? unlocking,
    TResult? Function(_LockSuccess value)? lockSuccess,
    TResult? Function(_UnlockSuccess value)? unlockSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Locking value)? locking,
    TResult Function(_Unlocking value)? unlocking,
    TResult Function(_LockSuccess value)? lockSuccess,
    TResult Function(_UnlockSuccess value)? unlockSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EngineLockState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of EngineLockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
