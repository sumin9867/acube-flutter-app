// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/anti_thieft/presentation/anti_thieft_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/vehicle_subscription_alert_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/widgets/vehicle_dashboard_button_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/widgets/vehicle_header_section.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/widgets/vehicle_indicator.dart';
import 'package:gpspro/router/router.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:intl/intl.dart';

class VehicleMapBottomSheet extends StatelessWidget {
  const VehicleMapBottomSheet(
      {super.key, required this.vehicle, required this.draggableController, required this.user});

  final Device vehicle;
  final User user;

  final DraggableScrollableController draggableController;

  @override
  Widget build(BuildContext context) {
    final expirationTime = vehicle.expirationTime;
    bool isExpiringSoon = false;
    bool isExpired = false;
    String daysLeftText = '';
    String formattedDate = '';

    if (expirationTime != null) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final expDate = DateTime(expirationTime.year, expirationTime.month, expirationTime.day);

      final difference = expDate.difference(today).inDays;
      formattedDate = DateFormat('dd MMM yyyy').format(expirationTime);

      if (difference < 30 && difference >= 0) {
        isExpiringSoon = true;
      }

      if (difference < 0) {
        isExpired = true;
        daysLeftText = 'Expired';
      } else {
        daysLeftText = '$difference';
      }
    }
    final screenHeight = MediaQuery.of(context).size.height;
    log('i ma device height $screenHeight');
    final screenWidth = MediaQuery.of(context).size.width;
    final double bottomSheetMinHeight = isExpired || isExpiringSoon ? screenHeight * .4 : screenHeight * .32;
    final double contentHeight = screenHeight < 600
        ? screenHeight * 0.88
        : screenHeight < 660
            ? screenHeight * 0.83
            : screenHeight < 800
                ? screenHeight * 0.78
                : screenHeight * 0.68;

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == notification.initialExtent) {
          HapticFeedback.lightImpact();
        }
        if (notification.extent == notification.maxExtent) {
          HapticFeedback.heavyImpact();
        }
        return true;
      },
      child: DraggableScrollableSheet(
        controller: draggableController,
        initialChildSize: bottomSheetMinHeight / screenHeight,
        minChildSize: bottomSheetMinHeight / screenHeight,
        maxChildSize: contentHeight / screenHeight,
        expand: false,
        snap: true,
        builder: (context, scrollController) {
          log('vehicle category ${vehicle.category}');
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                if (isExpiringSoon || isExpired)
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.09,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.014),
                          child: SvgPicture.asset(
                            'assets/icons/vehicle_details_icon/warning.svg',
                            width: screenWidth * 0.06,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.02,
                              right: screenWidth * 0.02,
                              top: screenHeight * 0.020,
                            ),
                            child: Text(
                              isExpired
                                  ? 'Vehicle has expired on $formattedDate'
                                  : 'Vehicle will expire on $formattedDate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.014,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.002),
                          child: GestureDetector(
                            onTap: () {
                              if (!isExpired) {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) => VehicleSubscriptionAlertWidget(device: vehicle),
                                  ),
                                );
                              }
                            },
                            child: Chip(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.deepOrange),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: Text(
                                isExpired ? 'Vehicle Expired' : '$daysLeftText Days Left',
                                style: TextStyle(
                                  fontSize: screenHeight * 0.013,
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.deepOrange.withOpacity(0.7),
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Transform.translate(
                  offset: const Offset(0, -13),
                  child: Padding(
                    padding: EdgeInsets.only(top: isExpired || isExpiringSoon ? screenHeight * .07 : 0),
                    child: _buildBottomSheetContent(draggableController, context, scrollController, screenHeight),
                  ),
                ),
                AppHelper.getCategoryImage(context, isExpired || isExpiringSoon, vehicle.category,
                    customHeight: vehicle.category == 'rmc' ? screenHeight * .18 : screenHeight * .14),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomSheetContent(DraggableScrollableController draggableController, BuildContext context,
      ScrollController controller, double screenHeight) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.047),
                  offset: Offset(0, -4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ]),
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                draggableController.animateTo(
                  1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              } else if (details.primaryVelocity! > 0) {
                draggableController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            },
            child: SingleChildScrollView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.015),
                  _buildDragHandle(context),
                  SizedBox(height: screenHeight * 0.035),
                  VehicleHeaderSection(vehicle: vehicle),
                  SizedBox(height: screenHeight * 0.008),
                  _buildAddress(context),
                  SizedBox(height: screenHeight * 0.012),
                  _buildIndicators(context),
                  SizedBox(height: screenHeight * 0.012),
                  if (!user.disableReports!) VehicleDashboardButtonWidget(vehicle: vehicle),
                  SizedBox(height: screenHeight * 0.016),
                  _buildSectionTitle(context, 'Control Center'),
                  SizedBox(height: screenHeight * 0.016),
                  if (!user.limitCommands!) _buildEngineLockButton(context),
                  // SizedBox(height: screenHeight * 0.016),
                  // _buildAntiLockBottom(context),
                  SizedBox(height: screenHeight * 0.016),
                  _buildDetailsOptions(context),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddress(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/vehicle_details_icon/location.svg',
          width: screenWidth * 0.05,
        ),
        SizedBox(width: screenWidth * 0.01),
        Expanded(
          child: AppText(
            vehicle.position?.address ?? 'No Address',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: screenHeight * 0.018,
              color: AppColors.customGray,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicators(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double iconSize = screenWidth * 0.04;

    return Row(
      spacing: screenWidth * .02,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VehicleIndicator(
          value: AppHelper.formatSpeed(vehicle.position?.speed ?? 0),
          label: 'Speed',
          icon: SvgPicture.asset(
            Assets.icons.vehicleDashboard.speed.path,
            height: iconSize,
            width: iconSize,
          ),
          unit: 'km/h',
        ),
        VehicleIndicator(
          value: AppHelper.rssiIntToLabel(vehicle.position?.attributes?.rssi),
          label: 'Signal',
          icon: SvgPicture.asset(
            Assets.icons.controlCenter.signal.path,
            height: screenWidth * 0.03,
            width: screenWidth * 0.03,
            color: Colors.black,
          ),
        ),
        VehicleIndicator(
          value: '${vehicle.position?.attributes?.sat ?? "-"}',
          label: 'Satellites',
          icon: SvgPicture.asset(
            Assets.icons.controlCenter.satellite.path,
            height: iconSize,
            width: iconSize,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildEngineLockButton(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenHeight * 0.02;
    final double verticalPadding = screenHeight * 0.017;
    final double iconSize = screenHeight * 0.020;
    final double fontSize = screenHeight * 0.02;
    final double spacing = screenHeight * 0.01;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          backgroundColor: const Color.fromRGBO(229, 72, 77, 0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
        ),
        onPressed: () {
          RouteHelper.pushVehicleEngineLockPage(
            VehicleEngineLockRouteParams(device: vehicle),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/vehicle_details_icon/lock.svg',
              height: iconSize,
              width: iconSize,
              color: const Color.fromRGBO(229, 72, 77, 1.0),
            ),
            SizedBox(width: spacing),
            Text(
              'Lock Engine',
              style: TextStyle(
                color: const Color.fromRGBO(229, 72, 77, 1.0),
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAntiLockBottom(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom; // 👈 keyboard height

    final double horizontalPadding = screenHeight * 0.02;
    final double verticalPadding = screenHeight * 0.017;
    final double iconSize = screenHeight * 0.020;
    final double fontSize = screenHeight * 0.02;
    final double spacing = screenHeight * 0.01;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset), // 👈 moves button above keyboard
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Color.fromRGBO(241, 241, 241, 1)),
            ),
            elevation: 0,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true, // 👈 already good
              context: context,
              builder: (context) => AntiTheftScreen(device: vehicle),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/vehicle_details_icon/lock.svg',
                color: Colors.black,
                height: iconSize,
                width: iconSize,
              ),
              SizedBox(width: spacing),
              Text(
                'Anti Thief',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsOptions(BuildContext context) {
    return Column(
      children: [
        VehicleDetailsTile(
          title: 'Set Geofence',
          subtitle: 'Create & manage geofence',
          iconPath: 'assets/icons/vehicle_details_icon/geofence.svg',
          onTap: () {
            RouteHelper.pushGeofenceRoute(
              GeofenceRouteParams(vehicleId: vehicle.id.toString()),
            );
          },
        ),
        VehicleDetailsTile(
          title: 'Vehicle Setting',
          subtitle: 'Customize your vehicle performance',
          iconPath: 'assets/icons/vehicle_details_icon/setting.svg',
          onTap: () {
            RouteHelper.pushVehicleSettingsPage(
              VehicleSettingsRouteParams(device: vehicle),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1.0)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppText(
            title,
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.customGray,
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
        ),
        const Expanded(child: Divider(thickness: 1.0)),
      ],
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 6.0,
        width: 35.0,
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 210, 210),
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }
}

class VehicleDetailsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback? onTap;

  const VehicleDetailsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenHeight * 0.025;
    final trailingIconSize = screenHeight * 0.018;

    return ListTile(
      style: ListTileStyle.list,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: trailingIconSize,
        color: const Color.fromARGB(255, 122, 122, 122),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenHeight * 0.018,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: screenHeight * 0.016,
          fontWeight: FontWeight.w400,
          color: AppColors.customGray,
        ),
      ),
      leading: SvgPicture.asset(
        iconPath,
        height: iconSize,
        width: iconSize,
      ),
    );
  }
}
