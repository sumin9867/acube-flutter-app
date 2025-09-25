// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSessionImpl _$$UserSessionImplFromJson(Map<String, dynamic> json) =>
    _$UserSessionImpl(
      userId: (json['id'] as num).toInt(),
      accessToken: json['token'] as String?,
      cookie: json['cookie'] as String?,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserSessionImplToJson(_$UserSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'token': instance.accessToken,
      'cookie': instance.cookie,
      'username': instance.username,
      'password': instance.password,
    };
