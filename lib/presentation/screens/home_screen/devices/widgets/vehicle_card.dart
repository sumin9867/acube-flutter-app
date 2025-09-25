import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/info/vehicle_info_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/vehicle_subscription_alert_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/status_container.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/table_nav_view.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_attribute_section.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_expiry_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_name_address_section.dart';
import 'package:gpspro/router/router.dart';
import 'package:jiffy/jiffy.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key, required this.model, required this.user});

  final Device model;
  final User user;

  bool get isStopped => (model.status == DeviceStatus.online &&
      (model.position?.attributes?.ignition == null || model.position!.attributes!.ignition == false));

  bool get isOnline => model.status == DeviceStatus.online && !isStopped;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final padding = width * 0.03;
    final containerRadius = width * 0.025;
    final imageSize = width * 0.175;

    final updatedTime = model.lastUpdate == null
        ? null
        : Jiffy.parseFromDateTime(model.lastUpdate!).fromNow(
            withPrefixAndSuffix: false,
          );

    final expirationTime = model.expirationTime;
    bool isExpired = false;

    int getDaysLeft() {
      final expirationTime = model.expirationTime;

      if (expirationTime == null) return 0;

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final expDate = DateTime(expirationTime.year, expirationTime.month, expirationTime.day);

      final difference = expDate.difference(today).inDays;

      return difference > 0 ? difference : 0;
    }

    if (expirationTime != null) {
      final currentTime = DateTime.now();
      isExpired = !expirationTime.isAfter(currentTime);
    }
    final daysLeft = getDaysLeft();
    final isExpireded = daysLeft == 0;

    return Column(
      children: [
        if (getDaysLeft() < 30)
          VehicleExpirationBanner(
            daysLeft: getDaysLeft(),
            expirationDate: expirationTime ?? DateTime.now(),
            width: width,
            height: height,
            padding: padding,
            containerRadius: containerRadius,
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => VehicleSubscriptionAlertWidget(device: model),
                ),
              );
            },
          ),
        Transform.translate(
          offset: const Offset(0, -5),
          child: Stack(
            children: [
              AbsorbPointer(
                absorbing: isExpired || isExpireded,
                child: InkWell(
                  onTap: () {
                    RouteHelper.pushDeviceDetailsPage(
                      VehicleDetailsRouteParams(
                        device: model,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(16, 24, 40, 0.05),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  RouteHelper.pushDeviceDetailsPage(
                                    VehicleDetailsRouteParams(
                                      device: model,
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: width * 0.03),
                                      child: Container(
                                        padding: EdgeInsets.all(width * 0.015),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: AppHelper.getVehicleImage(model).image(
                                            fit: BoxFit.cover,
                                            height: imageSize,
                                            width: imageSize,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    StatusContainer(
                                      isOnline: isOnline,
                                      updatedTime: updatedTime ?? '',
                                    ),
                                    SizedBox(height: height * 0.01),
                                  ],
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.01),
                                    VehicleNameAddressSection(model: model),
                                    SizedBox(height: height * 0.019),
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: Wrap(
                                        alignment: WrapAlignment.spaceBetween,
                                        children: [
                                          VehicleAttributeSection(
                                            height: height * 0.02,
                                            svgImage: 'assets/icons/ignition.svg',
                                            label: context.locale.ignition,
                                            value: model.position?.attributes?.ignition == null
                                                ? '-'
                                                : model.position!.attributes!.ignition!
                                                    ? context.locale.on
                                                    : context.locale.off,
                                          ),
                                          VehicleAttributeSection(
                                            height: height * 0.02,
                                            svgImage: 'assets/icons/wifi.svg',
                                            label: context.locale.status,
                                            value: model.status == DeviceStatus.online ? 'Online' : 'Offline',
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height * 0.004),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Table(
                          border: const TableBorder(
                            top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                            verticalInside: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                            bottom: BorderSide.none,
                            left: BorderSide.none,
                            right: BorderSide.none,
                            horizontalInside: BorderSide.none,
                          ),
                          children: [
                            TableRow(
                              children: [
                                if (user.disableReports != true)
                                  TableNavItem(
                                    iconSize: MediaQuery.of(context).size.height * .016,
                                    icon: 'assets/icons/dashboard.svg',
                                    label: context.locale.dashboard,
                                    onTap: () {
                                      RouteHelper.pushVehicleDashboardPage(
                                        VehicleDashboardRouteParams(device: model),
                                      );
                                    },
                                  ),
                                TableNavItem(
                                  iconSize: MediaQuery.of(context).size.height * .020,
                                  icon: 'assets/icons/trip.svg',
                                  label: context.locale.vehicleLiveTrack,
                                  onTap: () => RouteHelper.pushDeviceDetailsPage(
                                    VehicleDetailsRouteParams(device: model),
                                  ),
                                ),
                                TableNavItem(
                                  iconSize: MediaQuery.of(context).size.height * .020,
                                  icon: 'assets/icons/info.svg',
                                  label: context.locale.vehicleMoreInfo,
                                  onTap: () {
                                    log('I am tapped');
                                    Navigator.of(context, rootNavigator: true).push(
                                      MaterialPageRoute(
                                        builder: (context) => VehicleInfoScreen(model: model),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isExpired || isExpireded)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(containerRadius),
                    child: GestureDetector(
                      onTap: () {
                        AppToast.showError(
                          context: context,
                          message: context.locale.vehicleCannotAccessExpired,
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
