import 'package:freezed_annotation/freezed_annotation.dart';

part 'geofence_model.freezed.dart';
part 'geofence_model.g.dart';

@freezed
class GeofenceModel with _$GeofenceModel {
  const factory GeofenceModel({
    int? id,
    int? calendarId,
    String? name,
    String? description,
    Map<String, dynamic>? attributes,
    String? area,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool isSelected,
  }) = _GeofenceModel;

  factory GeofenceModel.fromJson(Map<String, dynamic> json) =>
      _$GeofenceModelFromJson(json);
}
