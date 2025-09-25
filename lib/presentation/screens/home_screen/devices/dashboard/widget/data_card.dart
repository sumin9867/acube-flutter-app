import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DataCard extends StatelessWidget {
  final String icon;

  final String data;
  final String label;

  const DataCard({super.key, required this.icon, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1), // background
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromRGBO(241, 241, 241, 1), // border color
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/statistics/$icon.svg',
            ),
            const SizedBox(height: 14),
            Text(
              data,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600, // 590 is closest to w600
                fontSize: 16,
                height: 24 / 16, // line-height in Flutter = lineHeight / fontSize
                letterSpacing: -0.3,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400, // Regular = w400
                fontSize: 14,
                height: 20 / 14, // line-height = 20px → height = 1.428
                letterSpacing: -0.3,
                color: Color.fromRGBO(100, 100, 100, 1), // rgba(100, 100, 100, 1)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
