import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/Summary.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/tabs/telematics/cubit/vehicle_telematics_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/widget/data_card.dart';

class VehicleDashboardSummaryView extends StatefulWidget {
  const VehicleDashboardSummaryView({
    super.key,
    required this.summary,
    required this.model,
  });

  final Summary summary;
  final Device model;

  @override
  State<VehicleDashboardSummaryView> createState() => _VehicleDashboardSummaryViewState();
}

class _VehicleDashboardSummaryViewState extends State<VehicleDashboardSummaryView> {
  @override
  void initState() {
    super.initState();
    context.read<VehicleTelematicsCubit>().initialize(deviceId: widget.model.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ListTile(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(12),
            //     side: const BorderSide(color: Color(0xFFF1F1F1), width: 1),
            //   ),
            //   tileColor: Colors.white,
            //   contentPadding: const EdgeInsets.all(8),
            //   dense: true,
            //   leading: ClipRRect(
            //     borderRadius: BorderRadius.circular(8),
            //     child: AppHelper.getVehicleImage(widget.model).image(
            //       width: 48,
            //       height: 48,
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            //   title: Text(
            //     '${context.locale.review_playback} ${DateFormat('dd MMMM').format(DateTime.now())}',
            //     style: const TextStyle(
            //       fontFamily: 'SF Pro',
            //       fontWeight: FontWeight.w600,
            //       fontSize: 16,
            //       height: 1.5,
            //       letterSpacing: -0.3,
            //       color: Color(0xFF181818),
            //     ),
            //   ),
            //   subtitle: Text(
            //     widget.model.name,
            //     style: const TextStyle(
            //       fontFamily: 'SF Pro',
            //       fontWeight: FontWeight.w400,
            //       fontSize: 14,
            //       height: 1.43,
            //       letterSpacing: -0.3,
            //       color: Color(0xFF646464),
            //     ),
            //   ),
            //   trailing: const Icon(
            //     Icons.arrow_forward_ios_rounded,
            //     size: 16,
            //     color: Color(0xFF808080),
            //   ),
            //   onTap: () {
            //     RouteHelper.pushVehiclePlaybackPage(
            //       VehiclePlaybackRouteParams(
            //         vehicleId: widget.model.id.toString(),
            //       ),
            //     );
            //   },
            // ),
            // const SizedBox(height: 16),
            AppText(
              context.locale.statistics,
              style: context.textTheme.titleLarge?.copyWith(
                color: const Color.fromRGBO(100, 100, 100, 1),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                DataCard(
                  icon: 'route_length',
                  data: widget.summary.distanceInKm != null
                      ? '${widget.summary.distanceInKm!.toStringAsFixed(2)} ${context.locale.km}'
                      : '0 ${context.locale.km}',
                  label: context.locale.route_length,
                ),
                const SizedBox(width: 10),
                DataCard(
                  icon: 'engine_duration',
                  data: widget.summary.averageSpeedInKm != null
                      ? '${widget.summary.averageSpeedInKm!.toStringAsFixed(2)} ${context.locale.km_per_hour}'
                      : '0 ${context.locale.km_per_hour}',
                  label: context.locale.avg_speed,
                ),
              ],
            ),
            Row(
              children: [
                DataCard(
                  icon: 'supply_fuel',
                  data: widget.summary.spentFuel != null
                      ? '${widget.summary.spentFuel!.toStringAsFixed(2)} ${context.locale.litre}'
                      : '0 ${context.locale.litre}',
                  label: context.locale.spent_fuel,
                ),
                const SizedBox(width: 10),
                DataCard(
                  icon: 'engine_duration',
                  data: widget.summary.engineHours != null
                      ? '${widget.summary.engineHours!.inHours} ${context.locale.hour} ${widget.summary.engineHours!.inMinutes.remainder(60)} ${context.locale.minute}'
                      : '0 ${context.locale.hour} 0 ${context.locale.minute}',
                  label: context.locale.engine_duration,
                ),
              ],
            ),
            Row(
              children: [
                DataCard(
                  icon: 'move_duration',
                  data: widget.summary.tripDuration != null
                      ? '${widget.summary.tripDuration!.inHours} ${context.locale.hour} ${widget.summary.tripDuration!.inMinutes.remainder(60)} ${context.locale.minute}'
                      : '0 ${context.locale.hour} 0 ${context.locale.minute}',
                  label: context.locale.move_duration,
                ),
                const SizedBox(width: 10),
                DataCard(
                  icon: 'stop_duration',
                  data: widget.summary.stopDuration != null
                      ? '${widget.summary.stopDuration!.inHours} ${context.locale.hour} ${widget.summary.stopDuration!.inMinutes.remainder(60)} ${context.locale.minute}'
                      : '0 ${context.locale.hour} 0 ${context.locale.minute}',
                  label: context.locale.stop_duration,
                ),
              ],
            ),
            Row(
              children: [
                DataCard(
                  icon: 'trip_count',
                  data: widget.summary.tripCount != null ? '${widget.summary.tripCount}' : '0',
                  label: context.locale.trip_count,
                ),
                const SizedBox(width: 10),
                DataCard(
                  icon: 'stop_count',
                  data: widget.summary.stopCount != null ? '${widget.summary.stopCount}' : '0',
                  label: context.locale.stop_count,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
