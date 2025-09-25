import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:jiffy/jiffy.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final VehicleEvent event;
  String _buildEventText(String type, Map<String, dynamic>? attributes) {
    if (type.toLowerCase() == 'alarm') {
      final alarmValue = attributes?['alarm']?.toString().toLowerCase();

      final Map<String, String> alarmTitles = {
        'sos': 'Emergency SOS Triggered',
        'overspeed': 'Overspeed Detected',
        'vibration': 'Unusual Vibration Detected',
        'powercut': 'Power Cut Alert',
        'lowbattery': 'Low Battery Warning',
        'movement': 'Movement Detected',
        'accident': 'Possible Accident Detected',
        'hardacceleration': 'Hard Acceleration Detected',
        'hardbraking': 'Hard Braking Detected',
        'hardcornering': 'Hard Cornering Detected',
        'tampering': 'Tampering Detected',
        'lowpower': 'Low Power Warning',
      };

      return alarmTitles[alarmValue] ?? 'Alarm - ${alarmValue ?? 'Unknown'}';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    final isEntry = event.type == 'geofenceEnter';
    final isExit = event.type == 'geofenceExit';
    final primaryText = event.type == 'alarm'
        ? _buildEventText(event.type, event.attributes)
        : event.type == 'deviceOverspeed'
            ? 'Over Speeding at ${(event.attributes?['speed'] != null ? (double.tryParse(event.attributes!['speed'].toString()) != null ? (double.parse(event.attributes!['speed'].toString()) * 1.852).round() : 'Unknown') : 'Unknown')} km/h'
            : isEntry
                ? 'Entered Geofence'
                : isExit
                    ? 'Exited from Geofence'
                    : event.type.camelCaseToSentence;

    final Color indicatorColor = _getEventIndicatorColor(context, event.type);

    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
          border: Border.all(color: Colors.black12, width: 0.3),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: getEventIcon(event.type).svg(
                width: 24,
                height: 24,
                color: context.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    primaryText,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    event.deviceName ?? '',
                    style: context.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  Jiffy.parseFromDateTime(event.eventTime).add(hours: 11, minutes: 30).jm,
                  style: context.textTheme.labelMedium?.copyWith(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
          top: 10,
          bottom: 10,
          left: 0,
          child: Container(
            height: 1,
            width: 4.5,
            decoration: BoxDecoration(
              color: indicatorColor,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(32), bottomRight: Radius.circular(32)),
            ),
          ))
    ]);
  }

  SvgGenImage getEventIcon(String type) {
    switch (type) {
      case 'ignitionOn':
      case 'ignitionOff':
        return Assets.icons.events.ignitionSvg;
      case 'geofenceEnter':
      case 'geofenceExit':
        return Assets.icons.events.geofenceSvg;
      case 'overspeed':
        return Assets.icons.events.overspeedSvg;
      case 'deviceOffline':
        return Assets.icons.events.deviceOfflineSvg;
      case 'stopped':
        return Assets.icons.events.stopSvg;
      case 'commandResult':
        return Assets.icons.events.commandSvg;
      case 'alarm':
      case 'accident':
      case 'hardAcceleration':
      case 'hardBraking':
      case 'hardCornering':
      case 'powercut':
      case 'tampering':
      case 'lowPower':
        return Assets.icons.events.deviceAlarmSvg;
      case 'vibration':
        return Assets.icons.events.vibrationSvg;
      case 'moving':
        return Assets.icons.events.movingSvg;
      default:
        return Assets.icons.events.deviceAlarmSvg;
    }
  }

  Color _getEventIndicatorColor(BuildContext context, String type) {
    if (type == 'alarm' || type == 'deviceOverspeed' || type == 'ignitionOff') {
      return Colors.red;
    } else if (type == 'ignitionOn') {
      return Colors.green;
    } else if (type == 'geofenceExit') {
      return Colors.orange;
    } else if (type == 'geofenceEnter') {
      return context.colorScheme.primary;
    } else {
      return Colors.grey;
    }
  }
}
