// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VehicleFilterState {
  VehicleFilter get selectedFilter => throw _privateConstructorUsedError;
  List<DeviceCubit> get devices => throw _privateConstructorUsedError;

  /// Create a copy of VehicleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleFilterStateCopyWith<VehicleFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleFilterStateCopyWith<$Res> {
  factory $VehicleFilterStateCopyWith(
          VehicleFilterState value, $Res Function(VehicleFilterState) then) =
      _$VehicleFilterStateCopyWithImpl<$Res, VehicleFilterState>;
  @useResult
  $Res call({VehicleFilter selectedFilter, List<DeviceCubit> devices});
}

/// @nodoc
class _$VehicleFilterStateCopyWithImpl<$Res, $Val extends VehicleFilterState>
    implements $VehicleFilterStateCopyWith<$Res> {
  _$VehicleFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedFilter = null,
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as VehicleFilter,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceCubit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleFilterStateImplCopyWith<$Res>
    implements $VehicleFilterStateCopyWith<$Res> {
  factory _$$VehicleFilterStateImplCopyWith(_$VehicleFilterStateImpl value,
          $Res Function(_$VehicleFilterStateImpl) then) =
      __$$VehicleFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VehicleFilter selectedFilter, List<DeviceCubit> devices});
}

/// @nodoc
class __$$VehicleFilterStateImplCopyWithImpl<$Res>
    extends _$VehicleFilterStateCopyWithImpl<$Res, _$VehicleFilterStateImpl>
    implements _$$VehicleFilterStateImplCopyWith<$Res> {
  __$$VehicleFilterStateImplCopyWithImpl(_$VehicleFilterStateImpl _value,
      $Res Function(_$VehicleFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedFilter = null,
    Object? devices = null,
  }) {
    return _then(_$VehicleFilterStateImpl(
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as VehicleFilter,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<DeviceCubit>,
    ));
  }
}

/// @nodoc

class _$VehicleFilterStateImpl implements _VehicleFilterState {
  const _$VehicleFilterStateImpl(
      {required this.selectedFilter, required final List<DeviceCubit> devices})
      : _devices = devices;

  @override
  final VehicleFilter selectedFilter;
  final List<DeviceCubit> _devices;
  @override
  List<DeviceCubit> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'VehicleFilterState(selectedFilter: $selectedFilter, devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleFilterStateImpl &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedFilter,
      const DeepCollectionEquality().hash(_devices));

  /// Create a copy of VehicleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleFilterStateImplCopyWith<_$VehicleFilterStateImpl> get copyWith =>
      __$$VehicleFilterStateImplCopyWithImpl<_$VehicleFilterStateImpl>(
          this, _$identity);
}

abstract class _VehicleFilterState implements VehicleFilterState {
  const factory _VehicleFilterState(
      {required final VehicleFilter selectedFilter,
      required final List<DeviceCubit> devices}) = _$VehicleFilterStateImpl;

  @override
  VehicleFilter get selectedFilter;
  @override
  List<DeviceCubit> get devices;

  /// Create a copy of VehicleFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleFilterStateImplCopyWith<_$VehicleFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
