import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';

part 'vehicle_trip.freezed.dart';
part 'vehicle_trip.g.dart';

@freezed
class VehicleTrip with _$VehicleTrip {
  const VehicleTrip._();
  const factory VehicleTrip({
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
    required int startPositionId,
    required int endPositionId,
    required double startLat,
    required double startLon,
    required double endLat,
    required double endLon,
    @JsonKey(defaultValue: 'Unavailable') required String startAddress,
    @JsonKey(defaultValue: 'Unavailable') required String endAddress,
    @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
    required Duration duration,
    String? driverUniqueId,
    String? driverName,
  }) = _VehicleTrip;

  double get distanceInKm => double.parse(AppHelper.meterToKm(distance));

  factory VehicleTrip.fromJson(Map<String, dynamic> json) =>
      _$VehicleTripFromJson(json);
}

Duration _durationFromJson(int duration) => Duration(milliseconds: duration);
int _durationToJson(Duration duration) => duration.inMilliseconds;
