// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'khalti_init_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KhaltiInitModelImpl _$$KhaltiInitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KhaltiInitModelImpl(
      pidx: json['pidx'] as String,
      paymentUrl: json['payment_url'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      expiresIn: (json['expires_in'] as num).toInt(),
    );

Map<String, dynamic> _$$KhaltiInitModelImplToJson(
        _$KhaltiInitModelImpl instance) =>
    <String, dynamic>{
      'pidx': instance.pidx,
      'payment_url': instance.paymentUrl,
      'expires_at': instance.expiresAt.toIso8601String(),
      'expires_in': instance.expiresIn,
    };
