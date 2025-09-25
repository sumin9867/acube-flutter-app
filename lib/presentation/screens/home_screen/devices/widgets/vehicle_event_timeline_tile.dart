import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/screens/home_screen/events/events_map.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VehicleEventTimelineTile extends StatelessWidget {
  const VehicleEventTimelineTile({
    super.key,
    required this.event,
    required this.isFirst,
    required this.isLast,
    required this.address,
  });

  final VehicleEvent event;
  final bool isFirst;
  final bool isLast;
  final String? address;

  @override
  Widget build(BuildContext context) {
    final formattedTime = Jiffy.parseFromDateTime(event.eventTime).add(hours: 11, minutes: 30).jm;

    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.02,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 27,
        height: 27,
        indicatorXY: 0.4,
        indicator: Center(
          child: eventIconCircle(event.type),
        ),
      ),
      beforeLineStyle: const LineStyle(
        thickness: 8,
        color: Color.fromRGBO(37, 0, 73, 0.05),
      ),
      afterLineStyle: const LineStyle(
        thickness: 8,
        color: Color.fromRGBO(37, 0, 73, 0.05),
      ),
      endChild: Container(
        margin: const EdgeInsets.only(left: 10, right: 16, top: 0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE0E0E0),
              width: 1,
            ),
          ),
        ),
        child: ListTile(
          onTap: () {
            if (event.positionId != null) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .6,
                    width: MediaQuery.of(context).size.width * .9,
                    child: EventsMap(vehicleEvent: event),
                  ),
                ),
              );
            }
          },
          dense: true,
          contentPadding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
          title: Text(
            event.type.camelCaseToSentence,
            style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/statistics/location.svg',
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  address ?? 'No location available',
                  style: context.textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/icons/statistics/dark_clock.svg', width: 13, height: 13),
              const SizedBox(height: 4),
              Text(
                formattedTime,
                style: const TextStyle(
                  color: Color.fromRGBO(24, 24, 24, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget eventIconCircle(String type) {
    log('Event TYpe: $type');
    // Decide circle background color based on event type
    Color bgColor;
    switch (type) {
      case 'accident':
      case 'alarm':
      case 'deviceOverspeed':
      case 'ignitionOff':
      case 'deviceStopped':
        bgColor = Colors.red.shade700; // strong red for warnings
        break;

      default:
        bgColor = Colors.blue; // strong blue for info events
        break;
    }

    // Decide icon asset
    String iconAsset;
    switch (type) {
      case 'geoFenceEnter':
      case 'geoFenceExit':
        iconAsset = 'assets/icons/event_geofence.svg';
        break;
      case 'ignitionOff':
      case 'ignitionOn':
        iconAsset = 'assets/icons/event_igntion.svg';
        break;
      case 'vibration':
        iconAsset = 'assets/icons/event_vibration.svg';
        break;
      case 'deviceStopped':
        iconAsset = 'assets/icons/event_stopped.svg';
        break;
      case 'alarm':
        iconAsset = 'assets/icons/bell.svg';
        break;
      case 'maintenance':
        iconAsset = 'assets/icons/event_maintenance.svg';
        break;
      case 'commandResult':
        iconAsset = 'assets/icons/event_command.svg';
        break;
      case 'deviceOverspeed':
        iconAsset = 'assets/icons/event_overspeed.svg';
        break;
      case 'deviceMoving':
        iconAsset = 'assets/icons/event_moving.svg';
        break;
      case 'accident':
        iconAsset = 'assets/icons/event_accident.svg';
        break;
      default:
        iconAsset = 'assets/icons/bell.svg';
        break;
    }

    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(4), // spacing inside circle
      child: SvgPicture.asset(
        iconAsset,
        fit: BoxFit.contain,
        color: Colors.white, // icon color is always white
      ),
    );
  }
}
