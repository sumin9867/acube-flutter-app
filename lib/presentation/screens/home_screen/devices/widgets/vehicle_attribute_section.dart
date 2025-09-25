import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/theme/app_colors.dart';

class VehicleAttributeSection extends StatelessWidget {
  const VehicleAttributeSection({
    super.key,
    required this.svgImage,
    required this.label,
    required this.value,
    required this.height,
  });

  final String svgImage;
  final double height;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final iconHeight = width * 0.06;
    final gap = width * 0.03;
    final labelFontSize = width * 0.032;
    final valueFontSize = width * 0.034;
    final padding = width * 0.025;
    final borderRadius = width * 0.015;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF9FB),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SvgPicture.asset(
              svgImage,
              height: height != 0 ? height : iconHeight,
              color: AppColors.newUIprimaryColor,
            ),
          ),
          SizedBox(width: gap),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: labelFontSize,
                    color: const Color.fromRGBO(120, 118, 128, 1)),
              ),
              Text(
                value,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
