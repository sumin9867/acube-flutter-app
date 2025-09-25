// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_event_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SingleEventState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VehicleEvent> events, bool hasMore) idle,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<PositionModel> coordinates)
        coordinatesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<PositionModel> coordinates)? coordinatesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult Function(String errorMsg)? error,
    TResult Function(List<PositionModel> coordinates)? coordinatesLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_CoordinatesLoaded value) coordinatesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_CoordinatesLoaded value)? coordinatesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? error,
    TResult Function(_CoordinatesLoaded value)? coordinatesLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleEventStateCopyWith<$Res> {
  factory $SingleEventStateCopyWith(
          SingleEventState value, $Res Function(SingleEventState) then) =
      _$SingleEventStateCopyWithImpl<$Res, SingleEventState>;
}

/// @nodoc
class _$SingleEventStateCopyWithImpl<$Res, $Val extends SingleEventState>
    implements $SingleEventStateCopyWith<$Res> {
  _$SingleEventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleEventState
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
    extends _$SingleEventStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SingleEventState.initial()';
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
    required TResult Function() loading,
    required TResult Function(List<VehicleEvent> events, bool hasMore) idle,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<PositionModel> coordinates)
        coordinatesLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<PositionModel> coordinates)? coordinatesLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult Function(String errorMsg)? error,
    TResult Function(List<PositionModel> coordinates)? coordinatesLoaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_CoordinatesLoaded value) coordinatesLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_CoordinatesLoaded value)? coordinatesLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? error,
    TResult Function(_CoordinatesLoaded value)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SingleEventState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SingleEventStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SingleEventState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VehicleEvent> events, bool hasMore) idle,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<PositionModel> coordinates)
        coordinatesLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<PositionModel> coordinates)? coordinatesLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult Function(String errorMsg)? error,
    TResult Function(List<PositionModel> coordinates)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_CoordinatesLoaded value) coordinatesLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_CoordinatesLoaded value)? coordinatesLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? error,
    TResult Function(_CoordinatesLoaded value)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SingleEventState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$IdleStateImplCopyWith<$Res> {
  factory _$$IdleStateImplCopyWith(
          _$IdleStateImpl value, $Res Function(_$IdleStateImpl) then) =
      __$$IdleStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<VehicleEvent> events, bool hasMore});
}

/// @nodoc
class __$$IdleStateImplCopyWithImpl<$Res>
    extends _$SingleEventStateCopyWithImpl<$Res, _$IdleStateImpl>
    implements _$$IdleStateImplCopyWith<$Res> {
  __$$IdleStateImplCopyWithImpl(
      _$IdleStateImpl _value, $Res Function(_$IdleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? hasMore = null,
  }) {
    return _then(_$IdleStateImpl(
      null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<VehicleEvent>,
      null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IdleStateImpl implements _IdleState {
  const _$IdleStateImpl(final List<VehicleEvent> events, this.hasMore)
      : _events = events;

  final List<VehicleEvent> _events;
  @override
  List<VehicleEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final bool hasMore;

  @override
  String toString() {
    return 'SingleEventState.idle(events: $events, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_events), hasMore);

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleStateImplCopyWith<_$IdleStateImpl> get copyWith =>
      __$$IdleStateImplCopyWithImpl<_$IdleStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VehicleEvent> events, bool hasMore) idle,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<PositionModel> coordinates)
        coordinatesLoaded,
  }) {
    return idle(events, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<PositionModel> coordinates)? coordinatesLoaded,
  }) {
    return idle?.call(events, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult Function(String errorMsg)? error,
    TResult Function(List<PositionModel> coordinates)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(events, hasMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_CoordinatesLoaded value) coordinatesLoaded,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_CoordinatesLoaded value)? coordinatesLoaded,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? error,
    TResult Function(_CoordinatesLoaded value)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleState implements SingleEventState {
  const factory _IdleState(
      final List<VehicleEvent> events, final bool hasMore) = _$IdleStateImpl;

  List<VehicleEvent> get events;
  bool get hasMore;

  /// Create a copy of SingleEventState
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
    extends _$SingleEventStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleEventState
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
    return 'SingleEventState.error(errorMsg: $errorMsg)';
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

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VehicleEvent> events, bool hasMore) idle,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<PositionModel> coordinates)
        coordinatesLoaded,
  }) {
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<PositionModel> coordinates)? coordinatesLoaded,
  }) {
    return error?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult Function(String errorMsg)? error,
    TResult Function(List<PositionModel> coordinates)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_CoordinatesLoaded value) coordinatesLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_CoordinatesLoaded value)? coordinatesLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? error,
    TResult Function(_CoordinatesLoaded value)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements SingleEventState {
  const factory _ErrorState(final String errorMsg) = _$ErrorStateImpl;

  String get errorMsg;

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoordinatesLoadedImplCopyWith<$Res> {
  factory _$$CoordinatesLoadedImplCopyWith(_$CoordinatesLoadedImpl value,
          $Res Function(_$CoordinatesLoadedImpl) then) =
      __$$CoordinatesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PositionModel> coordinates});
}

/// @nodoc
class __$$CoordinatesLoadedImplCopyWithImpl<$Res>
    extends _$SingleEventStateCopyWithImpl<$Res, _$CoordinatesLoadedImpl>
    implements _$$CoordinatesLoadedImplCopyWith<$Res> {
  __$$CoordinatesLoadedImplCopyWithImpl(_$CoordinatesLoadedImpl _value,
      $Res Function(_$CoordinatesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
  }) {
    return _then(_$CoordinatesLoadedImpl(
      null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<PositionModel>,
    ));
  }
}

/// @nodoc

class _$CoordinatesLoadedImpl implements _CoordinatesLoaded {
  const _$CoordinatesLoadedImpl(final List<PositionModel> coordinates)
      : _coordinates = coordinates;

  final List<PositionModel> _coordinates;
  @override
  List<PositionModel> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'SingleEventState.coordinatesLoaded(coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatesLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates));

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatesLoadedImplCopyWith<_$CoordinatesLoadedImpl> get copyWith =>
      __$$CoordinatesLoadedImplCopyWithImpl<_$CoordinatesLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<VehicleEvent> events, bool hasMore) idle,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<PositionModel> coordinates)
        coordinatesLoaded,
  }) {
    return coordinatesLoaded(coordinates);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<PositionModel> coordinates)? coordinatesLoaded,
  }) {
    return coordinatesLoaded?.call(coordinates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<VehicleEvent> events, bool hasMore)? idle,
    TResult Function(String errorMsg)? error,
    TResult Function(List<PositionModel> coordinates)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (coordinatesLoaded != null) {
      return coordinatesLoaded(coordinates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_IdleState value) idle,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_CoordinatesLoaded value) coordinatesLoaded,
  }) {
    return coordinatesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_IdleState value)? idle,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_CoordinatesLoaded value)? coordinatesLoaded,
  }) {
    return coordinatesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_IdleState value)? idle,
    TResult Function(_ErrorState value)? error,
    TResult Function(_CoordinatesLoaded value)? coordinatesLoaded,
    required TResult orElse(),
  }) {
    if (coordinatesLoaded != null) {
      return coordinatesLoaded(this);
    }
    return orElse();
  }
}

abstract class _CoordinatesLoaded implements SingleEventState {
  const factory _CoordinatesLoaded(final List<PositionModel> coordinates) =
      _$CoordinatesLoadedImpl;

  List<PositionModel> get coordinates;

  /// Create a copy of SingleEventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordinatesLoadedImplCopyWith<_$CoordinatesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
