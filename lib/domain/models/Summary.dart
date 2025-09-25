// ignore_for_file: file_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';

part 'Summary.freezed.dart';
part 'Summary.g.dart';

@freezed
class Summary with _$Summary {
  const Summary._();

  const factory Summary({
    int? deviceId,
    String? deviceName,
    @JsonKey(name: 'distance') double? distanceInMeter,
    @JsonKey(name: 'averageSpeed') double? averageSpeedInKnots,
    double? maxSpeed,
    double? spentFuel,
    double? startOdometer,
    double? endOdometer,
    @JsonKey(name: 'engineHours') int? engineHoursInMilliSec,
    DateTime? startTime,
    DateTime? endTime,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    int? stopCount,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    Duration? stopDuration,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    int? tripCount,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    Duration? tripDuration,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  // Getter for distance in kilometers
  double? get distanceInKm => distanceInMeter != null
      ? double.parse(AppHelper.meterToKm(distanceInMeter!))
      : null;

  double? get averageSpeedInKm => averageSpeedInKnots != null
      ? AppHelper.knotsToKmph(averageSpeedInKnots!)
      : null;

  Duration? get engineHours => engineHoursInMilliSec != null
      ? Duration(milliseconds: engineHoursInMilliSec!)
      : null;
}
