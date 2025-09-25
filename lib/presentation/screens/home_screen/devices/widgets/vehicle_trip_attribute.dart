import 'package:flutter/material.dart';

class VehicleTripAttribute extends StatelessWidget {
  const VehicleTripAttribute({
    super.key,
    required this.icon,
    required this.value,
    required this.unit,
    required this.label,
  });

  final Widget icon;
  final String value;
  final String unit;
  final String label;

  String getFormattedValue() {
    if (unit == 'mins') {
      final int totalMinutes = int.tryParse(value) ?? 0;
      final int hours = totalMinutes ~/ 60;
      final int minutes = totalMinutes % 60;

      if (hours > 0) {
        return '${hours}h ${minutes}min';
      } else {
        return '${minutes}min';
      }
    }
    return '$value $unit';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 6),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 16 / 12,
                    letterSpacing: -0.3,
                    color: Color(0xFF646464),
                  ),
                ),
              ],
            ),
            Text(
              getFormattedValue(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 24 / 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
