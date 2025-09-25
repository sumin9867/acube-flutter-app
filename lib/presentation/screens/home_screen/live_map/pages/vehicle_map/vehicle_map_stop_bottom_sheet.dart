import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VehicleMapStopBottomSheet extends StatelessWidget {
  const VehicleMapStopBottomSheet({
    super.key,
    required this.vehicle,
    required this.stop,
  });

  final Device vehicle;
  final VehicleStop stop;

  bool get isIgnitionOn => vehicle.position?.attributes?.ignition == true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/statistics/location.svg'),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: AppText(
                        stop.address ?? 'No Address',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TimelineTile(
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              indicatorXY: 0.4,
                              indicator: SvgPicture.asset('assets/icons/statistics/stop_icon.svg'),
                              width: 20,
                              height: 20,
                              color: Colors.transparent,
                            ),
                            afterLineStyle: const LineStyle(
                              thickness: 8,
                              color: Color.fromRGBO(255, 1, 1, 0.06),
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 22.0),
                              child: _buildTimeAddressLabel(
                                  context,
                                  Jiffy.parseFromDateTime(stop.startTime)
                                      .add(hours: 5, minutes: 45)
                                      .format(pattern: 'MMMM d, h:mm a'),
                                  stop.address ?? '',
                                  'Arrival'),
                            ),
                          ),
                          TimelineTile(
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              indicatorXY: 0.5,
                              indicator: SvgPicture.asset('assets/icons/statistics/stop_icon.svg'),
                              width: 20,
                              height: 20,
                              color: Colors.transparent,
                            ),
                            beforeLineStyle: const LineStyle(
                              thickness: 8,
                              color: Color.fromRGBO(255, 1, 1, 0.06),
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 12, left: 22.0),
                              child: _buildTimeAddressLabel(
                                  context,
                                  Jiffy.parseFromDateTime(stop.endTime)
                                      .add(hours: 5, minutes: 45)
                                      .format(pattern: 'MMMM d, h:mm a'),
                                  stop.address ?? 'Unknown',
                                  'Departure'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1), // background
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromRGBO(241, 241, 241, 1), // border color
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/statistics/stop_count.svg',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            formatDuration(stop.duration),
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600, // 590 is closest to w600
                              fontSize: 16,
                              height: 24 / 16, // line-height in Flutter = lineHeight / fontSize
                              letterSpacing: -0.3,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            'Duration',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400, // Regular = w400
                              fontSize: 14,
                              height: 20 / 14, // line-height = 20px → height = 1.428
                              letterSpacing: -0.3,
                              color: Color.fromRGBO(100, 100, 100, 1), // rgba(100, 100, 100, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 12),
              ],
            ),
          ),
          // AppHelper.getCategoryImage(context, vehicle.category),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    final int totalMinutes = duration.inMinutes;
    final int hours = totalMinutes ~/ 60;
    final int minutes = totalMinutes % 60;

    if (hours > 0) {
      return '$hours h $minutes min';
    } else {
      return '$minutes min';
    }
  }

  Column _buildTimeAddressLabel(BuildContext context, String time, String address, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 20 / 14,
            letterSpacing: -0.3,
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color.fromRGBO(100, 100, 100, 1),
            height: 20 / 14,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}
