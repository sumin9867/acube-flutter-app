// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_vehicle_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddVehicleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddVehicleViewModel viewModel) idle,
    required TResult Function(String errorMsg) errorState,
    required TResult Function(String successMsg) success,
    required TResult Function(String successMsg) verified,
    required TResult Function(String successMsg) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddVehicleViewModel viewModel)? idle,
    TResult? Function(String errorMsg)? errorState,
    TResult? Function(String successMsg)? success,
    TResult? Function(String successMsg)? verified,
    TResult? Function(String successMsg)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddVehicleViewModel viewModel)? idle,
    TResult Function(String errorMsg)? errorState,
    TResult Function(String successMsg)? success,
    TResult Function(String successMsg)? verified,
    TResult Function(String successMsg)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_SuccessState value)? success,
    TResult Function(_Verified value)? verified,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddVehicleStateCopyWith<$Res> {
  factory $AddVehicleStateCopyWith(
          AddVehicleState value, $Res Function(AddVehicleState) then) =
      _$AddVehicleStateCopyWithImpl<$Res, AddVehicleState>;
}

/// @nodoc
class _$AddVehicleStateCopyWithImpl<$Res, $Val extends AddVehicleState>
    implements $AddVehicleStateCopyWith<$Res> {
  _$AddVehicleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleStateImplCopyWith<$Res> {
  factory _$$IdleStateImplCopyWith(
          _$IdleStateImpl value, $Res Function(_$IdleStateImpl) then) =
      __$$IdleStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddVehicleViewModel viewModel});

  $AddVehicleViewModelCopyWith<$Res> get viewModel;
}

/// @nodoc
class __$$IdleStateImplCopyWithImpl<$Res>
    extends _$AddVehicleStateCopyWithImpl<$Res, _$IdleStateImpl>
    implements _$$IdleStateImplCopyWith<$Res> {
  __$$IdleStateImplCopyWithImpl(
      _$IdleStateImpl _value, $Res Function(_$IdleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewModel = null,
  }) {
    return _then(_$IdleStateImpl(
      null == viewModel
          ? _value.viewModel
          : viewModel // ignore: cast_nullable_to_non_nullable
              as AddVehicleViewModel,
    ));
  }

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddVehicleViewModelCopyWith<$Res> get viewModel {
    return $AddVehicleViewModelCopyWith<$Res>(_value.viewModel, (value) {
      return _then(_value.copyWith(viewModel: value));
    });
  }
}

/// @nodoc

class _$IdleStateImpl implements _IdleState {
  const _$IdleStateImpl(this.viewModel);

  @override
  final AddVehicleViewModel viewModel;

  @override
  String toString() {
    return 'AddVehicleState.idle(viewModel: $viewModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleStateImpl &&
            (identical(other.viewModel, viewModel) ||
                other.viewModel == viewModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewModel);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleStateImplCopyWith<_$IdleStateImpl> get copyWith =>
      __$$IdleStateImplCopyWithImpl<_$IdleStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddVehicleViewModel viewModel) idle,
    required TResult Function(String errorMsg) errorState,
    required TResult Function(String successMsg) success,
    required TResult Function(String successMsg) verified,
    required TResult Function(String successMsg) loading,
  }) {
    return idle(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddVehicleViewModel viewModel)? idle,
    TResult? Function(String errorMsg)? errorState,
    TResult? Function(String successMsg)? success,
    TResult? Function(String successMsg)? verified,
    TResult? Function(String successMsg)? loading,
  }) {
    return idle?.call(viewModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddVehicleViewModel viewModel)? idle,
    TResult Function(String errorMsg)? errorState,
    TResult Function(String successMsg)? success,
    TResult Function(String successMsg)? verified,
    TResult Function(String successMsg)? loading,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(viewModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Loading value) loading,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Loading value)? loading,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_SuccessState value)? success,
    TResult Function(_Verified value)? verified,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleState implements AddVehicleState {
  const factory _IdleState(final AddVehicleViewModel viewModel) =
      _$IdleStateImpl;

  AddVehicleViewModel get viewModel;

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdleStateImplCopyWith<_$IdleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$AddVehicleStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
  }) {
    return _then(_$ErrorStateImpl(
      null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl(this.errorMsg);

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'AddVehicleState.errorState(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddVehicleViewModel viewModel) idle,
    required TResult Function(String errorMsg) errorState,
    required TResult Function(String successMsg) success,
    required TResult Function(String successMsg) verified,
    required TResult Function(String successMsg) loading,
  }) {
    return errorState(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddVehicleViewModel viewModel)? idle,
    TResult? Function(String errorMsg)? errorState,
    TResult? Function(String successMsg)? success,
    TResult? Function(String successMsg)? verified,
    TResult? Function(String successMsg)? loading,
  }) {
    return errorState?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddVehicleViewModel viewModel)? idle,
    TResult Function(String errorMsg)? errorState,
    TResult Function(String successMsg)? success,
    TResult Function(String successMsg)? verified,
    TResult Function(String successMsg)? loading,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Loading value) loading,
  }) {
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Loading value)? loading,
  }) {
    return errorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_SuccessState value)? success,
    TResult Function(_Verified value)? verified,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements AddVehicleState {
  const factory _ErrorState(final String errorMsg) = _$ErrorStateImpl;

  String get errorMsg;

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<$Res> {
  factory _$$SuccessStateImplCopyWith(
          _$SuccessStateImpl value, $Res Function(_$SuccessStateImpl) then) =
      __$$SuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String successMsg});
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<$Res>
    extends _$AddVehicleStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
      _$SuccessStateImpl _value, $Res Function(_$SuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successMsg = null,
  }) {
    return _then(_$SuccessStateImpl(
      null == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessStateImpl implements _SuccessState {
  const _$SuccessStateImpl(this.successMsg);

  @override
  final String successMsg;

  @override
  String toString() {
    return 'AddVehicleState.success(successMsg: $successMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStateImpl &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, successMsg);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      __$$SuccessStateImplCopyWithImpl<_$SuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddVehicleViewModel viewModel) idle,
    required TResult Function(String errorMsg) errorState,
    required TResult Function(String successMsg) success,
    required TResult Function(String successMsg) verified,
    required TResult Function(String successMsg) loading,
  }) {
    return success(successMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddVehicleViewModel viewModel)? idle,
    TResult? Function(String errorMsg)? errorState,
    TResult? Function(String successMsg)? success,
    TResult? Function(String successMsg)? verified,
    TResult? Function(String successMsg)? loading,
  }) {
    return success?.call(successMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddVehicleViewModel viewModel)? idle,
    TResult Function(String errorMsg)? errorState,
    TResult Function(String successMsg)? success,
    TResult Function(String successMsg)? verified,
    TResult Function(String successMsg)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(successMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Loading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Loading value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_SuccessState value)? success,
    TResult Function(_Verified value)? verified,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessState implements AddVehicleState {
  const factory _SuccessState(final String successMsg) = _$SuccessStateImpl;

  String get successMsg;

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifiedImplCopyWith<$Res> {
  factory _$$VerifiedImplCopyWith(
          _$VerifiedImpl value, $Res Function(_$VerifiedImpl) then) =
      __$$VerifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String successMsg});
}

/// @nodoc
class __$$VerifiedImplCopyWithImpl<$Res>
    extends _$AddVehicleStateCopyWithImpl<$Res, _$VerifiedImpl>
    implements _$$VerifiedImplCopyWith<$Res> {
  __$$VerifiedImplCopyWithImpl(
      _$VerifiedImpl _value, $Res Function(_$VerifiedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successMsg = null,
  }) {
    return _then(_$VerifiedImpl(
      null == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifiedImpl implements _Verified {
  const _$VerifiedImpl(this.successMsg);

  @override
  final String successMsg;

  @override
  String toString() {
    return 'AddVehicleState.verified(successMsg: $successMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifiedImpl &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, successMsg);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      __$$VerifiedImplCopyWithImpl<_$VerifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddVehicleViewModel viewModel) idle,
    required TResult Function(String errorMsg) errorState,
    required TResult Function(String successMsg) success,
    required TResult Function(String successMsg) verified,
    required TResult Function(String successMsg) loading,
  }) {
    return verified(successMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddVehicleViewModel viewModel)? idle,
    TResult? Function(String errorMsg)? errorState,
    TResult? Function(String successMsg)? success,
    TResult? Function(String successMsg)? verified,
    TResult? Function(String successMsg)? loading,
  }) {
    return verified?.call(successMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddVehicleViewModel viewModel)? idle,
    TResult Function(String errorMsg)? errorState,
    TResult Function(String successMsg)? success,
    TResult Function(String successMsg)? verified,
    TResult Function(String successMsg)? loading,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(successMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Loading value) loading,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Loading value)? loading,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_SuccessState value)? success,
    TResult Function(_Verified value)? verified,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class _Verified implements AddVehicleState {
  const factory _Verified(final String successMsg) = _$VerifiedImpl;

  String get successMsg;

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String successMsg});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AddVehicleStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successMsg = null,
  }) {
    return _then(_$LoadingImpl(
      null == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.successMsg);

  @override
  final String successMsg;

  @override
  String toString() {
    return 'AddVehicleState.loading(successMsg: $successMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, successMsg);

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddVehicleViewModel viewModel) idle,
    required TResult Function(String errorMsg) errorState,
    required TResult Function(String successMsg) success,
    required TResult Function(String successMsg) verified,
    required TResult Function(String successMsg) loading,
  }) {
    return loading(successMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddVehicleViewModel viewModel)? idle,
    TResult? Function(String errorMsg)? errorState,
    TResult? Function(String successMsg)? success,
    TResult? Function(String successMsg)? verified,
    TResult? Function(String successMsg)? loading,
  }) {
    return loading?.call(successMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddVehicleViewModel viewModel)? idle,
    TResult Function(String errorMsg)? errorState,
    TResult Function(String successMsg)? success,
    TResult Function(String successMsg)? verified,
    TResult Function(String successMsg)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(successMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) errorState,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? errorState,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? errorState,
    TResult Function(_SuccessState value)? success,
    TResult Function(_Verified value)? verified,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AddVehicleState {
  const factory _Loading(final String successMsg) = _$LoadingImpl;

  String get successMsg;

  /// Create a copy of AddVehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddVehicleViewModel {
  AddVehicleStep get step => throw _privateConstructorUsedError;
  String get imeiNumber => throw _privateConstructorUsedError;
  String get vehicleName => throw _privateConstructorUsedError;
  String get simNumber => throw _privateConstructorUsedError;
  String get vehicleModel => throw _privateConstructorUsedError;
  int get vehicleType => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of AddVehicleViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddVehicleViewModelCopyWith<AddVehicleViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddVehicleViewModelCopyWith<$Res> {
  factory $AddVehicleViewModelCopyWith(
          AddVehicleViewModel value, $Res Function(AddVehicleViewModel) then) =
      _$AddVehicleViewModelCopyWithImpl<$Res, AddVehicleViewModel>;
  @useResult
  $Res call(
      {AddVehicleStep step,
      String imeiNumber,
      String vehicleName,
      String simNumber,
      String vehicleModel,
      int vehicleType,
      bool isLoading});
}

/// @nodoc
class _$AddVehicleViewModelCopyWithImpl<$Res, $Val extends AddVehicleViewModel>
    implements $AddVehicleViewModelCopyWith<$Res> {
  _$AddVehicleViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddVehicleViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? imeiNumber = null,
    Object? vehicleName = null,
    Object? simNumber = null,
    Object? vehicleModel = null,
    Object? vehicleType = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AddVehicleStep,
      imeiNumber: null == imeiNumber
          ? _value.imeiNumber
          : imeiNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      simNumber: null == simNumber
          ? _value.simNumber
          : simNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddVehicleViewModelImplCopyWith<$Res>
    implements $AddVehicleViewModelCopyWith<$Res> {
  factory _$$AddVehicleViewModelImplCopyWith(_$AddVehicleViewModelImpl value,
          $Res Function(_$AddVehicleViewModelImpl) then) =
      __$$AddVehicleViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddVehicleStep step,
      String imeiNumber,
      String vehicleName,
      String simNumber,
      String vehicleModel,
      int vehicleType,
      bool isLoading});
}

/// @nodoc
class __$$AddVehicleViewModelImplCopyWithImpl<$Res>
    extends _$AddVehicleViewModelCopyWithImpl<$Res, _$AddVehicleViewModelImpl>
    implements _$$AddVehicleViewModelImplCopyWith<$Res> {
  __$$AddVehicleViewModelImplCopyWithImpl(_$AddVehicleViewModelImpl _value,
      $Res Function(_$AddVehicleViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddVehicleViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? imeiNumber = null,
    Object? vehicleName = null,
    Object? simNumber = null,
    Object? vehicleModel = null,
    Object? vehicleType = null,
    Object? isLoading = null,
  }) {
    return _then(_$AddVehicleViewModelImpl(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AddVehicleStep,
      imeiNumber: null == imeiNumber
          ? _value.imeiNumber
          : imeiNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      simNumber: null == simNumber
          ? _value.simNumber
          : simNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddVehicleViewModelImpl implements _AddVehicleViewModel {
  const _$AddVehicleViewModelImpl(
      {required this.step,
      required this.imeiNumber,
      required this.vehicleName,
      required this.simNumber,
      required this.vehicleModel,
      required this.vehicleType,
      this.isLoading = false});

  @override
  final AddVehicleStep step;
  @override
  final String imeiNumber;
  @override
  final String vehicleName;
  @override
  final String simNumber;
  @override
  final String vehicleModel;
  @override
  final int vehicleType;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AddVehicleViewModel(step: $step, imeiNumber: $imeiNumber, vehicleName: $vehicleName, simNumber: $simNumber, vehicleModel: $vehicleModel, vehicleType: $vehicleType, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddVehicleViewModelImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.imeiNumber, imeiNumber) ||
                other.imeiNumber == imeiNumber) &&
            (identical(other.vehicleName, vehicleName) ||
                other.vehicleName == vehicleName) &&
            (identical(other.simNumber, simNumber) ||
                other.simNumber == simNumber) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step, imeiNumber, vehicleName,
      simNumber, vehicleModel, vehicleType, isLoading);

  /// Create a copy of AddVehicleViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddVehicleViewModelImplCopyWith<_$AddVehicleViewModelImpl> get copyWith =>
      __$$AddVehicleViewModelImplCopyWithImpl<_$AddVehicleViewModelImpl>(
          this, _$identity);
}

abstract class _AddVehicleViewModel implements AddVehicleViewModel {
  const factory _AddVehicleViewModel(
      {required final AddVehicleStep step,
      required final String imeiNumber,
      required final String vehicleName,
      required final String simNumber,
      required final String vehicleModel,
      required final int vehicleType,
      final bool isLoading}) = _$AddVehicleViewModelImpl;

  @override
  AddVehicleStep get step;
  @override
  String get imeiNumber;
  @override
  String get vehicleName;
  @override
  String get simNumber;
  @override
  String get vehicleModel;
  @override
  int get vehicleType;
  @override
  bool get isLoading;

  /// Create a copy of AddVehicleViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddVehicleViewModelImplCopyWith<_$AddVehicleViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
