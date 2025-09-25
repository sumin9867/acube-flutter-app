import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapStyleHelper {
  static String mapTypeNameFromType(MapType type) {
    switch (type) {
      case MapType.normal:
        return 'simple';
      case MapType.hybrid:
        return 'classic';
      case MapType.satellite:
        return 'satellite';
      case MapType.terrain:
        return 'terrain';
      default:
        return 'normal';
    }
  }

  static MapType mapTypeFromName(String name) {
    switch (name.toLowerCase()) {
      case 'normal':
        return MapType.normal;
      case 'classic':
        return MapType.hybrid;
      case 'satellite':
        return MapType.satellite;
      case 'terrain':
        return MapType.terrain;
      default:
        return MapType.normal;
    }
  }
}
