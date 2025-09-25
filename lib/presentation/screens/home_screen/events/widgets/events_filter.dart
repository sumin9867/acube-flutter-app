import 'package:flutter/material.dart';

class EventsFilter {
  static const filters = ['All', 'Overspeed', 'Geofence', 'Other'];
  static const defaultTypes = [
    'ignitionOn',
    'ignitionOff',
    'geofenceEnter',
    'geofenceExit',
    'deviceOverspeed',
    'deviceStopped',
    'commandResult',
    'alarm'
  ];

  static List<String> getTypesForFilter(String filter) {
    switch (filter) {
      case 'Overspeed':
        return ['deviceOverspeed'];
      case 'Geofence':
        return ['geofenceEnter', 'geofenceExit'];
      case 'Other':
        return ['alarm', 'ignitionOn', 'ignitionOff'];

      case 'All':
      default:
        return defaultTypes;
    }
  }

  static const icons = [Icons.widgets, Icons.speed, Icons.shield, Icons.more_horiz];
}
