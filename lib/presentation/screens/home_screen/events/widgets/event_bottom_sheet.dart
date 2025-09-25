import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:jiffy/jiffy.dart';

class EventBottomSheet extends StatelessWidget {
  final VehicleEvent vehicleEvent;
  final Device model;
  final String address;

  const EventBottomSheet({
    super.key,
    required this.vehicleEvent,
    required this.model,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final date = Jiffy.parseFromDateTime(vehicleEvent.eventTime).format(pattern: 'EEEE, MMM dd, yyyy');
    final time = Jiffy.parseFromDateTime(vehicleEvent.eventTime).add(hours: 11, minutes: 30).jm;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                model.name,
                style: context.textTheme.titleLarge,
                color: context.colorScheme.primary,
              ),
              const SizedBox(height: 4),
              Text(
                address.isNotEmpty ? address : 'No Address',
                style: context.textTheme.labelLarge,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 0),
              Row(
                children: [
                  AppText(date, style: context.textTheme.labelSmall),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Text('•'),
                  ),
                  AppText(time, style: context.textTheme.labelMedium),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
