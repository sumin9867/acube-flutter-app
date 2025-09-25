// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/domain/models/Device.dart';

class VehicleNameAddressSection extends StatelessWidget {
  const VehicleNameAddressSection({
    super.key,
    required this.model,
  });

  final Device model;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final iconSize = width * 0.040; // ~16 on 428px screen
    final verticalSpacing = width * 0.012; // ~5 on 428px
    final titleFontSize = width * 0.045; // ~20
    final labelFontSize = width * 0.035; // ~17

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.name,
          style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600, fontSize: titleFontSize, color: const Color.fromRGBO(24, 24, 24, 1)),
        ),
        SizedBox(height: verticalSpacing),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              height: iconSize,
              color: const Color.fromRGBO(100, 100, 100, 1),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                model.position?.address ?? 'N/A',
                style: context.textTheme.labelLarge?.copyWith(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(100, 100, 100, 1),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ],
    );
  }
}
