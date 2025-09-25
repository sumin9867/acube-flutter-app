import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/tabs/telematics/cubit/vehicle_telematics_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/error_screen.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryTelemetics extends StatelessWidget {
  const SummaryTelemetics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleTelematicsCubit, VehicleTelematicsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (message) => ErrorScreen(
            title: context.locale.somethingWentWrong,
            message: message,
            onRetry: () {
              context.read<VehicleTelematicsCubit>().fetchVehicleTelematics();
            },
          ),
          idle: (VehicleTelematicsViewModel viewModel) {
            log('I am telematcis data ${viewModel.averageSpeed}');
            final labelIntersectAction = (viewModel.averageSpeed as List).length > 7
                ? AxisLabelIntersectAction.rotate90
                : AxisLabelIntersectAction.hide;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      context.locale.averageSpeed,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: const Color.fromRGBO(100, 100, 100, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(color: const Color.fromRGBO(241, 241, 241, 1), width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.locale.avg_speed,
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(100, 100, 100, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )),
                                    Text('${viewModel.avgSpeed.toStringAsFixed(1)} Km/h',
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(48, 164, 108, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.locale.topSpeed,
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(100, 100, 100, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )),
                                    Text('${viewModel.topSpeed.toStringAsFixed(2) ?? '0.0'} Km/h',
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(24, 24, 24, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryXAxis: CategoryAxis(
                              axisLine: const AxisLine(width: 0),
                              interval: 1,
                              labelPosition: ChartDataLabelPosition.outside,
                              labelIntersectAction: labelIntersectAction,
                              axisLabelFormatter: (axisLabelRenderArgs) {
                                final dateTime = Jiffy.parse(axisLabelRenderArgs.text);
                                return ChartAxisLabel(dateTime.format(pattern: 'MMM d'), const TextStyle());
                              },
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(width: 0),
                            ),
                            primaryYAxis: const NumericAxis(
                              axisLine: AxisLine(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                              interval: 10,
                              minimum: 0,
                              // maximum: getYAxisMaximum(viewModel.averageSpeed),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(141, 141, 141, 1),
                                fontWeight: FontWeight.w400,
                              ),
                              labelFormat: '{value}',
                              majorGridLines: MajorGridLines(
                                width: 1.5,
                                dashArray: <double>[5, 5],
                              ),
                            ),
                            series: <ColumnSeries<dynamic, DateTime>>[
                              ColumnSeries<dynamic, DateTime>(
                                width: 0.5,
                                color: const Color.fromRGBO(2, 186, 60, 0.09),
                                pointColorMapper: (sales, _) {
                                  final DateTime date = sales.$1 as DateTime;

                                  final bool isToday = DateUtils.dateOnly(date) == DateUtils.dateOnly(DateTime.now());

                                  return isToday
                                      ? const Color.fromRGBO(48, 164, 108, 1)
                                      : const Color.fromRGBO(2, 186, 60, 0.5);
                                },
                                dataLabelSettings: const DataLabelSettings(isVisible: false),
                                dataSource: viewModel.averageSpeed,
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                                xValueMapper: (sales, _) => sales.$1 as DateTime,
                                yValueMapper: (sales, _) => sales.$2,
                              ),
                            ],
                            tooltipBehavior: TooltipBehavior(
                                enable: true,
                                header: '',
                                canShowMarker: false,
                                borderWidth: 4,
                                elevation: 5,
                                format: 'point.y Km/h',
                                textStyle: context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w400, color: const Color.fromRGBO(255, 255, 255, 1)),
                                color: const Color.fromRGBO(48, 164, 108, 1)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppText(
                      context.locale.distance,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: const Color.fromRGBO(100, 100, 100, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(color: const Color.fromRGBO(241, 241, 241, 1), width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.locale.covered,
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(100, 100, 100, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )),
                                    Text('${viewModel.totalDistance.toStringAsFixed(2)} Km',
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(48, 164, 108, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.locale.longestDistance,
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(100, 100, 100, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )),
                                    Text('${viewModel.longestDistance.toStringAsFixed(2)} Km',
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(24, 24, 24, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryXAxis: CategoryAxis(
                              axisLine: const AxisLine(width: 0),
                              interval: 1,
                              labelPosition: ChartDataLabelPosition.outside,
                              labelIntersectAction: labelIntersectAction,
                              axisLabelFormatter: (axisLabelRenderArgs) {
                                final dateTime = Jiffy.parse(axisLabelRenderArgs.text);
                                return ChartAxisLabel(dateTime.format(pattern: 'MMM d'), const TextStyle());
                              },
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(width: 0),
                            ),
                            primaryYAxis: const NumericAxis(
                              axisLine: AxisLine(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                              interval: 20,
                              minimum: 0,
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(141, 141, 141, 1),
                                fontWeight: FontWeight.w400,
                              ),
                              labelFormat: '{value}',
                              majorGridLines: MajorGridLines(
                                width: 1.5,
                                dashArray: <double>[5, 5],
                              ),
                            ),
                            tooltipBehavior: TooltipBehavior(
                                enable: true,
                                header: '',
                                canShowMarker: false,
                                borderWidth: 4,
                                elevation: 5,
                                format: 'point.y Km',
                                textStyle: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                                color: const Color.fromRGBO(8, 128, 234, 1)),
                            series: <ColumnSeries<dynamic, DateTime>>[
                              ColumnSeries<dynamic, DateTime>(
                                width: 0.5,
                                color: context.colorScheme.primary,
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: false,
                                ),
                                pointColorMapper: (sales, _) {
                                  final DateTime date = sales.$1 as DateTime;

                                  final bool isToday = DateUtils.dateOnly(date) == DateUtils.dateOnly(DateTime.now());

                                  return isToday
                                      ? const Color.fromRGBO(8, 128, 234, 1)
                                      : const Color.fromRGBO(1, 131, 250, 0.5);
                                },
                                dataSource: viewModel.distance,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(6),
                                ),
                                xValueMapper: (sales, _) => sales.$1 as DateTime,
                                yValueMapper: (sales, _) => sales.$2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppText(
                      context.locale.engineRuntime,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: const Color.fromRGBO(100, 100, 100, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(color: const Color.fromRGBO(241, 241, 241, 1), width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.locale.totalRuntime,
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(100, 100, 100, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )),
                                    Row(
                                      children: [
                                        Text('${viewModel.totalRuntime} ${context.locale.mins}',
                                            style: context.textTheme.titleLarge?.copyWith(
                                              color: const Color.fromRGBO(48, 164, 108, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            )),
                                        Text(
                                            ' (${(viewModel.totalRuntime / 60).toStringAsFixed(2)} ${context.locale.hour})',
                                            style: context.textTheme.titleLarge?.copyWith(
                                              color: const Color.fromRGBO(48, 164, 108, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(context.locale.longestRuntime,
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(100, 100, 100, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        )),
                                    Text('${viewModel.longestRuntime.toStringAsFixed(2)} ${context.locale.mins}',
                                        style: context.textTheme.titleLarge?.copyWith(
                                          color: const Color.fromRGBO(24, 24, 24, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryXAxis: CategoryAxis(
                              axisLine: const AxisLine(width: 0),
                              interval: 1,
                              labelPosition: ChartDataLabelPosition.outside,
                              labelIntersectAction: labelIntersectAction,
                              axisLabelFormatter: (axisLabelRenderArgs) {
                                final dateTime = Jiffy.parse(axisLabelRenderArgs.text);
                                return ChartAxisLabel(dateTime.format(pattern: 'MMM d'), const TextStyle());
                              },
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(width: 0),
                            ),
                            primaryYAxis: const NumericAxis(
                              axisLine: AxisLine(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                              interval: 20,
                              minimum: 0,
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(141, 141, 141, 1),
                                fontWeight: FontWeight.w400,
                              ),
                              labelFormat: '{value}',
                              majorGridLines: MajorGridLines(
                                width: 1.5,
                                dashArray: <double>[5, 5],
                              ),
                            ),
                            series: <ColumnSeries<dynamic, DateTime>>[
                              ColumnSeries<dynamic, DateTime>(
                                width: 0.5,
                                color: context.colorScheme.primary,
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: false,
                                ),
                                pointColorMapper: (sales, _) {
                                  final DateTime date = sales.$1 as DateTime;

                                  final bool isToday = DateUtils.dateOnly(date) == DateUtils.dateOnly(DateTime.now());

                                  return isToday
                                      ? const Color.fromRGBO(247, 104, 8, 1)
                                      : const Color.fromRGBO(255, 145, 1, 0.5);
                                },
                                dataSource: viewModel.runTime,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(6),
                                ),
                                xValueMapper: (sales, _) => sales.$1 as DateTime,
                                yValueMapper: (sales, _) => sales.$2,
                              ),
                            ],
                            tooltipBehavior: TooltipBehavior(
                                enable: true,
                                header: '',
                                canShowMarker: false,
                                borderWidth: 4,
                                elevation: 5,
                                format: 'point.y mins',
                                textStyle: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                                color: const Color.fromRGBO(247, 104, 8, 1)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

VehicleTelematicsViewModel appendMissingWeekDays(VehicleTelematicsViewModel viewModel) {
  final startOfWeek = Jiffy.parseFromDateTime(viewModel.startDate).startOf(Unit.week).dateTime;

  final allWeekDays = <DateTime>[for (int i = 0; i < 7; i++) startOfWeek.add(Duration(days: i))];

  List<T> fillMissingDays<T>(
    List<T> originalList,
    T Function(DateTime day) mapper,
    DateTime Function(T item) getDate,
  ) {
    final existingDates = originalList.map(getDate).toSet();

    final missing = allWeekDays.where((day) => !existingDates.any((d) => isSameDay(d, day)));

    return [
      ...originalList,
      ...missing.map(mapper),
    ]..sort((a, b) => getDate(a).compareTo(getDate(b)));
  }

  viewModel = viewModel.copyWith(
    distance: fillMissingDays(
      viewModel.distance,
      (day) => (day, 0.0),
      (item) => item.$1!,
    ),
    averageSpeed: fillMissingDays(
      viewModel.averageSpeed,
      (day) => (day, 0.0),
      (item) => item.$1!,
    ),
    runTime: fillMissingDays(
      viewModel.runTime,
      (day) => (day, 0.0),
      (item) => item.$1!,
    ),
  );

  return viewModel;
}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
