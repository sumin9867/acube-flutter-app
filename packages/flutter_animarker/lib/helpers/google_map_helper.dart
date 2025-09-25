// Package imports:
import 'dart:async';

import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

class GoogleMapHelper {
  // static Future<void> updateMarkers(
  //     int mapId, Set<Marker> previous, Set<Marker> current) async {
  //   var markerUpdates = MarkerUpdates.from(previous, current);
  //   await GoogleMapsFlutterPlatform.instance
  //       .updateMarkers(markerUpdates, mapId: mapId);
  // }

static Completer<void>? _updateCompleter;

static bool _areMarkerSetsEqual(Set<Marker> previous, Set<Marker> current) {
  if (previous.length != current.length) return false;
  for (var marker in current) {
    var previousMarker = previous.firstWhere(
      (m) => m.markerId == marker.markerId,
      orElse: () => Marker(markerId: const MarkerId('')),
    );
    if (previousMarker.markerId.value.isEmpty ||
        previousMarker.position != marker.position) {
      return false;
    }
  }
  return true;
}

static Future<void> updateMarkers(
    int mapId, Set<Marker> previous, Set<Marker> current) async {
  if (_updateCompleter != null) {
    await _updateCompleter!.future; // Wait for the previous update to complete
  }
  _updateCompleter = Completer<void>();
  if (!_areMarkerSetsEqual(previous, current)) {
    var markerUpdates = MarkerUpdates.from(previous, current);
    await GoogleMapsFlutterPlatform.instance
        .updateMarkers(markerUpdates, mapId: mapId);
  }
  _updateCompleter?.complete();
  _updateCompleter = null;
}


  static Future<void> updateCircles(
      int mapId, Set<Circle> previous, Set<Circle> current) async {
    var circleUpdates = CircleUpdates.from(previous, current);
    await GoogleMapsFlutterPlatform.instance
        .updateCircles(circleUpdates, mapId: mapId);
  }

  static LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (var value in list) {
      if (x0 == null) {
        x0 = x1 = value.latitude;
        y0 = y1 = value.longitude;
      } else {
        if (value.latitude > x1!) x1 = value.latitude;
        if (value.latitude < x0) x0 = value.latitude;
        if (value.longitude > y1!) y1 = value.longitude;
        if (value.longitude < y0!) y0 = value.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }


}
