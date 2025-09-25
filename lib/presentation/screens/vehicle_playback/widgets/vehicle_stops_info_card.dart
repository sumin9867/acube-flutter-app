// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:intl/intl.dart';

class VehicleStopsInfoCard extends StatelessWidget {
  final VehicleStop vehicleStop;
  const VehicleStopsInfoCard({
    super.key,
    required this.vehicleStop,
  });

  @override
  Widget build(BuildContext context) {
    DateTime toNepalTime(DateTime utcTime) {
      return utcTime.toUtc().add(const Duration(hours: 5, minutes: 45));
    }

    String formatStartEndTime(DateTime startTime, DateTime endTime) {
      final nepalStart = toNepalTime(startTime);
      final nepalEnd = toNepalTime(endTime);

      final String formattedStartTime = DateFormat('hh:mm a').format(nepalStart);
      final String formattedEndTime = DateFormat('hh:mm a').format(nepalEnd);

      return '($formattedStartTime → $formattedEndTime)';
    }

    formatStartEndTime(vehicleStop.startTime, vehicleStop.endTime);

    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');

      final int hours = duration.inHours;
      final int minutes = duration.inMinutes % 60;
      final int seconds = duration.inSeconds % 60;

      if (hours > 0) {
        return '$hours h ${twoDigits(minutes)}m';
      } else {
        return '${twoDigits(minutes)}m ${twoDigits(seconds)}s';
      }
    }

    formatDuration(vehicleStop.duration);

    final height = MediaQuery.of(context).size.height;

    return Transform.translate(
      offset: const Offset(0, -20),
      child: CustomPaint(
        painter: _BubblePainterWithShadow(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stopped At',
                  style: TextStyle(
                    fontSize: height * .012,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height * .005,
                ),
                Text(
                  vehicleStop.address ?? 'No Address',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height * .012,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: height * .002,
                ),
                Row(
                  children: [
                    Text(
                      formatDuration(vehicleStop.duration),
                      style: TextStyle(
                        fontSize: height * .012,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      formatStartEndTime(vehicleStop.startTime, vehicleStop.endTime),
                      style: TextStyle(
                        fontSize: height * .012,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BubblePainterWithShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final radius = 20.0;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height - 10),
      Radius.circular(radius),
    );

    final tailCenter = Offset(size.width / 2, size.height - 10);
    final tail = Path()..addOval(Rect.fromCircle(center: tailCenter, radius: 10));

    path.addRRect(rect);
    path.addPath(tail, Offset.zero);

    canvas.drawPath(path, shadowPaint);

    canvas.drawPath(path, whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
