import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_stop.freezed.dart';
part 'vehicle_stop.g.dart';

@freezed
class VehicleStop with _$VehicleStop {
  const VehicleStop._();
  const factory VehicleStop({
    required int deviceId,
    required String deviceName,
    required double distance,
    required double averageSpeed,
    required double maxSpeed,
    required double spentFuel,
    required double startOdometer,
    required double endOdometer,
    required DateTime startTime,
    required DateTime endTime,
    required int positionId,
    required double latitude,
    required double longitude,
    required String? address,
    @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
    required Duration duration,
    @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
    required Duration engineHours,
  }) = _VehicleStop;

  factory VehicleStop.fromJson(Map<String, dynamic> json) =>
      _$VehicleStopFromJson(json);
}

Duration _durationFromJson(int duration) => Duration(milliseconds: duration);
int _durationToJson(Duration duration) => duration.inMilliseconds;
