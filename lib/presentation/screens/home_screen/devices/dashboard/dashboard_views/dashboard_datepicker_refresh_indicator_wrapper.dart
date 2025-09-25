// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gpspro/domain/models/Device.dart';
// import 'package:gpspro/gen/assets.gen.dart';
// import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/cubit/vehicle_dashboard_cubit.dart';
// import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_data_range_picker.dart';

// class DashboardDatepickerRefreshIndicatorWrapper extends StatelessWidget {
//   const DashboardDatepickerRefreshIndicatorWrapper({
//     super.key,
//     required this.child,
//     this.datePickerView,
//     this.onRefresh,
//     required this.model,
//     required this.step,
//   });

//   final Device model;
//   final Widget child;
//   final Widget? datePickerView;
//   final DashboardStep step;
//   final Future<void> Function()? onRefresh;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 18),
//       child: Column(
//         children: [
//           const SizedBox(height: 18),
//           datePickerView ??
//               InkWell(
//                 onTap: () async {
//                   context.read<VehicleDashboardCubit>().selectDate(step);
//                 },
//                 child: context.read<VehicleDashboardCubit>().state.maybeWhen(
//                       loading: () => const SizedBox.shrink(),
//                       orElse: () => const SizedBox.shrink(),
//                       idle: (viewModel, _) => VehicleDataRangePickerView(
//                           deviceName:
//                               viewModel.summary.deviceName ?? 'Unknown Device',
//                           deviceImagePath: Assets.images.devices.car.car.path,
//                           model: model,
//                           range: viewModel.range,
//                           dataRange: DateTimeRange(
//                             start: viewModel.startDate,
//                             end: viewModel.endDate,
//                           )),
//                     ),
//               ),
//           Expanded(
//             child: LayoutBuilder(builder: (context, constraints) {
//               return RefreshIndicator.adaptive(
//                 triggerMode: RefreshIndicatorTriggerMode.anywhere,
//                 onRefresh: onRefresh ??
//                     () => context
//                         .read<VehicleDashboardCubit>()
//                         .refresh(DashboardStep.summary, false),
//                 child: SingleChildScrollView(
//                   physics: const AlwaysScrollableScrollPhysics(),
//                   padding: const EdgeInsets.only(top: 18),
//                   child: Container(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight - 18,
//                     ),
//                     child: child,
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
