import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/summary_widget.dart';

class SummaryTab extends StatelessWidget {
  final List<VehicleTrip> trip;
  const SummaryTab({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SummaryInfo(
            icon: 'total_distance.svg',
            label: context.locale.distance,
            value: calculateTotalDistanceFromTrips(trip, context),
          ),
          SummaryInfo(
            icon: 'speed.svg',
            label: context.locale.speed,
            value: calculateMaxSpeed(trip, context),
          ),
          SummaryInfo(
              icon: 'green_time.svg',
              label: context.locale.time,
              value: formatDurationReadable(calculateExactRuntime(trip), context)),
        ],
      ),
    );
  }

  String formatDuration(Duration duration, BuildContext context) {
    if (duration.inSeconds < 60) {
      return '${duration.inSeconds} ${context.locale.seconds}';
    } else {
      final int minutes = duration.inMinutes;
      final int seconds = duration.inSeconds % 60;
      return '$minutes${context.locale.minuteShort} $seconds${context.locale.secondShort}';
    }
  }

  String calculateTotalDistanceFromTrips(List<VehicleTrip> trips, BuildContext context) {
    if (trips.isEmpty) return '0.00 ${context.locale.km}';

    double totalDistance = 0.0;
    for (var trip in trips) {
      totalDistance += trip.distance / 1000;
    }

    return '${totalDistance.toStringAsFixed(2)} ${context.locale.km}';
  }

  Duration calculateExactRuntime(List<VehicleTrip> trips) {
    if (trips.isEmpty) return Duration.zero;

    final int totalMilliseconds = trips.fold(0, (sum, trip) => sum + trip.duration.inMilliseconds);

    return Duration(milliseconds: totalMilliseconds);
  }

  String formatDurationReadable(Duration duration, BuildContext context) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours${context.locale.hourShort} $minutes${context.locale.minuteShort}';
    } else if (minutes > 0) {
      return '$minutes${context.locale.minuteShort} $seconds${context.locale.secondShort}';
    } else {
      return '$seconds${context.locale.secondShort}';
    }
  }

  String calculateMaxSpeed(List<VehicleTrip> trips, BuildContext context) {
    double maxSpeed = 0.0;

    for (var trip in trips) {
      final double tripMaxSpeed = trip.maxSpeed;
      if (tripMaxSpeed > maxSpeed) {
        maxSpeed = tripMaxSpeed;
      }
    }

    return '${maxSpeed.toStringAsFixed(2)} ${context.locale.kmPerHour} ';
  }
}
