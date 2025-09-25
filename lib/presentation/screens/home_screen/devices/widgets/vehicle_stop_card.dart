import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/vehicle_details/vehicle_map_stop_page.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VehicleStopCard extends StatelessWidget {
  const VehicleStopCard({
    super.key,
    required this.model,
  });

  final VehicleStop model;

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;
    const contentPadding = EdgeInsets.fromLTRB(18, 0, 18, 0);

    return Container(
      margin: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
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
                  height: MediaQuery.of(context).size.height * .6,
                  width: MediaQuery.of(context).size.width * .9,
                  child: VehicleMapStopPage(stops: model),
                ),
              );
            },
          );
          // RouteHelper.pushDeviceMapStopDetailsPage(
          //   VehicleMapStopRouteParams(
          //     stop: model,
          //   ),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: contentPadding,
                child: Column(
                  children: [
                    TimelineTile(
                      isFirst: true,
                      indicatorStyle: IndicatorStyle(
                        indicatorXY: 0.55,
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
                          Jiffy.parseFromDateTime(model.startTime)
                              .add(hours: 5, minutes: 45)
                              .format(pattern: 'MMMM d, h:mm a'),
                          model.address ?? l10n.unavailable,
                        ),
                      ),
                    ),
                    TimelineTile(
                      isLast: true,
                      indicatorStyle: IndicatorStyle(
                        indicatorXY: 0.6,
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
                          Jiffy.parseFromDateTime(model.endTime)
                              .add(hours: 5, minutes: 45)
                              .format(pattern: 'MMMM d, h:mm a'),
                          model.address ?? l10n.unavailable,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: contentPadding,
                child: _buildDurationView(
                  context,
                  model.duration,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTimeLabel(BuildContext context, String time) {
    return Text(
      time,
      style: context.textTheme.titleMedium?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Column _buildTimeAddressLabel(BuildContext context, String time, String address) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SvgPicture.asset('assets/icons/statistics/location.svg'),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                address,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Color.fromRGBO(141, 141, 141, 1),
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  height: 16 / 12,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    return h > 0 ? '$h hr $m min' : '$m min';
  }

  Column _buildDurationView(BuildContext context, Duration duration) {
    final l10n = context.locale;
    const commonStyle = TextStyle(
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      color: Colors.black,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/statistics/stop.svg'),
            const SizedBox(width: 6),
            Text(
              l10n.stopDuration,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12,
                height: 16 / 12,
                letterSpacing: -0.3,
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          _formatDuration(duration),
          style: commonStyle,
        ),
      ],
    );
  }
}
