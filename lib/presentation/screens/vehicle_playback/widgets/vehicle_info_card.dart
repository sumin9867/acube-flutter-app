import 'package:flutter/material.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';

class VehicleInfoCard extends StatelessWidget {
  final String? address;
  final double speed;
  final int rssi;
  final String signalLabel;

  const VehicleInfoCard({
    super.key,
    required this.address,
    required this.speed,
    required this.rssi,
    required this.signalLabel,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Transform.translate(
      offset: const Offset(0, -20), // Move the card slightly upwards
      child: CustomPaint(
        painter: _BubblePainterWithShadow(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6, right: 10, left: 10), // space for tail
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                address ?? 'No Address',
                style: TextStyle(
                  fontSize: height * .014,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Icon(
                    Icons.speed,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: height * .017,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${AppHelper.formatSpeed(speed)} Km/h',
                    style: TextStyle(
                      fontSize: height * .012,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF999999),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Icon(
                    Icons.signal_cellular_alt,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: height * .014,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    signalLabel,
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

    // Combine main card and tail
    path.addRRect(rect);
    path.addPath(tail, Offset.zero);

    // Shadow layer
    canvas.drawPath(path, shadowPaint);

    // Main white box
    canvas.drawPath(path, whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
