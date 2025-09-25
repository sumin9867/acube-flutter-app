import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'point_object.freezed.dart';

@freezed
class PointObject with _$PointObject {
  const factory PointObject({
    Widget? child,
    LatLng? location,
  }) = _PointObject;
}
