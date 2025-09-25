import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SummaryInfo extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const SummaryInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final bool showIcon = screenWidth >= 350;
    final double iconSize = screenWidth * 0.07;
    final double spacing = screenWidth * 0.02;

    final TextStyle valueStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: screenHeight * 0.017,
      color: const Color.fromRGBO(24, 24, 24, 1),
    );

    final TextStyle unitStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: screenHeight * 0.017,
      color: const Color.fromRGBO(24, 24, 24, 1),
    );

    final RegExp unitRegex = RegExp(r'^([0-9.,]+)\s*(.*)$');
    final match = unitRegex.firstMatch(value);

    String number = value;
    String unit = '';

    if (match != null) {
      number = match.group(1)!;
      unit = match.group(2)!;
    }

    return Container(
      width: MediaQuery.of(context).size.width * .28,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: const Color.fromRGBO(241, 241, 241, 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          if (showIcon)
            SvgPicture.asset(
              'assets/icons/playback/$icon',
              height: iconSize,
            ),
          if (showIcon) SizedBox(width: spacing),
          Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.012,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
          Text.rich(
            TextSpan(
              text: number,
              style: valueStyle,
              children: [
                if (unit.isNotEmpty)
                  TextSpan(
                    text: ' $unit',
                    style: unitStyle,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
