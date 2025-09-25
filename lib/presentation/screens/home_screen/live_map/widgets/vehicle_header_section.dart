import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/theme/app_colors.dart';

class VehicleHeaderSection extends StatelessWidget {
  final Device vehicle;

  const VehicleHeaderSection({super.key, required this.vehicle});

  bool get isIgnitionOn => vehicle.position?.attributes?.ignition == true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.5, // Limit name width to half screen
          ),
          child: AppText(
            vehicle.name,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleLarge?.copyWith(
              fontSize: screenWidth * 0.058,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
            width: screenWidth * 0.02), // Small space between name and button
        Container(
          padding: EdgeInsets.all(screenHeight * 0.008),
          decoration: BoxDecoration(
            color: isIgnitionOn
                ? const Color.fromRGBO(52, 199, 89, 0.1)
                : const Color.fromRGBO(255, 0, 0, 0.1),
            borderRadius: BorderRadius.circular(screenWidth * 0.016),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/vehicle_details_icon/ignition.svg',
                color: isIgnitionOn
                    ? const Color.fromRGBO(52, 199, 89, 1)
                    : const Color.fromRGBO(255, 0, 0, 1),
                height: screenHeight * 0.020,
                width: screenHeight * 0.020,
              ),
              SizedBox(width: screenWidth * 0.01),
              AppText(
                vehicle.position?.attributes?.ignition == null
                    ? '-'
                    : isIgnitionOn
                        ? 'ON'
                        : 'OFF',
                style: context.textTheme.labelSmall?.copyWith(
                  fontSize: screenHeight * 0.012,
                  color: isIgnitionOn ? AppColors.green : AppColors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
