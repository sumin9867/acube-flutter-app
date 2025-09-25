import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    String? login,
    String? email,
    String? phone,
    bool? readonly,
    bool? administrator,
    String? map,
    double? latitude,
    double? longitude,
    int? zoom,
    bool? twelveHourFormat,
    String? coordinateFormat,
    bool? disabled,
    String? expirationTime,
    int? deviceLimit,
    int? userLimit,
    bool? deviceReadonly,
    String? token,
    bool? limitCommands,
    bool? disableReports,
    String? poiLayer,
    String? password,
    String? avatarUrl,
    Map<String, dynamic>? attributes,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
