import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehicleTripAddressLabel extends StatelessWidget {
  const VehicleTripAddressLabel({
    super.key,
    required this.time,
    required this.address,
  });

  final String time;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SvgPicture.asset('assets/icons/statistics/location.svg'),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF8D8D8D),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 16 / 12,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
