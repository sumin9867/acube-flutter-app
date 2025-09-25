import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_custom_speed.freezed.dart';
part 'device_custom_speed.g.dart';

@freezed
abstract class DeviceCustomSpeed with _$DeviceCustomSpeed {
  const factory DeviceCustomSpeed({
    int? id,
    String? name,
    String? uniqueId,
    Map<String, dynamic>? attributes,
    String? category,
  }) = _DeviceCustomSpeed;

  factory DeviceCustomSpeed.fromJson(Map<String, dynamic> json) => _$DeviceCustomSpeedFromJson(json);
}
