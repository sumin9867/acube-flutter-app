import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/subscription_color.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/subscription_details.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/vehicle_subscription_alert_widget.dart';
import 'package:intl/intl.dart';

class SubscriptionWidget extends StatelessWidget {
  final DeviceCubit deviceCubit;
  final bool isWide;
  const SubscriptionWidget({super.key, required this.deviceCubit, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final fontSize = screenWidth * 0.035;
    final iconSize = screenWidth * 0.045;
    final paddingHorizontal = screenWidth * 0.04;
    final imageSize = screenWidth * 0.13;

    return BlocProvider.value(
      value: deviceCubit,
      child: BlocBuilder<DeviceCubit, Device>(
        builder: (context, device) {
          final expiration = device.expirationTime ?? DateTime.now();
          final daysLeft = expiration.difference(DateTime.now()).inDays;
          final statusText = _getStatusText(daysLeft);
          final statusColor = _getStatusColor(statusText);
          final textColor = _getTextColor(statusText);

          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SubscriptionDetailsScreen(
                  daysLeft: daysLeft,
                  device: device,
                  expireDate: DateFormat('MMM d, y').format(expiration),
                ),
              ),
            ),
            child: Column(
              children: [
                if (daysLeft <= 0) _buildExpiredBanner(context, device, fontSize, paddingHorizontal, iconSize),
                Transform.translate(
                  offset: const Offset(0, -15),
                  child: _buildSubscriptionCard(
                    context,
                    device,
                    daysLeft,
                    statusText,
                    statusColor,
                    textColor,
                    fontSize,
                    paddingHorizontal,
                    imageSize,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildExpiredBanner(
    BuildContext context,
    Device device,
    double fontSize,
    double horizontalPadding,
    double iconSize,
  ) {
    final height = MediaQuery.of(context).size.height;
    log('i ma height hai $height');
    final heightFactor = height < 680 ? 0.07 : 0.06;

    return Container(
      height: height * heightFactor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding:
          EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, top: height >= 750 ? iconSize / 6 : 0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: SubscriptionAppColors.expiredBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: iconSize / 1.5),
            child: SvgPicture.asset(
              'assets/icons/warning.svg',
              height: iconSize,
              color: SubscriptionAppColors.expiredText,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: iconSize / 1.5),
              child: Text(
                'Vehicle subscription is expired.',
                style: TextStyle(
                  fontSize: fontSize.clamp(10, 11),
                  color: SubscriptionAppColors.expiredText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VehicleSubscriptionAlertWidget(device: device),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: iconSize / 3),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: SubscriptionAppColors.expiredText.withOpacity(0.22)),
              ),
              child: Text(
                'Renew Now',
                style: TextStyle(
                  color: SubscriptionAppColors.expiredText,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize.clamp(11, 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(
    BuildContext context,
    Device device,
    int daysLeft,
    String statusText,
    Color statusColor,
    Color textColor,
    double fontSize,
    double paddingHorizontal,
    double imageSize,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 16),
      decoration: BoxDecoration(
        color: SubscriptionAppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SubscriptionAppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppHelper.getVehicleImage(device).image(
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            device.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(24, 24, 24, 1),
                              fontSize: fontSize.clamp(14, 20),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          daysLeft.toString(),
                          style: TextStyle(
                            fontSize: fontSize.clamp(14, 20),
                            fontWeight: FontWeight.w600,
                            color: _getDaysLeftColor(statusText),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#ID${device.id}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(100, 100, 100, 1),
                            fontSize: fontSize.clamp(10, 13),
                          ),
                        ),
                        Text(
                          'Days Left',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(100, 100, 100, 1),
                            fontSize: fontSize.clamp(10, 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: SubscriptionAppColors.border),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expires on: ${DateFormat('MMM d, y').format(device.expirationTime ?? DateTime.now())}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(100, 100, 100, 1),
                  fontSize: fontSize.clamp(11, 14),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize.clamp(11, 14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getStatusText(int daysLeft) {
    if (daysLeft <= 0) return 'EXPIRED';
    if (daysLeft <= 3) return 'EXPIRING SOON';
    return 'Active';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'EXPIRED':
        return SubscriptionAppColors.expiredBackground;
      case 'EXPIRING SOON':
        return SubscriptionAppColors.expiringSoonBackground;
      default:
        return SubscriptionAppColors.activeBackground;
    }
  }

  Color _getTextColor(String status) {
    switch (status) {
      case 'EXPIRED':
        return SubscriptionAppColors.expiredText;
      case 'EXPIRING SOON':
        return SubscriptionAppColors.expiringSoonText;
      default:
        return SubscriptionAppColors.activeText;
    }
  }

  Color _getDaysLeftColor(String status) {
    switch (status) {
      case 'EXPIRED':
        return SubscriptionAppColors.daysLeftExpired;
      case 'EXPIRING SOON':
        return SubscriptionAppColors.daysLeftExpiringSoon;
      default:
        return SubscriptionAppColors.daysLeftDefault;
    }
  }
}
