// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gpspro/core/extensions/extensions.dart';
// import 'package:gpspro/domain/enums/date_range_enum.dart';
// import 'package:gpspro/domain/models/Device.dart';
// import 'package:gpspro/gen/assets.gen.dart';
// import 'package:gpspro/presentation/global_widgets/app_text.dart';
// import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/cubit/vehicle_dashboard_cubit.dart';
// import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/dashboard_datepicker_refresh_indicator_wrapper.dart';
// import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/tabs/telematics/cubit/vehicle_telematics_cubit.dart';
// import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_data_range_picker.dart';
// import 'package:gpspro/theme/app_colors.dart';
// import 'package:intl/intl.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class VehicleDashboardTelematicsView extends StatefulWidget {
//   const VehicleDashboardTelematicsView({
//     super.key,
//     required this.device,
//   });
//   final Device device;

//   @override
//   State<VehicleDashboardTelematicsView> createState() =>
//       _VehicleDashboardTelematicsViewState();
// }

// class _VehicleDashboardTelematicsViewState
//     extends State<VehicleDashboardTelematicsView> {
//   @override
//   void initState() {
//     super.initState();
//     context
//         .read<VehicleTelematicsCubit>()
//         .initialize(deviceId: widget.device.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DashboardDatepickerRefreshIndicatorWrapper(
//       step: DashboardStep.summary,
//       datePickerView:
//           BlocBuilder<VehicleTelematicsCubit, VehicleTelematicsState>(
//         builder: (context, state) {
//           return state.maybeWhen(
//             orElse: () => const SizedBox.shrink(),
//             idle: (viewModel) {
//               return InkWell(
//                 onTap: () async {
//                   context.read<VehicleTelematicsCubit>().selectDate();
//                 },
//                 child: VehicleDataRangePickerView(
//                   deviceName: widget.device.name,
//                   deviceImagePath: Assets.images.devices.car.car.path,vhi
//                   range: viewModel.range,
//                   dataRange: DateTimeRange(
//                     start: viewModel.startDate,
//                     end: viewModel.endDate,
//                   ),
//                   model: widget.device,
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       onRefresh: () => context.read<VehicleTelematicsCubit>().refresh(),
//       model: widget.device,
//       child: BlocBuilder<VehicleTelematicsCubit, VehicleTelematicsState>(
//         builder: (context, state) {
//           return state.when(
//             initial: () => const SizedBox.shrink(),
//             loading: () => const Center(
//               child: CircularProgressIndicator(),
//             ),
//             error: (message) => Center(
//               child: Text(message),
//             ),
//             idle: (VehicleTelematicsViewModel viewModel) {
//               final dateFormat = viewModel.range == DataRange.thisMonth
//                   ? DateFormat.MMMd()
//                   : DateFormat('EEE');
//               final labelIntersectAction =
//                   (viewModel.averageSpeed as List).length > 7
//                       ? AxisLabelIntersectAction.rotate90
//                       : AxisLabelIntersectAction.hide;
//               final Color seriesColor1 = context.colorScheme.primary;

//               if (viewModel.range == DataRange.thisWeek &&
//                   (viewModel.distance as List).length < 7) {
//                 viewModel = appendMissingWeekDays(viewModel);
//               }

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     'Distance (Km)',
//                     style: context.textTheme.headlineSmall?.copyWith(
//                       color: context.colorScheme.primary,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     height: MediaQuery.of(context).size.height * .35,
//                     margin: const EdgeInsets.all(8),
//                     decoration: const BoxDecoration(
//                       border: Border(
//                         left: BorderSide(width: 1, color: AppColors.neutral3),
//                         bottom: BorderSide(width: 1, color: AppColors.neutral3),
//                       ),
//                     ),
//                     child: SfCartesianChart(
//                       plotAreaBorderWidth: 0,
//                       primaryXAxis: CategoryAxis(
//                         axisLine: const AxisLine(width: 0),
//                         interval: 1,
//                         labelPosition: ChartDataLabelPosition.outside,
//                         labelIntersectAction: labelIntersectAction,
//                         edgeLabelPlacement: EdgeLabelPlacement.none,
//                         axisLabelFormatter: (axisLabelRenderArgs) {
//                           final dateTime =
//                               Jiffy.parse(axisLabelRenderArgs.text);
//                           return ChartAxisLabel(
//                             dateTime.format(pattern: dateFormat.pattern),
//                             const TextStyle(),
//                           );
//                         },
//                         majorGridLines: const MajorGridLines(width: 0),
//                         majorTickLines: const MajorTickLines(width: 0),
//                       ),
//                       primaryYAxis: const NumericAxis(
//                         isVisible: false,
//                         minimum: 0,
//                       ),
//                       series: <ColumnSeries<dynamic, DateTime>>[
//                         ColumnSeries<dynamic, DateTime>(
//                           width: 0.5,
//                           color: context.colorScheme.primary,
//                           dataLabelSettings: const DataLabelSettings(
//                             isVisible: false,
//                           ),
//                           dataSource: viewModel.distance,
//                           borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(18),
//                           ),
//                           xValueMapper: (sales, _) => sales.$1 as DateTime,
//                           yValueMapper: (sales, _) => sales.$2,
//                         ),
//                       ],
//                       tooltipBehavior: TooltipBehavior(
//                         enable: true,
//                         canShowMarker: false,
//                         borderColor: context.colorScheme.onPrimary,
//                         borderWidth: 4,
//                         elevation: 5,
//                         format: 'point.y Km',
//                         textStyle: context.textTheme.titleMedium?.copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: context.colorScheme.onPrimary,
//                         ),
//                         header: '',
//                         color: context.colorScheme.primary,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   AppText(
//                     'Average Speed (Km/h)',
//                     style: context.textTheme.headlineSmall?.copyWith(
//                       color: context.colorScheme.primary,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * .35,
//                     child: SfCartesianChart(
//                       plotAreaBorderWidth: 0,
//                       primaryXAxis: CategoryAxis(
//                         axisLine: const AxisLine(width: 0),
//                         interval: 1,
//                         labelPosition: ChartDataLabelPosition.outside,
//                         labelIntersectAction: labelIntersectAction,
//                         axisLabelFormatter: (axisLabelRenderArgs) {
//                           final dateTime =
//                               Jiffy.parse(axisLabelRenderArgs.text);
//                           return ChartAxisLabel(
//                               dateTime.format(pattern: dateFormat.pattern),
//                               const TextStyle());
//                         },
//                         majorGridLines: const MajorGridLines(width: 0),
//                         majorTickLines: const MajorTickLines(width: 1),
//                       ),
//                       primaryYAxis: const NumericAxis(
//                         labelFormat: '{value}',
//                         majorGridLines: MajorGridLines(width: 0),
//                       ),
//                       series: <SplineSeries<dynamic, DateTime>>[
//                         SplineSeries<dynamic, DateTime>(
//                           splineType: SplineType.monotonic,
//                           width: 3,
//                           color: context.colorScheme.primary,
//                           dataSource: viewModel.averageSpeed,
//                           xValueMapper: (sales, _) => sales.$1,
//                           yValueMapper: (sales, _) => sales.$2,
//                         )
//                       ],
//                       tooltipBehavior: TooltipBehavior(
//                         enable: true,
//                         header: '',
//                         canShowMarker: false,
//                         borderColor: context.colorScheme.onPrimary,
//                         borderWidth: 4,
//                         elevation: 5,
//                         format: 'point.y Km/h',
//                         textStyle: context.textTheme.titleMedium?.copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: context.colorScheme.onPrimary,
//                         ),
//                         color: context.colorScheme.primary,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   AppText(
//                     'Runtime (min)',
//                     style: context.textTheme.headlineSmall?.copyWith(
//                       color: context.colorScheme.primary,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * .35,
//                     child: SfCartesianChart(
//                       plotAreaBorderWidth: 0,
//                       primaryXAxis: CategoryAxis(
//                         axisLine: const AxisLine(width: 1),
//                         interval: 1,
//                         labelPosition: ChartDataLabelPosition.outside,
//                         labelIntersectAction: labelIntersectAction,
//                         axisLabelFormatter: (axisLabelRenderArgs) {
//                           final dateTime =
//                               Jiffy.parse(axisLabelRenderArgs.text);
//                           return ChartAxisLabel(
//                               dateTime.format(pattern: dateFormat.pattern),
//                               const TextStyle());
//                         },
//                         majorGridLines: const MajorGridLines(width: 0),
//                         majorTickLines: const MajorTickLines(width: 1),
//                       ),
//                       primaryYAxis: NumericAxis(
//                         labelFormat: '{value}',
//                         axisLine: const AxisLine(width: 0),
//                         majorTickLines: const MajorTickLines(size: 0),
//                         axisLabelFormatter: (AxisLabelRenderDetails args) {
//                           final int minutes = args.value.toInt();
//                           final int hours = (minutes / 60).toInt();
//                           return ChartAxisLabel(
//                               '${hours.toStringAsFixed(0)} hr',
//                               const TextStyle());
//                         },
//                       ),
//                       series: <CartesianSeries<dynamic, DateTime>>[
//                         SplineAreaSeries<dynamic, DateTime>(
//                           splineType: SplineType.monotonic,
//                           dataSource: viewModel.runTime,
//                           color: seriesColor1.withOpacity(0.8),
//                           borderColor: seriesColor1,
//                           gradient: LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [
//                               seriesColor1,
//                               seriesColor1.withOpacity(0.05),
//                             ],
//                           ),
//                           xValueMapper: (dynamic sales, _) => sales.$1,
//                           yValueMapper: (dynamic sales, _) => sales.$2,
//                         ),
//                       ],
//                       tooltipBehavior: TooltipBehavior(
//                         enable: true,
//                         header: '',
//                         canShowMarker: false,
//                         borderColor: context.colorScheme.onPrimary,
//                         borderWidth: 4,
//                         duration: 2000, // <-- visible for 2 seconds (in ms)
//                         shouldAlwaysShow: false, // <-- allow it to auto-dismiss
//                         elevation: 5,
//                         color: context.colorScheme.primary,
//                         textStyle: context.textTheme.titleMedium?.copyWith(
//                           fontWeight: FontWeight.w600,
//                           color: context.colorScheme.onPrimary,
//                         ),
//                         builder: (dynamic data, dynamic point, dynamic series,
//                             int pointIndex, int seriesIndex) {
//                           final int totalMinutes = point.y.toInt();
//                           final int hours = totalMinutes ~/ 60;
//                           final int minutes = totalMinutes % 60;

//                           final String formattedTime = '$hours h $minutes m';

//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               formattedTime,
//                               style: context.textTheme.titleMedium?.copyWith(
//                                 fontWeight: FontWeight.w600,
//                                 color: context.colorScheme.onPrimary,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   VehicleTelematicsViewModel appendMissingWeekDays(VehicleTelematicsViewModel viewModel) {
//   final startOfWeek = Jiffy.parseFromDateTime(viewModel.startDate).startOf(Unit.week).dateTime;

//   final allWeekDays = <DateTime>[
//     for (int i = 0; i < 7; i++) startOfWeek.add(Duration(days: i))
//   ];

//   List<T> fillMissingDays<T>(
//     List<T> originalList,
//     T Function(DateTime day) mapper,
//     DateTime Function(T item) getDate,
//   ) {
//     final existingDates = originalList.map(getDate).toSet();

//     final missing = allWeekDays.where((day) => !existingDates.any((d) => isSameDay(d, day)));

//     return [
//       ...originalList,
//       ...missing.map(mapper),
//     ]..sort((a, b) => getDate(a).compareTo(getDate(b)));
//   }

//   viewModel = viewModel.copyWith(
//     distance: fillMissingDays(
//       viewModel.distance,
//       (day) => (day, 0.0),
//       (item) => item.$1!,
//     ),
//     averageSpeed: fillMissingDays(
//       viewModel.averageSpeed,
//       (day) => (day, 0.0),
//       (item) => item.$1!,
//     ),
//     runTime: fillMissingDays(
//       viewModel.runTime,
//       (day) => (day, 0.0),
//       (item) => item.$1!,
//     ),
//   );

//   return viewModel;
// }

// // Utility function
// bool isSameDay(DateTime a, DateTime b) {
//   return a.year == b.year && a.month == b.month && a.day == b.day;
// }

// }
