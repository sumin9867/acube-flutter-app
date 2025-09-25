import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_list.freezed.dart';
part 'notification_list.g.dart';

@freezed
class Notificaionlist with _$Notificaionlist {
  factory Notificaionlist({
    required int id,
    Attributes? attributes,
    int? calendarId,
    bool? always,
    String? type,
    String? notificators,
  }) = _Notificaionlist;

  factory Notificaionlist.fromJson(Map<String, dynamic> json) =>
      _$NotificaionlistFromJson(json);
}

@freezed
class Attributes with _$Attributes {
  factory Attributes() = _Attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}
