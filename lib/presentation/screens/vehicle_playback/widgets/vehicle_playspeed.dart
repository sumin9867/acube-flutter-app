import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/cubit/vehicle_playback_cubit.dart';

class PlaybackSpeedControl extends StatefulWidget {
  const PlaybackSpeedControl({super.key});

  @override
  State<PlaybackSpeedControl> createState() => _PlaybackSpeedControlState();
}

class _PlaybackSpeedControlState extends State<PlaybackSpeedControl> {
  late int playbackSpeed;
  late List<int> speedValues;
  late Map<int, String> speedLabels;

  @override
  void initState() {
    super.initState();

    // Initialize playback speeds and labels
    speedValues = [
      2500,
      2000,
      1000,
      800,
      600,
      400,
      350,
    ];
    speedLabels = {
      2500: '0.25x',
      2000: '0.5x',
      1000: '1x',
      800: '2x',
      600: '3x',
      400: '4x',
      350: '5x',
    };

    playbackSpeed = speedValues[2]; // Default to 1x
  }

  void _changeSpeed(int direction) {
    final int currentIndex = speedValues.indexOf(playbackSpeed);
    final int newIndex = (currentIndex + direction).clamp(0, speedValues.length - 1);

    setState(() {
      playbackSpeed = speedValues[newIndex];
    });

    context.read<VehiclePlaybackCubit>().setPlaybackSpeed(playbackSpeed);
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Define dynamic values based on screen size
    final double iconSize = screenWidth * 0.055;
    final double textSize = screenWidth * 0.04;
    final double paddingHorizontal = screenWidth * 0.02;
    final double paddingVertical = screenHeight * 0.005;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 241, 241, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: const Color.fromRGBO(128, 128, 128, 1), size: iconSize),
            onPressed: playbackSpeed != speedValues.first ? () => _changeSpeed(-1) : null,
          ),
          Text(
            speedLabels[playbackSpeed] ?? '${playbackSpeed}x',
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: const Color.fromRGBO(128, 128, 128, 1), size: iconSize),
            onPressed: playbackSpeed != speedValues.last ? () => _changeSpeed(1) : null,
          ),
        ],
      ),
    );
  }
}
