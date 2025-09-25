import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_trip_address_label.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_trip_attribute.dart';
import 'package:gpspro/presentation/screens/vehicle_details/vehicle_map_trip_page.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VehicleTripCard extends StatelessWidget {
  const VehicleTripCard({
    super.key,
    required this.model,
  });

  final VehicleTrip model;

  @override
  Widget build(BuildContext context) {
    const contentPadding = EdgeInsets.fromLTRB(24, 0, 24, 14);

    return Container(
      margin: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromRGBO(241, 241, 241, 1),
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .74,
                  width: MediaQuery.of(context).size.width * .9,
                  child: VehicleMapTripPage(trips: model),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Column(
            children: [
              Padding(
                padding: contentPadding,
                child: Column(
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
                        padding: const EdgeInsets.only(left: 22.0, top: 18, bottom: 4),
                        child: VehicleTripAddressLabel(
                          time: Jiffy.parseFromDateTime(model.startTime)
                              .addDuration(const Duration(hours: 5, minutes: 45))
                              .format(pattern: 'MMMM d, h:mm a'),
                          address: model.startAddress,
                        ),
                      ),
                    ),
                    TimelineTile(
                      alignment: TimelineAlign.start,
                      indicatorStyle: const IndicatorStyle(
                        indicatorXY: 0,
                        indicator: Padding(
                          padding: EdgeInsets.only(top: 0, right: 2, bottom: 10),
                          child: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Color.fromRGBO(0, 145, 255, 1),
                            size: 16,
                          ),
                        ),
                      ),
                      beforeLineStyle: const LineStyle(
                        thickness: 8,
                        color: Color.fromRGBO(2, 128, 255, 0.07),
                      ),
                      afterLineStyle: const LineStyle(
                        thickness: 8,
                        color: Color.fromRGBO(2, 128, 255, 0.07),
                      ),
                      endChild: const SizedBox.shrink(),
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
                        padding: const EdgeInsets.only(left: 22.0, top: 18),
                        child: VehicleTripAddressLabel(
                          time: Jiffy.parseFromDateTime(model.endTime)
                              .addDuration(const Duration(hours: 5, minutes: 45))
                              .format(pattern: 'MMMM d, h:mm a'),
                          address: model.endAddress,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color.fromRGBO(241, 241, 241, 1),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VehicleTripAttribute(
                        icon: SvgPicture.asset('assets/icons/statistics/distance.svg', height: 14, width: 14),
                        value: '${model.distanceInKm}',
                        unit: context.locale.km,
                        label: context.locale.distance,
                      ),
                      VehicleTripAttribute(
                        icon: SvgPicture.asset('assets/icons/statistics/trip_avg_speed.svg', height: 10, width: 10),
                        value: AppHelper.formatSpeed(model.averageSpeed),
                        unit: context.locale.km_per_hour,
                        label: context.locale.avg_speed,
                      ),
                      VehicleTripAttribute(
                        icon: SvgPicture.asset('assets/icons/statistics/runtime.svg', height: 10, width: 10),
                        value: model.duration.inMinutes.toString(),
                        unit: context.locale.mins,
                        label: context.locale.runTime,
                      ),
                      //   VehicleTripDuration(duration: model.duration, label: context.locale.runTime),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
