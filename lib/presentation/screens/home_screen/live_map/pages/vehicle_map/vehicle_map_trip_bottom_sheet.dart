import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_trip_address_label.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VehicleMapTripBottomSheet extends StatelessWidget {
  const VehicleMapTripBottomSheet({
    super.key,
    required this.vehicle,
    required this.trip,
  });

  final Device vehicle;
  final VehicleTrip trip;

  bool get isIgnitionOn => vehicle.position?.attributes?.ignition == true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(24),
          // boxShadow: const [AppShadow.bottomSheet],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                AppText(
                  vehicle.name,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(24, 24, 24, 1),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TimelineTile(
                  isFirst: true,
                  alignment: TimelineAlign.start,
                  indicatorStyle: IndicatorStyle(
                    indicatorXY: 0.55,
                    indicator: SvgPicture.asset('assets/icons/statistics/start_icon.svg'),
                    width: 18,
                    height: 20,
                    color: Colors.transparent,
                  ),
                  afterLineStyle: const LineStyle(
                    thickness: 8,
                    color: Color.fromRGBO(2, 128, 255, 0.07),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 7, bottom: 4),
                    child: VehicleTripAddressLabel(
                      time: Jiffy.parseFromDateTime(trip.startTime)
                          .addDuration(const Duration(hours: 5, minutes: 45))
                          .format(pattern: 'MMMM d, h:mm a'),
                      address: trip.startAddress,
                    ),
                  ),
                ),
                TimelineTile(
                  isLast: true,
                  alignment: TimelineAlign.start,
                  indicatorStyle: IndicatorStyle(
                    indicatorXY: 0.6,
                    indicator: SvgPicture.asset('assets/icons/statistics/green_location.svg'),
                    width: 18,
                    height: 20,
                    color: Colors.transparent,
                  ),
                  beforeLineStyle: const LineStyle(
                    thickness: 8,
                    color: Color.fromRGBO(2, 128, 255, 0.07),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 5),
                    child: VehicleTripAddressLabel(
                      time: Jiffy.parseFromDateTime(trip.endTime)
                          .addDuration(const Duration(hours: 5, minutes: 45))
                          .format(pattern: 'MMMM d, h:mm a'),
                      address: trip.endAddress,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Divider(
              height: 10,
              color: context.colorScheme.secondaryFixedDim,
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _VehicleIndicator(
                    icon: Icon(
                      Icons.directions_car_outlined,
                      color: context.colorScheme.onSurface,
                      size: 16,
                    ),
                    unit: 'km',
                    label: 'Distance',
                    value: '${trip.distanceInKm}',
                  ),
                  const SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  _VehicleIndicator(
                    icon: Icon(
                      Icons.signal_cellular_alt,
                      color: context.colorScheme.onSurface,
                      size: 16,
                    ),
                    unit: 'min',
                    label: 'Duration',
                    value: '${trip.duration.inMinutes}',
                  ),
                  const SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  _VehicleIndicator(
                      icon: SvgPicture.asset(
                        Assets.icons.vehicleDashboard.speed.path,
                        height: 16,
                      ),
                      unit: 'km/h',
                      label: 'Max. speed',
                      value: AppHelper.formatSpeed(trip.maxSpeed)),
                ],
              ),
            ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _VehicleIndicator extends StatelessWidget {
  const _VehicleIndicator({
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

    final valueFontSize = width * 0.03;
    final labelFontSize = width * 0.032;

    return Column(
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
    );
  }
}
