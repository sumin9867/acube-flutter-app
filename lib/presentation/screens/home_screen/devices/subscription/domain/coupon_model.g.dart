// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponModelImpl _$$CouponModelImplFromJson(Map<String, dynamic> json) =>
    _$CouponModelImpl(
      token: json['token'] as String,
      discount: (json['discount'] as num).toInt(),
      discountType: json['discount_type'] as String,
      expirationTime: DateTime.parse(json['expirationTime'] as String),
    );

Map<String, dynamic> _$$CouponModelImplToJson(_$CouponModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'expirationTime': instance.expirationTime.toIso8601String(),
    };
