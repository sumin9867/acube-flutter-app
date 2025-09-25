// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentLocationButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback for button press
  final double bottomPosition; // Bottom position relative to screen size
  final double endPosition; // End position relative to screen size

  const CurrentLocationButton({
    super.key,
    required this.onPressed,
    required this.bottomPosition,
    required this.endPosition,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: endPosition,
      bottom: bottomPosition,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            minimumSize: const Size(50, 50),
            backgroundColor: Colors.white,
            elevation: 6,
            shadowColor: Colors.black54,
          ),
          onPressed: onPressed,
          child: SvgPicture.asset(
            'assets/icons/vehicle_geofence/my_location.svg',
            color: const Color.fromARGB(255, 132, 132, 132),
            height: 26,
            width: 26,
          ),
        ),
      ),
    );
  }
}

class ToggleMapButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback for button press
  final double bottomPosition; // Bottom position relative to screen size
  final double startPosition; // End position relative to screen size

  const ToggleMapButton({
    super.key,
    required this.onPressed,
    required this.bottomPosition,
    required this.startPosition,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: startPosition,
      bottom: bottomPosition,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            minimumSize: const Size(50, 50),
            backgroundColor: Colors.white,
            elevation: 6,
            shadowColor: Colors.black54,
          ),
          onPressed: onPressed,
          child: SvgPicture.asset(
            'assets/icons/playback/layer.svg',
            color: const Color.fromARGB(255, 132, 132, 132),
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}
