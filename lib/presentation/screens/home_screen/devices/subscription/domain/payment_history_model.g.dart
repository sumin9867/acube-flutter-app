// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentHistoryModelImpl _$$PaymentHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentHistoryModelImpl(
      deviceId: json['deviceId'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      method: json['method'] as String,
      $id: json[r'$id'] as String,
      $createdAt: json[r'$createdAt'] as String,
      durationInfo:
          DurationInfo.fromJson(json['durationInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentHistoryModelImplToJson(
        _$PaymentHistoryModelImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'amount': instance.amount,
      'status': instance.status,
      'method': instance.method,
      r'$id': instance.$id,
      r'$createdAt': instance.$createdAt,
      'durationInfo': instance.durationInfo,
    };

_$DurationInfoImpl _$$DurationInfoImplFromJson(Map<String, dynamic> json) =>
    _$DurationInfoImpl(
      duration: (json['duration'] as num).toInt(),
      durationUnit: json['duration_unit'] as String,
      bonusDays: (json['bonus_days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DurationInfoImplToJson(_$DurationInfoImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'duration_unit': instance.durationUnit,
      'bonus_days': instance.bonusDays,
    };
