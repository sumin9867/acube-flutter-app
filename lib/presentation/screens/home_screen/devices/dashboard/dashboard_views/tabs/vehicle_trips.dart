import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/l10n/l10n.dart';
import 'package:gpspro/presentation/global_widgets/no_data_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_trip_card.dart';

class VehicleDashboardTripsView extends StatelessWidget {
  const VehicleDashboardTripsView({
    super.key,
    required this.trips,
    required this.device,
  });

  final List<VehicleTrip> trips;
  final Device device;

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Center(
        child: NoDataWidget(subtitle: S.of(context).noTripDataFound),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // disable internal scrolling
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      itemCount: trips.length,
      itemBuilder: (context, index) {
        return VehicleTripCard(model: trips[index]);
      },
    );
  }
}
