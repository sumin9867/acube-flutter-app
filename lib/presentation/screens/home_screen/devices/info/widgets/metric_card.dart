import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/theme/app_colors.dart';

class MetricCard extends StatelessWidget {
  final String svgAsset;
  final double? width;
  final String value;
  final String label;

  const MetricCard({
    super.key,
    required this.svgAsset,
    required this.value,
    required this.label,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive scaling
    final double padding = screenWidth * 0.035;
    final double iconSize = screenWidth * 0.035;
    final double valueFontSize = screenWidth * 0.042;
    final double labelFontSize = screenWidth * 0.03;

    return Container(
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/vehicle_info/$svgAsset',
            height: iconSize,
            width: iconSize,
            color: AppColors.iconColor,
          ),
          SizedBox(height: padding * 0.6),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: valueFontSize,
              color: AppColors.valueTextColor,
            ),
          ),
          SizedBox(height: padding * 0.2),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: labelFontSize,
              color: AppColors.labelTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
