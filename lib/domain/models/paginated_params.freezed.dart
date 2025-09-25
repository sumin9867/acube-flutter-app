// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedParams _$PaginatedParamsFromJson(Map<String, dynamic> json) {
  return _PaginatedParams.fromJson(json);
}

/// @nodoc
mixin _$PaginatedParams {
  @JsonKey(name: 'per_page')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get pageNumber => throw _privateConstructorUsedError;

  /// Serializes this PaginatedParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedParamsCopyWith<PaginatedParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedParamsCopyWith<$Res> {
  factory $PaginatedParamsCopyWith(
          PaginatedParams value, $Res Function(PaginatedParams) then) =
      _$PaginatedParamsCopyWithImpl<$Res, PaginatedParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'per_page') int pageSize,
      @JsonKey(name: 'current_page') int pageNumber});
}

/// @nodoc
class _$PaginatedParamsCopyWithImpl<$Res, $Val extends PaginatedParams>
    implements $PaginatedParamsCopyWith<$Res> {
  _$PaginatedParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? pageNumber = null,
  }) {
    return _then(_value.copyWith(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedParamsImplCopyWith<$Res>
    implements $PaginatedParamsCopyWith<$Res> {
  factory _$$PaginatedParamsImplCopyWith(_$PaginatedParamsImpl value,
          $Res Function(_$PaginatedParamsImpl) then) =
      __$$PaginatedParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'per_page') int pageSize,
      @JsonKey(name: 'current_page') int pageNumber});
}

/// @nodoc
class __$$PaginatedParamsImplCopyWithImpl<$Res>
    extends _$PaginatedParamsCopyWithImpl<$Res, _$PaginatedParamsImpl>
    implements _$$PaginatedParamsImplCopyWith<$Res> {
  __$$PaginatedParamsImplCopyWithImpl(
      _$PaginatedParamsImpl _value, $Res Function(_$PaginatedParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? pageNumber = null,
  }) {
    return _then(_$PaginatedParamsImpl(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedParamsImpl extends _PaginatedParams {
  _$PaginatedParamsImpl(
      {@JsonKey(name: 'per_page') required this.pageSize,
      @JsonKey(name: 'current_page') required this.pageNumber})
      : super._();

  factory _$PaginatedParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedParamsImplFromJson(json);

  @override
  @JsonKey(name: 'per_page')
  final int pageSize;
  @override
  @JsonKey(name: 'current_page')
  final int pageNumber;

  @override
  String toString() {
    return 'PaginatedParams(pageSize: $pageSize, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedParamsImpl &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageSize, pageNumber);

  /// Create a copy of PaginatedParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedParamsImplCopyWith<_$PaginatedParamsImpl> get copyWith =>
      __$$PaginatedParamsImplCopyWithImpl<_$PaginatedParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedParamsImplToJson(
      this,
    );
  }
}

abstract class _PaginatedParams extends PaginatedParams {
  factory _PaginatedParams(
          {@JsonKey(name: 'per_page') required final int pageSize,
          @JsonKey(name: 'current_page') required final int pageNumber}) =
      _$PaginatedParamsImpl;
  _PaginatedParams._() : super._();

  factory _PaginatedParams.fromJson(Map<String, dynamic> json) =
      _$PaginatedParamsImpl.fromJson;

  @override
  @JsonKey(name: 'per_page')
  int get pageSize;
  @override
  @JsonKey(name: 'current_page')
  int get pageNumber;

  /// Create a copy of PaginatedParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedParamsImplCopyWith<_$PaginatedParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
