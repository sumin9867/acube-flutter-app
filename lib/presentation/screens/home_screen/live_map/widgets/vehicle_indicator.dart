import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/theme/app_colors.dart';

class VehicleIndicator extends StatelessWidget {
  const VehicleIndicator({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    this.unit,
  });

  final String value;
  final String label;
  final Widget icon;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    final horizontalPadding = width * 0.06;
    final verticalPadding = width * 0.025;
    final borderRadius = width * 0.025;

    final valueFontSize = width * 0.04;
    final labelFontSize = width * 0.032;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.softOffWhite,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: value,
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: valueFontSize,
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurface,
              ),
              children: [
                if (unit != null)
                  TextSpan(
                    text: ' $unit',
                    style: context.textTheme.titleSmall?.copyWith(
                      fontSize: valueFontSize * 0.9,
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 6,
              ),
              Text(
                label,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.customGray,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
