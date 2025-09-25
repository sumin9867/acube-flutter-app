import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/cubit/vehicle_playback_cubit.dart';

class PlaybackSlider extends StatefulWidget {
  final Function(bool) onPlaybackStateChanged;
  final int currentPlaybackIndex;
  final int playbackSize;

  const PlaybackSlider({
    required this.onPlaybackStateChanged,
    required this.currentPlaybackIndex,
    required this.playbackSize,
    super.key,
  });

  @override
  State<PlaybackSlider> createState() => _PlaybackSliderState();
}

class _PlaybackSliderState extends State<PlaybackSlider> {
  final ValueNotifier<bool> isPlayingNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isPlayingNotifier,
      builder: (context, isPlaying, _) {
        return SliderTheme(
          data: SliderThemeData(
            trackHeight: 6.0,
            thumbShape: const ThumbWithDotShape(thumbRadius: 14.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
            activeTrackColor: const Color.fromRGBO(8, 128, 234, 1),
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: const Color.fromRGBO(8, 128, 234, 1),
          ),
          child: Slider(
            max: widget.playbackSize.toDouble(),
            value: widget.currentPlaybackIndex.toDouble(),
            onChanged: (newValue) {
              isPlayingNotifier.value = !isPlayingNotifier.value;
              widget.onPlaybackStateChanged(isPlayingNotifier.value);

              context.read<VehiclePlaybackCubit>().seekTo(newValue.toInt());
            },
          ),
        );
      },
    );
  }
}

class ThumbWithDotShape extends SliderComponentShape {
  final double thumbRadius;

  const ThumbWithDotShape({this.thumbRadius = 10.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint thumbPaint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, thumbPaint);

    final Paint dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius / 3, dotPaint);
  }
}
