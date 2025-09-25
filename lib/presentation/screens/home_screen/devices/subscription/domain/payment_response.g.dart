// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentResponseImpl _$$PaymentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentResponseImpl(
      updatedDevice: json['UpdatedDevice'] == null
          ? null
          : UpdatedDevice.fromJson(
              json['UpdatedDevice'] as Map<String, dynamic>),
      paymentInfo: json['paymentInfo'] == null
          ? null
          : PaymentInfo.fromJson(json['paymentInfo'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PaymentResponseImplToJson(
        _$PaymentResponseImpl instance) =>
    <String, dynamic>{
      'UpdatedDevice': instance.updatedDevice,
      'paymentInfo': instance.paymentInfo,
      'message': instance.message,
    };

_$UpdatedDeviceImpl _$$UpdatedDeviceImplFromJson(Map<String, dynamic> json) =>
    _$UpdatedDeviceImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      expirationTime: json['expirationTime'] == null
          ? null
          : DateTime.parse(json['expirationTime'] as String),
    );

Map<String, dynamic> _$$UpdatedDeviceImplToJson(_$UpdatedDeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'expirationTime': instance.expirationTime?.toIso8601String(),
    };

_$PaymentInfoImpl _$$PaymentInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentInfoImpl(
      amount: (json['amount'] as num?)?.toInt(),
      status: json['status'] as String?,
      refId: json['refId'] as String?,
    );

Map<String, dynamic> _$$PaymentInfoImplToJson(_$PaymentInfoImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'status': instance.status,
      'refId': instance.refId,
    };
