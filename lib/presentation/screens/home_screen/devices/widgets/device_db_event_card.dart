// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/app_shadow.dart';
import 'package:gpspro/presentation/screens/home_screen/events/events_map.dart';
import 'package:jiffy/jiffy.dart';

class VehicleDashboardEventCard extends StatelessWidget {
  const VehicleDashboardEventCard({
    super.key,
    required this.event,
  });

  final VehicleEvent event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (event.positionId != null) {
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
                  child: EventsMap(vehicleEvent: event),
                ),
              );
            },
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 14.0,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [AppShadow.normal],
          border: Border.all(
            color: Colors.black12, // Change this to any color you prefer
            width: 1, // Adjust the border thickness
          ),
        ),
        child: Row(
          children: [
            getSvgIcon(context, event.type),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.type.camelCaseToSentence,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Jiffy.parseFromDateTime(event.eventTime)
                        .add(hours: 11, minutes: 30)
                        .format(pattern: 'EEEE, MMM dd, yyyy'),
                    style: context.textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  color: context.colorScheme.onSurface,
                ),
                Text(
                  Jiffy.parseFromDateTime(event.eventTime).add(hours: 11, minutes: 30).jm,
                  style: context.textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getSvgIcon(BuildContext context, String type) {
    switch (type) {
      case 'geoFenceEnter':
      case 'geoFenceExit':
        return SvgPicture.asset(
          Assets.icons.events.geofenceSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );

      case 'ignitionOff':
      case 'ignitionOn':
        return SvgPicture.asset(
          Assets.icons.events.ignitionSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );

      case 'vibration':
        return SvgPicture.asset(
          Assets.icons.events.vibrationSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );
      case 'alarm':
        return SvgPicture.asset(
          Assets.icons.events.deviceAlarmSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );
      case 'maintenance':
        return SvgPicture.asset(
          Assets.icons.events.maintenance.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );
      case 'command':
        return SvgPicture.asset(
          Assets.icons.events.commandSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );
      case 'deviceOverspeed':
        return SvgPicture.asset(
          Assets.icons.events.overspeedSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );
      case 'accident':
        return SvgPicture.asset(
          Assets.icons.events.accidentSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );
      default:
        // Return a default icon if no match
        return SvgPicture.asset(
          Assets.icons.events.ignitionSvg.path,
          width: 30,
          color: context.colorScheme.primary,
          height: 30,
          fit: BoxFit.contain,
        );
    }
  }
}
