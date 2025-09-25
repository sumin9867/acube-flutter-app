import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timelines/timelines.dart';

enum SummaryType { stop, trip }

class SummaryItem {
  final SummaryType type;
  final VehicleStop? stop;
  final VehicleTrip? trip;

  SummaryItem.stop(this.stop)
      : type = SummaryType.stop,
        trip = null;

  SummaryItem.trip(this.trip)
      : type = SummaryType.trip,
        stop = null;
}

class SummaryList extends StatelessWidget {
  final List<VehicleStop> stop;
  final List<VehicleTrip> trip;
  final void Function(VehicleStop stop) onStopTap;

  const SummaryList({
    super.key,
    required this.stop,
    required this.trip,
    required this.onStopTap,
  });

  List<SummaryItem> buildSummaryList(List<VehicleStop> stops, List<VehicleTrip> trips) {
    final List<SummaryItem> summary = [];

    final reversedTrips = trips.toList();

    for (int i = 0; i < stops.length; i++) {
      summary.add(SummaryItem.stop(stops[i]));
      if (i < reversedTrips.length) {
        summary.add(SummaryItem.trip(reversedTrips[i]));
      }
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = buildSummaryList(stop, trip);
    final size = MediaQuery.of(context).size;
    final scale = size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(vertical: scale * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FixedTimeline.tileBuilder(
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.after,
            itemCount: summary.length,
            // indicatorPositionBuilder: (_, __) => 0.25,
            contentsAlign: ContentsAlign.basic,
            nodePositionBuilder: (_, __) => 0.035,
            contentsBuilder: (context, index) {
              final item = summary[index];

              return switch (item.type) {
                SummaryType.stop => GestureDetector(
                    onTap: () {
                      log('i am tapped');
                      onStopTap(item.stop!);
                    },
                    child: _buildStopItem(
                      item.stop!,
                      context,
                      index,
                      summary,
                      scale,
                    ),
                  ),
                SummaryType.trip => _buildTripItem(item.trip!, trip.indexOf(item.trip!), scale, context),
              };
            },
            indicatorBuilder: (context, index) {
              final item = summary[index];
              final imageHeight = scale * 0.03;
              final isLastItem = index == summary.length - 1;

              if (item.type == SummaryType.stop) {
                if (index == 0) {
                  return SvgPicture.asset('assets/icons/playback/start.svg', height: imageHeight);
                } else if (isLastItem) {
                  return SvgPicture.asset('assets/icons/playback/green_location.svg', height: imageHeight);
                } else {
                  return SvgPicture.asset('assets/icons/playback/stop.svg', height: imageHeight);
                }
              } else {
                return SizedBox(width: imageHeight);
              }
            },
            connectorBuilder: (_, index, __) {
              return const Stack(
                alignment: Alignment.center,
                children: [
                  DecoratedLineConnector(
                    thickness: 8,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(2, 128, 255, 0.09),
                    ),
                  ),
                  Positioned(
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 24.0,
                      color: Color.fromRGBO(8, 128, 234, 1),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStopItem(
    VehicleStop stop,
    BuildContext context,
    int index,
    List<SummaryItem> summary,
    double scale,
  ) {
    final isFirst = index == 0;
    final isLast = index == summary.length - 1;
    final title = isFirst
        ? context.locale.startedFrom
        : isLast
            ? context.locale.arrivedOn
            : context.locale.stoppedAt;

    final timeText = isFirst
        ? formatTimeWithOffset(stop.endTime)
        : isLast
            ? formatTimeWithOffset(stop.endTime)
            : '${formatTimeWithOffset(stop.startTime)} - ${formatTimeWithOffset(stop.endTime)}';

    return Padding(
      padding: EdgeInsets.only(left: scale * 0.02, right: scale * 0.02, bottom: scale * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: title == context.locale.stoppedAt ? Colors.red : const Color.fromRGBO(100, 100, 100, 1),
              fontWeight: FontWeight.w500,
              fontSize: scale * 0.011,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: Text(
                  stop.address ?? '',
                  style: TextStyle(
                    fontSize: scale * 0.014,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: scale * 0.014,
                color: const Color.fromRGBO(128, 128, 128, 1),
              )
            ],
          ),
          SizedBox(
            height: scale * 0.003,
          ),
          isFirst || isLast
              ? Text(
                  timeText,
                  style: TextStyle(
                    fontSize: scale * 0.011,
                    color: const Color.fromRGBO(141, 141, 141, 1),
                    fontWeight: FontWeight.w600,
                  ),
                )
              : RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: scale * 0.014,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: '${formatDuration(stop.duration, context)} ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: scale * 0.012,
                          )),
                      TextSpan(
                        text: '($timeText)',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: scale * 0.012,
                          color: const Color.fromRGBO(141, 141, 141, 1),
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(
            height: scale * 0.014,
          ),
          const Divider(
            thickness: 0.5,
            height: 0.5,
          ),
        ],
      ),
    );
  }

  Widget _buildTripItem(VehicleTrip trip, int tripIndex, double scale, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: scale * 0.02, bottom: scale * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${getOrdinal(tripIndex + 1)} ${context.locale.trip}',
            style: TextStyle(
              color: const Color.fromRGBO(100, 100, 100, .7),
              fontWeight: FontWeight.w600,
              fontSize: scale * 0.012,
            ),
          ),
          SizedBox(
            height: scale * 0.006,
          ),
          Text(
            '${trip.distanceInKm} ${context.locale.km}',
            style: TextStyle(
              fontSize: scale * 0.014,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: scale * 0.003,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: scale * 0.014,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: '${formatDuration(trip.duration, context)} ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: scale * 0.012,
                    )),
                TextSpan(
                  text: '(${formatTimeWithOffset(trip.startTime)} - ${formatTimeWithOffset(trip.endTime)})',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: scale * 0.012,
                    color: const Color.fromRGBO(141, 141, 141, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: scale * 0.014,
          ),
          const Divider(
            thickness: 0.5,
            height: 0.5,
          ),
        ],
      ),
    );
  }

  String formatTime(DateTime time, BuildContext context) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final ampm = time.hour >= 12 ? ' PM' : ' AM';
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute$ampm';
  }

  String formatTimeWithOffset(DateTime time) {
    return Jiffy.parseFromDateTime(time).addDuration(const Duration(hours: 5, minutes: 45)).format(pattern: 'h:mm a');
  }

  String formatDuration(Duration duration, BuildContext context) {
    if (duration.inSeconds < 60) return '${duration.inSeconds} ${context.locale.seconds}';
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes${context.locale.minutes} $seconds${context.locale.seconds}';
  }

  String getOrdinal(int number) {
    if (number >= 11 && number <= 13) return '${number}th';
    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }
}
