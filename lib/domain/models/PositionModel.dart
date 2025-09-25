// ignore_for_file: file_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/Device.dart';

part 'PositionModel.freezed.dart';
part 'PositionModel.g.dart';

@freezed
class PositionModel with _$PositionModel {
  @JsonSerializable(explicitToJson: true)
  const factory PositionModel({
    required int id,
    required int deviceId,
    String? type,
    required String protocol,
    required DateTime serverTime,
    required String deviceTime,
    required String fixTime,
    required bool outdated,
    required bool valid,
    required double latitude,
    required double longitude,
    required double altitude,
    required double speed,
    required double course,
    String? address,
    required double accuracy,
    required bool? blocked,
    required DeviceAttribute? attributes,
  }) = _PositionModel;

  factory PositionModel.fromJson(Map<String, dynamic> json) =>
      _$PositionModelFromJson(json);
}
