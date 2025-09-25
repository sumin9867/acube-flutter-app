import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/gen/l10n/l10n.dart';
import 'package:gpspro/presentation/global_widgets/no_data_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_stop_card.dart';

class VehicleDashboardStopsView extends StatelessWidget {
  const VehicleDashboardStopsView({
    super.key,
    required this.stops,
    required this.device,
  });

  final List<VehicleStop> stops;
  final Device device;

  @override
  Widget build(BuildContext context) {
    if (stops.isEmpty) {
      return Center(
        child: NoDataWidget(
          subtitle: S.of(context).noStopDataFound,
        ),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), // disable internal scrolling
      shrinkWrap: true, // make ListView take only needed height
      itemCount: stops.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
        vertical: 4,
      ),
      itemBuilder: (context, index) {
        // reverse the list order
        final reversedIndex = stops.length - 1 - index;
        final stop = stops[reversedIndex];

        return VehicleStopCard(model: stop);
      },
    );
  }
}
