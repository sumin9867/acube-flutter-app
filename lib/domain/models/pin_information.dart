import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/domain/models/Device.dart';

part 'pin_information.freezed.dart';

@freezed
class PinInformation with _$PinInformation {
  const factory PinInformation({
    String? pinPath,
    String? avatarPath,
    String? address,
    String? updatedTime,
    LatLng? location,
    String? status,
    String? name,
    String? speed,
    Color? labelColor,
    String? batteryLevel,
    bool? ignition,
    bool? charging,
    int? deviceId,
    bool? blocked,
    String? calcTotalDist,
    Device? device,
  }) = _PinInformation;
}
