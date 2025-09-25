// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  int get id => throw _privateConstructorUsedError;
  DeviceAttribute? get attributes => throw _privateConstructorUsedError;
  int get groupId => throw _privateConstructorUsedError;
  String get uniqueId => throw _privateConstructorUsedError;
  DeviceStatus get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get lastUpdate => throw _privateConstructorUsedError;
  int get positionId => throw _privateConstructorUsedError;
  List<dynamic>? get geofenceIds => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get contact => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;
  DateTime? get expirationTime => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  PositionModel? get position => throw _privateConstructorUsedError;

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call(
      {int id,
      DeviceAttribute? attributes,
      int groupId,
      String uniqueId,
      DeviceStatus status,
      String name,
      DateTime? lastUpdate,
      int positionId,
      List<dynamic>? geofenceIds,
      String? phone,
      String? model,
      String? contact,
      String? category,
      bool disabled,
      DateTime? expirationTime,
      String? photo,
      PositionModel? position});

  $DeviceAttributeCopyWith<$Res>? get attributes;
  $PositionModelCopyWith<$Res>? get position;
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = freezed,
    Object? groupId = null,
    Object? uniqueId = null,
    Object? status = null,
    Object? name = null,
    Object? lastUpdate = freezed,
    Object? positionId = null,
    Object? geofenceIds = freezed,
    Object? phone = freezed,
    Object? model = freezed,
    Object? contact = freezed,
    Object? category = freezed,
    Object? disabled = null,
    Object? expirationTime = freezed,
    Object? photo = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as DeviceAttribute?,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStatus,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      positionId: null == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      geofenceIds: freezed == geofenceIds
          ? _value.geofenceIds
          : geofenceIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      expirationTime: freezed == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
    ) as $Val);
  }

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceAttributeCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $DeviceAttributeCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionModelCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $PositionModelCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
          _$DeviceImpl value, $Res Function(_$DeviceImpl) then) =
      __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DeviceAttribute? attributes,
      int groupId,
      String uniqueId,
      DeviceStatus status,
      String name,
      DateTime? lastUpdate,
      int positionId,
      List<dynamic>? geofenceIds,
      String? phone,
      String? model,
      String? contact,
      String? category,
      bool disabled,
      DateTime? expirationTime,
      String? photo,
      PositionModel? position});

  @override
  $DeviceAttributeCopyWith<$Res>? get attributes;
  @override
  $PositionModelCopyWith<$Res>? get position;
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
      _$DeviceImpl _value, $Res Function(_$DeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = freezed,
    Object? groupId = null,
    Object? uniqueId = null,
    Object? status = null,
    Object? name = null,
    Object? lastUpdate = freezed,
    Object? positionId = null,
    Object? geofenceIds = freezed,
    Object? phone = freezed,
    Object? model = freezed,
    Object? contact = freezed,
    Object? category = freezed,
    Object? disabled = null,
    Object? expirationTime = freezed,
    Object? photo = freezed,
    Object? position = freezed,
  }) {
    return _then(_$DeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as DeviceAttribute?,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStatus,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      positionId: null == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      geofenceIds: freezed == geofenceIds
          ? _value._geofenceIds
          : geofenceIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      expirationTime: freezed == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceImpl implements _Device {
  const _$DeviceImpl(
      {required this.id,
      required this.attributes,
      required this.groupId,
      required this.uniqueId,
      required this.status,
      required this.name,
      this.lastUpdate,
      required this.positionId,
      final List<dynamic>? geofenceIds,
      this.phone,
      this.model,
      this.contact,
      this.category,
      required this.disabled,
      this.expirationTime,
      this.photo,
      this.position})
      : _geofenceIds = geofenceIds;

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  @override
  final int id;
  @override
  final DeviceAttribute? attributes;
  @override
  final int groupId;
  @override
  final String uniqueId;
  @override
  final DeviceStatus status;
  @override
  final String name;
  @override
  final DateTime? lastUpdate;
  @override
  final int positionId;
  final List<dynamic>? _geofenceIds;
  @override
  List<dynamic>? get geofenceIds {
    final value = _geofenceIds;
    if (value == null) return null;
    if (_geofenceIds is EqualUnmodifiableListView) return _geofenceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? phone;
  @override
  final String? model;
  @override
  final String? contact;
  @override
  final String? category;
  @override
  final bool disabled;
  @override
  final DateTime? expirationTime;
  @override
  final String? photo;
  @override
  final PositionModel? position;

  @override
  String toString() {
    return 'Device(id: $id, attributes: $attributes, groupId: $groupId, uniqueId: $uniqueId, status: $status, name: $name, lastUpdate: $lastUpdate, positionId: $positionId, geofenceIds: $geofenceIds, phone: $phone, model: $model, contact: $contact, category: $category, disabled: $disabled, expirationTime: $expirationTime, photo: $photo, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            const DeepCollectionEquality()
                .equals(other._geofenceIds, _geofenceIds) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.expirationTime, expirationTime) ||
                other.expirationTime == expirationTime) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      attributes,
      groupId,
      uniqueId,
      status,
      name,
      lastUpdate,
      positionId,
      const DeepCollectionEquality().hash(_geofenceIds),
      phone,
      model,
      contact,
      category,
      disabled,
      expirationTime,
      photo,
      position);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceImplToJson(
      this,
    );
  }
}

abstract class _Device implements Device {
  const factory _Device(
      {required final int id,
      required final DeviceAttribute? attributes,
      required final int groupId,
      required final String uniqueId,
      required final DeviceStatus status,
      required final String name,
      final DateTime? lastUpdate,
      required final int positionId,
      final List<dynamic>? geofenceIds,
      final String? phone,
      final String? model,
      final String? contact,
      final String? category,
      required final bool disabled,
      final DateTime? expirationTime,
      final String? photo,
      final PositionModel? position}) = _$DeviceImpl;

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override
  int get id;
  @override
  DeviceAttribute? get attributes;
  @override
  int get groupId;
  @override
  String get uniqueId;
  @override
  DeviceStatus get status;
  @override
  String get name;
  @override
  DateTime? get lastUpdate;
  @override
  int get positionId;
  @override
  List<dynamic>? get geofenceIds;
  @override
  String? get phone;
  @override
  String? get model;
  @override
  String? get contact;
  @override
  String? get category;
  @override
  bool get disabled;
  @override
  DateTime? get expirationTime;
  @override
  String? get photo;
  @override
  PositionModel? get position;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddDeviceRequest _$AddDeviceRequestFromJson(Map<String, dynamic> json) {
  return _AddDeviceRequest.fromJson(json);
}

/// @nodoc
mixin _$AddDeviceRequest {
  String get name => throw _privateConstructorUsedError;
  String get uniqueId => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  Attributes get attributes => throw _privateConstructorUsedError;

  /// Serializes this AddDeviceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDeviceRequestCopyWith<AddDeviceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeviceRequestCopyWith<$Res> {
  factory $AddDeviceRequestCopyWith(
          AddDeviceRequest value, $Res Function(AddDeviceRequest) then) =
      _$AddDeviceRequestCopyWithImpl<$Res, AddDeviceRequest>;
  @useResult
  $Res call(
      {String name,
      String uniqueId,
      String phone,
      String model,
      String contact,
      String category,
      Attributes attributes});

  $AttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class _$AddDeviceRequestCopyWithImpl<$Res, $Val extends AddDeviceRequest>
    implements $AddDeviceRequestCopyWith<$Res> {
  _$AddDeviceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uniqueId = null,
    Object? phone = null,
    Object? model = null,
    Object? contact = null,
    Object? category = null,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes,
    ) as $Val);
  }

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res> get attributes {
    return $AttributesCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddDeviceRequestImplCopyWith<$Res>
    implements $AddDeviceRequestCopyWith<$Res> {
  factory _$$AddDeviceRequestImplCopyWith(_$AddDeviceRequestImpl value,
          $Res Function(_$AddDeviceRequestImpl) then) =
      __$$AddDeviceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String uniqueId,
      String phone,
      String model,
      String contact,
      String category,
      Attributes attributes});

  @override
  $AttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$AddDeviceRequestImplCopyWithImpl<$Res>
    extends _$AddDeviceRequestCopyWithImpl<$Res, _$AddDeviceRequestImpl>
    implements _$$AddDeviceRequestImplCopyWith<$Res> {
  __$$AddDeviceRequestImplCopyWithImpl(_$AddDeviceRequestImpl _value,
      $Res Function(_$AddDeviceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uniqueId = null,
    Object? phone = null,
    Object? model = null,
    Object? contact = null,
    Object? category = null,
    Object? attributes = null,
  }) {
    return _then(_$AddDeviceRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDeviceRequestImpl implements _AddDeviceRequest {
  const _$AddDeviceRequestImpl(
      {required this.name,
      required this.uniqueId,
      required this.phone,
      required this.model,
      required this.contact,
      required this.category,
      required this.attributes});

  factory _$AddDeviceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDeviceRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String uniqueId;
  @override
  final String phone;
  @override
  final String model;
  @override
  final String contact;
  @override
  final String category;
  @override
  final Attributes attributes;

  @override
  String toString() {
    return 'AddDeviceRequest(name: $name, uniqueId: $uniqueId, phone: $phone, model: $model, contact: $contact, category: $category, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDeviceRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, uniqueId, phone, model, contact, category, attributes);

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDeviceRequestImplCopyWith<_$AddDeviceRequestImpl> get copyWith =>
      __$$AddDeviceRequestImplCopyWithImpl<_$AddDeviceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDeviceRequestImplToJson(
      this,
    );
  }
}

abstract class _AddDeviceRequest implements AddDeviceRequest {
  const factory _AddDeviceRequest(
      {required final String name,
      required final String uniqueId,
      required final String phone,
      required final String model,
      required final String contact,
      required final String category,
      required final Attributes attributes}) = _$AddDeviceRequestImpl;

  factory _AddDeviceRequest.fromJson(Map<String, dynamic> json) =
      _$AddDeviceRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get uniqueId;
  @override
  String get phone;
  @override
  String get model;
  @override
  String get contact;
  @override
  String get category;
  @override
  Attributes get attributes;

  /// Create a copy of AddDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDeviceRequestImplCopyWith<_$AddDeviceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return _Attributes.fromJson(json);
}

/// @nodoc
mixin _$Attributes {
  String get registration => throw _privateConstructorUsedError;

  /// Serializes this Attributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttributesCopyWith<Attributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributesCopyWith<$Res> {
  factory $AttributesCopyWith(
          Attributes value, $Res Function(Attributes) then) =
      _$AttributesCopyWithImpl<$Res, Attributes>;
  @useResult
  $Res call({String registration});
}

/// @nodoc
class _$AttributesCopyWithImpl<$Res, $Val extends Attributes>
    implements $AttributesCopyWith<$Res> {
  _$AttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registration = null,
  }) {
    return _then(_value.copyWith(
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttributesImplCopyWith<$Res>
    implements $AttributesCopyWith<$Res> {
  factory _$$AttributesImplCopyWith(
          _$AttributesImpl value, $Res Function(_$AttributesImpl) then) =
      __$$AttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String registration});
}

/// @nodoc
class __$$AttributesImplCopyWithImpl<$Res>
    extends _$AttributesCopyWithImpl<$Res, _$AttributesImpl>
    implements _$$AttributesImplCopyWith<$Res> {
  __$$AttributesImplCopyWithImpl(
      _$AttributesImpl _value, $Res Function(_$AttributesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registration = null,
  }) {
    return _then(_$AttributesImpl(
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttributesImpl implements _Attributes {
  const _$AttributesImpl({required this.registration});

  factory _$AttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributesImplFromJson(json);

  @override
  final String registration;

  @override
  String toString() {
    return 'Attributes(registration: $registration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributesImpl &&
            (identical(other.registration, registration) ||
                other.registration == registration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, registration);

  /// Create a copy of Attributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributesImplCopyWith<_$AttributesImpl> get copyWith =>
      __$$AttributesImplCopyWithImpl<_$AttributesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributesImplToJson(
      this,
    );
  }
}

abstract class _Attributes implements Attributes {
  const factory _Attributes({required final String registration}) =
      _$AttributesImpl;

  factory _Attributes.fromJson(Map<String, dynamic> json) =
      _$AttributesImpl.fromJson;

  @override
  String get registration;

  /// Create a copy of Attributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttributesImplCopyWith<_$AttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceAttribute _$DeviceAttributeFromJson(Map<String, dynamic> json) {
  return _DeviceAttribute.fromJson(json);
}

/// @nodoc
mixin _$DeviceAttribute {
  int? get sat => throw _privateConstructorUsedError;
  bool? get ignition => throw _privateConstructorUsedError;
  int? get event => throw _privateConstructorUsedError;
  bool? get archive => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  double? get totalDistance => throw _privateConstructorUsedError;
  String? get ip => throw _privateConstructorUsedError;
  bool? get motion => throw _privateConstructorUsedError;
  bool? get blocked => throw _privateConstructorUsedError;
  int? get batteryLevel => throw _privateConstructorUsedError;
  int? get rssi => throw _privateConstructorUsedError;
  bool? get charge => throw _privateConstructorUsedError;
  int? get hours => throw _privateConstructorUsedError;
  String? get speedLimit => throw _privateConstructorUsedError;

  /// Serializes this DeviceAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceAttributeCopyWith<DeviceAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceAttributeCopyWith<$Res> {
  factory $DeviceAttributeCopyWith(
          DeviceAttribute value, $Res Function(DeviceAttribute) then) =
      _$DeviceAttributeCopyWithImpl<$Res, DeviceAttribute>;
  @useResult
  $Res call(
      {int? sat,
      bool? ignition,
      int? event,
      bool? archive,
      double? distance,
      double? totalDistance,
      String? ip,
      bool? motion,
      bool? blocked,
      int? batteryLevel,
      int? rssi,
      bool? charge,
      int? hours,
      String? speedLimit});
}

/// @nodoc
class _$DeviceAttributeCopyWithImpl<$Res, $Val extends DeviceAttribute>
    implements $DeviceAttributeCopyWith<$Res> {
  _$DeviceAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sat = freezed,
    Object? ignition = freezed,
    Object? event = freezed,
    Object? archive = freezed,
    Object? distance = freezed,
    Object? totalDistance = freezed,
    Object? ip = freezed,
    Object? motion = freezed,
    Object? blocked = freezed,
    Object? batteryLevel = freezed,
    Object? rssi = freezed,
    Object? charge = freezed,
    Object? hours = freezed,
    Object? speedLimit = freezed,
  }) {
    return _then(_value.copyWith(
      sat: freezed == sat
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as int?,
      ignition: freezed == ignition
          ? _value.ignition
          : ignition // ignore: cast_nullable_to_non_nullable
              as bool?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as int?,
      archive: freezed == archive
          ? _value.archive
          : archive // ignore: cast_nullable_to_non_nullable
              as bool?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      motion: freezed == motion
          ? _value.motion
          : motion // ignore: cast_nullable_to_non_nullable
              as bool?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      rssi: freezed == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int?,
      charge: freezed == charge
          ? _value.charge
          : charge // ignore: cast_nullable_to_non_nullable
              as bool?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int?,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceAttributeImplCopyWith<$Res>
    implements $DeviceAttributeCopyWith<$Res> {
  factory _$$DeviceAttributeImplCopyWith(_$DeviceAttributeImpl value,
          $Res Function(_$DeviceAttributeImpl) then) =
      __$$DeviceAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? sat,
      bool? ignition,
      int? event,
      bool? archive,
      double? distance,
      double? totalDistance,
      String? ip,
      bool? motion,
      bool? blocked,
      int? batteryLevel,
      int? rssi,
      bool? charge,
      int? hours,
      String? speedLimit});
}

/// @nodoc
class __$$DeviceAttributeImplCopyWithImpl<$Res>
    extends _$DeviceAttributeCopyWithImpl<$Res, _$DeviceAttributeImpl>
    implements _$$DeviceAttributeImplCopyWith<$Res> {
  __$$DeviceAttributeImplCopyWithImpl(
      _$DeviceAttributeImpl _value, $Res Function(_$DeviceAttributeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sat = freezed,
    Object? ignition = freezed,
    Object? event = freezed,
    Object? archive = freezed,
    Object? distance = freezed,
    Object? totalDistance = freezed,
    Object? ip = freezed,
    Object? motion = freezed,
    Object? blocked = freezed,
    Object? batteryLevel = freezed,
    Object? rssi = freezed,
    Object? charge = freezed,
    Object? hours = freezed,
    Object? speedLimit = freezed,
  }) {
    return _then(_$DeviceAttributeImpl(
      sat: freezed == sat
          ? _value.sat
          : sat // ignore: cast_nullable_to_non_nullable
              as int?,
      ignition: freezed == ignition
          ? _value.ignition
          : ignition // ignore: cast_nullable_to_non_nullable
              as bool?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as int?,
      archive: freezed == archive
          ? _value.archive
          : archive // ignore: cast_nullable_to_non_nullable
              as bool?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      motion: freezed == motion
          ? _value.motion
          : motion // ignore: cast_nullable_to_non_nullable
              as bool?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      rssi: freezed == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int?,
      charge: freezed == charge
          ? _value.charge
          : charge // ignore: cast_nullable_to_non_nullable
              as bool?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int?,
      speedLimit: freezed == speedLimit
          ? _value.speedLimit
          : speedLimit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceAttributeImpl implements _DeviceAttribute {
  const _$DeviceAttributeImpl(
      {this.sat,
      this.ignition,
      this.event,
      this.archive,
      this.distance,
      this.totalDistance,
      this.ip,
      this.motion,
      this.blocked,
      this.batteryLevel,
      this.rssi,
      this.charge,
      this.hours,
      this.speedLimit});

  factory _$DeviceAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceAttributeImplFromJson(json);

  @override
  final int? sat;
  @override
  final bool? ignition;
  @override
  final int? event;
  @override
  final bool? archive;
  @override
  final double? distance;
  @override
  final double? totalDistance;
  @override
  final String? ip;
  @override
  final bool? motion;
  @override
  final bool? blocked;
  @override
  final int? batteryLevel;
  @override
  final int? rssi;
  @override
  final bool? charge;
  @override
  final int? hours;
  @override
  final String? speedLimit;

  @override
  String toString() {
    return 'DeviceAttribute(sat: $sat, ignition: $ignition, event: $event, archive: $archive, distance: $distance, totalDistance: $totalDistance, ip: $ip, motion: $motion, blocked: $blocked, batteryLevel: $batteryLevel, rssi: $rssi, charge: $charge, hours: $hours, speedLimit: $speedLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceAttributeImpl &&
            (identical(other.sat, sat) || other.sat == sat) &&
            (identical(other.ignition, ignition) ||
                other.ignition == ignition) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.archive, archive) || other.archive == archive) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.motion, motion) || other.motion == motion) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.charge, charge) || other.charge == charge) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.speedLimit, speedLimit) ||
                other.speedLimit == speedLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sat,
      ignition,
      event,
      archive,
      distance,
      totalDistance,
      ip,
      motion,
      blocked,
      batteryLevel,
      rssi,
      charge,
      hours,
      speedLimit);

  /// Create a copy of DeviceAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceAttributeImplCopyWith<_$DeviceAttributeImpl> get copyWith =>
      __$$DeviceAttributeImplCopyWithImpl<_$DeviceAttributeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceAttributeImplToJson(
      this,
    );
  }
}

abstract class _DeviceAttribute implements DeviceAttribute {
  const factory _DeviceAttribute(
      {final int? sat,
      final bool? ignition,
      final int? event,
      final bool? archive,
      final double? distance,
      final double? totalDistance,
      final String? ip,
      final bool? motion,
      final bool? blocked,
      final int? batteryLevel,
      final int? rssi,
      final bool? charge,
      final int? hours,
      final String? speedLimit}) = _$DeviceAttributeImpl;

  factory _DeviceAttribute.fromJson(Map<String, dynamic> json) =
      _$DeviceAttributeImpl.fromJson;

  @override
  int? get sat;
  @override
  bool? get ignition;
  @override
  int? get event;
  @override
  bool? get archive;
  @override
  double? get distance;
  @override
  double? get totalDistance;
  @override
  String? get ip;
  @override
  bool? get motion;
  @override
  bool? get blocked;
  @override
  int? get batteryLevel;
  @override
  int? get rssi;
  @override
  bool? get charge;
  @override
  int? get hours;
  @override
  String? get speedLimit;

  /// Create a copy of DeviceAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceAttributeImplCopyWith<_$DeviceAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
