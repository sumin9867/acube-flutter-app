// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocketResponseImpl _$$SocketResponseImplFromJson(Map<String, dynamic> json) =>
    _$SocketResponseImpl(
      positions: (json['positions'] as List<dynamic>?)
          ?.map((e) => PositionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => VehicleEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SocketResponseImplToJson(
        _$SocketResponseImpl instance) =>
    <String, dynamic>{
      'positions': instance.positions,
      'devices': instance.devices,
      'events': instance.events,
    };
