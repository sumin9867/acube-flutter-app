import 'package:flutter/material.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/info/widgets/metric_card.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/info/widgets/metric_row.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/info/widgets/vehicle_detail_header.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:intl/intl.dart';

class VehicleInfoScreen extends StatefulWidget {
  const VehicleInfoScreen({
    super.key,
    required this.model,
  });

  final Device model;

  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {
  final webSocketCubit = locator.get<WebsocketCubit>();

  late double titleFontSize;
  late double sectionSpacing;

  @override
  void initState() {
    webSocketCubit.disconnect();
    super.initState();
  }

  @override
  void dispose() {
    webSocketCubit.reconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive values
    titleFontSize = screenWidth * 0.033; // ~16px on small screens
    sectionSpacing = screenWidth * 0.018; // ~12-14px

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          context.locale.vehicleInfo,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color.fromRGBO(24, 24, 24, 1)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                color: AppColors.background,
                child: VehicleDetailsHeader(model: widget.model)),
            Container(
              color: AppColors.background,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle(
                    'Connectivity',
                  ),
                  SizedBox(height: sectionSpacing),
                  MetricRow(
                    first: MetricCard(
                      svgAsset: 'phone_number.svg',
                      value: widget.model.phone ?? context.locale.nA,
                      label: context.locale.phoneNumberSim,
                    ),
                    second: MetricCard(
                      svgAsset: 'imei.svg',
                      value: widget.model.uniqueId,
                      label: context.locale.imeiNumber,
                    ),
                  ),
                  _sectionTitle(
                    context.locale.basicMetrics,
                  ),
                  SizedBox(height: sectionSpacing),
                  MetricRow(
                    first: MetricCard(
                      width: double.infinity,
                      svgAsset: 'total_distance.svg',
                      value:
                          '${((widget.model.position?.attributes?.totalDistance ?? 0) / 1000).toStringAsFixed(2)} km',
                      label: context.locale.totalDistance,
                    ),
                    second: MetricCard(
                      svgAsset: 'speed.svg',
                      value:
                          '${widget.model.position?.speed != null ? AppHelper.formatSpeed(widget.model.position!.speed) : '0.00'} km/h',
                      label: context.locale.speed,
                    ),
                  ),
                  SizedBox(height: sectionSpacing * 1),
                  _sectionTitle(
                    context.locale.timestampAndPosition,
                  ),
                  SizedBox(height: sectionSpacing),
                  MetricRow(
                    first: MetricCard(
                      svgAsset: 'time.svg',
                      value: widget.model.position?.deviceTime != null
                          ? formatDateTime(widget.model.position!.deviceTime)
                          : '-',
                      label: context.locale.time,
                    ),
                    second: MetricCard(
                      svgAsset: 'course.svg',
                      value: widget.model.position?.course != null
                          ? AppHelper.getCourseDirection(widget.model.position!.course)
                          : '0.00°',
                      label: context.locale.course,
                    ),
                  ),
                  SizedBox(height: sectionSpacing * 1.3),
                  MetricRow(
                    first: MetricCard(
                      svgAsset: 'location_on.svg',
                      value: widget.model.position?.latitude != null
                          ? formatLatLng(widget.model.position!.latitude, isLatitude: true)
                          : '-',
                      label: context.locale.latitude,
                    ),
                    second: MetricCard(
                      svgAsset: 'location_on.svg',
                      value: widget.model.position?.longitude != null
                          ? formatLatLng(widget.model.position!.longitude, isLatitude: false)
                          : '-',
                      label: context.locale.longitude,
                    ),
                  ),
                  SizedBox(height: sectionSpacing * 1.3),
                  _sectionTitle(context.locale.batteryAndCharging),
                  SizedBox(height: sectionSpacing),
                  MetricRow(
                    first: MetricCard(
                      svgAsset: 'charge.svg',
                      value: (widget.model.position?.attributes?.charge == true) ? 'Yes' : 'No',
                      label: context.locale.charge,
                    ),
                    second: MetricCard(
                      svgAsset: 'Battery.svg',
                      value: '${widget.model.position?.attributes?.batteryLevel?.toString() ?? '66'}%',
                      label: context.locale.battery,
                    ),
                  ),
                  SizedBox(height: sectionSpacing * 1.3),
                  _sectionTitle(context.locale.vehicleState),
                  SizedBox(height: sectionSpacing),
                  MetricRow(
                    first: MetricCard(
                      svgAsset: 'speed.svg',
                      value: widget.model.position?.attributes?.sat?.toString() ?? 'N/A',
                      label: context.locale.satellite,
                    ),
                    second: MetricCard(
                      svgAsset: 'protocol.svg',
                      value: widget.model.position?.protocol ?? '-',
                      label: context.locale.protocol,
                    ),
                  ),
                  SizedBox(height: sectionSpacing * 1.3),
                  MetricRow(
                    first: MetricCard(
                      svgAsset: 'igntion.svg',
                      value: widget.model.position?.attributes?.ignition == null
                          ? '-'
                          : widget.model.position!.attributes!.ignition!
                              ? 'ON'
                              : 'OFF',
                      label: context.locale.ignition,
                    ),
                    second: MetricCard(
                      svgAsset: 'blocked.svg',
                      value: widget.model.position?.attributes?.blocked == true ? 'Yes' : 'No',
                      label: context.locale.blocked,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: sectionSpacing),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.sectionTitle,
          fontWeight: FontWeight.w600,
          fontSize: titleFontSize,
        ),
      ),
    );
  }
}

String formatDateTime(String deviceTime) {
  final dateTime = DateTime.parse(deviceTime).toLocal();
  return DateFormat('d MMM, hh:mm a').format(dateTime);
}

String formatLatLng(double value, {required bool isLatitude}) {
  final direction = isLatitude ? (value >= 0 ? 'N' : 'S') : (value >= 0 ? 'E' : 'W');

  final double absValue = value.abs();
  final int degrees = absValue.floor();
  final double minutes = (absValue - degrees) * 60;

  return '$degrees° ${minutes.toStringAsFixed(4)}′ $direction';
}
