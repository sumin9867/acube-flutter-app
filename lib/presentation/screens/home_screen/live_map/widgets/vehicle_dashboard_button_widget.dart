// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/router/route_helper.dart';
import 'package:gpspro/router/route_params.dart';
import 'package:gpspro/theme/app_colors.dart';

class VehicleDashboardButtonWidget extends StatelessWidget {
  final Device vehicle;

  const VehicleDashboardButtonWidget({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonHeight = screenHeight * 0.07;
    final paddingHorizontal = screenWidth * 0.05;
    final paddingVertical = screenHeight * 0.015;
    final gapWidth = screenWidth * 0.04;
    final fontSize = screenHeight * 0.018;

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(width: 1, color: Color.fromRGBO(230, 227, 238, 1)),
              ),
              elevation: 0,
            ),
            onPressed: () {
              RouteHelper.pushVehicleDashboardPage(
                VehicleDashboardRouteParams(
                  device: vehicle,
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.icons.controlCenter.dashboard.path,
                  height: buttonHeight * 0.30,
                  width: buttonHeight * 0.4,
                  color: AppColors.customGray,
                ),
                const SizedBox(width: 8),
                Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: gapWidth),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(width: 1, color: Color.fromRGBO(230, 227, 238, 1)),
              ),
              elevation: 0,
            ),
            onPressed: () {
              RouteHelper.pushVehiclePlaybackPage(
                VehiclePlaybackRouteParams(
                  vehicleId: vehicle.id.toString(),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/vehicle_details_icon/playback.svg',
                  height: buttonHeight * 0.35,
                  width: buttonHeight * 0.4,
                  color: AppColors.customGray,
                ),
                const SizedBox(width: 8),
                Text(
                  'Playback',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
