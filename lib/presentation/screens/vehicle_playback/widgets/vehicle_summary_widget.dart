
import 'package:flutter/material.dart';

class TripEvent {
  final String title;
  final String subtitle;
  final String? time;
  final Widget? indicator;

  // New fields
  final String? startAddress; // Start address
  final String? stopAddress; // Stop address
  final String? tripNumber; // Trip number
  final double? distance; // Distance in kilometers or miles
  final Duration? timeDuration; // Time duration for the trip

  TripEvent({
    required this.title,
    required this.subtitle,
    this.time,
    this.indicator,
    this.startAddress,
    this.stopAddress,
    this.tripNumber,
    this.distance,
    this.timeDuration,
  });
}
