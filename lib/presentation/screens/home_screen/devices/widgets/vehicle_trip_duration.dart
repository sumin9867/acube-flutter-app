import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehicleTripDuration extends StatelessWidget {
  const VehicleTripDuration({
    super.key,
    required this.duration,
    required this.label,
  });

  final Duration duration;
  final String label;

  @override
  Widget build(BuildContext context) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/statistics/runtime.svg', height: 14, width: 14),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 16 / 12,
                  color: Color(0xFF646464),
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (hours > 0)
                Text(
                  '$hours hr ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 24 / 16,
                  ),
                ),
              Text(
                '$minutes min',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  height: 24 / 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
