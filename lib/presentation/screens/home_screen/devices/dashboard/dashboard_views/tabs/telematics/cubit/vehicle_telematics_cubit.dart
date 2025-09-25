import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/core/utils/helpers/date_time_helper.dart';
import 'package:gpspro/domain/enums/date_range_enum.dart';
import 'package:gpspro/domain/models/Summary.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/cubit/vehicle_dashboard_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/vehicle_dashboard_screen.dart';
import 'package:injectable/injectable.dart';

part 'vehicle_telematics_cubit.freezed.dart';
part 'vehicle_telematics_state.dart';

@injectable
class VehicleTelematicsCubit extends Cubit<VehicleTelematicsState> {
  VehicleTelematicsCubit({
    required this.deviceRepo,
  }) : super(const _InitialState());

  final DeviceRepo deviceRepo;
  late int deviceId;
  late VehicleTelematicsViewModel _viewModel;

  void initialize({required int deviceId}) async {
    try {
      if (state is! _IdleState) {
        emit(const _LoadingState());
        this.deviceId = deviceId;
        final DateTimeRange? dateRange = await DataRange.thisWeek.getDateTimeRange();
        _viewModel = VehicleTelematicsViewModel(
          distance: [],
          averageSpeed: [],
          runTime: [],
          range: DataRange.thisWeek,
          startDate: dateRange!.start,
          endDate: dateRange.end,
        );
        await fetchVehicleTelematics();
        emit(_IdleState(_viewModel));
      }
    } catch (e) {
      emit(_ErrorState(e.toString()));
    }
  }

  Future<void> selectDate(
    BuildContext context,
    DashboardStep Function(VehicleDashbaordTab selectedTab) tabToStep,
    VehicleDashbaordTab selectedTab,
  ) async {
    await state.whenOrNull(idle: (viewModel) async {
      final result = await DateTimeHelper.dateRangePicker(
        initialDateRange: DateTimeRange(
          start: viewModel.startDate,
          end: viewModel.endDate,
        ),
        initialPreset: viewModel.range,
        customList: [
          DataRange.thisWeek,
          DataRange.lastWeek,
          DataRange.thisMonth,
        ],
      );

      if (result != null) {
        emit(const _LoadingState());

        _viewModel = _viewModel.copyWith(
          range: result.$1,
          startDate: result.$2.start,
          endDate: result.$2.end,
        );

        emit(_IdleState(_viewModel));

        await refresh();

        final step = tabToStep(selectedTab);
        log('Hi i am step $step');

        await context.read<VehicleDashboardCubit>().selectDateTelematics(dashboardStep: step, result: result);
      }
    });
  }

  Future<void> selectDateDashBoard(
      {required DashboardStep dashboardStep,
      required (DataRange, DateTimeRange)? result,
      required BuildContext context}) async {
    await state.whenOrNull(idle: (viewModel) async {
      log('I was called $viewModel');

      if (result != null) {
        log('I was called $viewModel');
        emit(const _LoadingState());

        _viewModel = _viewModel.copyWith(
          range: result.$1,
          startDate: result.$2.start,
          endDate: result.$2.end,
        );

        emit(_IdleState(_viewModel));

        await refresh();
      }
    });
  }

  Future<void> refresh() async {
    try {
      await fetchVehicleTelematics();
      emit(_IdleState(_viewModel));
    } catch (e) {
      emit(_ErrorState(e.toString()));
    }
  }

  Future<void> fetchVehicleTelematics() async {
    final List<(DateTime?, double)> distanceData = [];
    final List<(DateTime?, double)> averageSpeedData = [];
    final List<(DateTime?, double)> runTimeData = [];

    final summaryList = await deviceRepo
        .getSummary(
      '$deviceId',
      _viewModel.startDate,
      _viewModel.endDate,
      fetchDailyData: true,
    )
        .onError((e, s) {
      return [
        Summary(
          startTime: _viewModel.startDate,
          endTime: _viewModel.endDate,
        )
      ];
    });

    if (summaryList.isNotEmpty) {
      for (var summary in summaryList) {
        final item = summary;
        final startDateNepali = item.startTime!.toUtc().add(const Duration(hours: 5, minutes: 45));
        log('i am stratrr date $startDateNepali');

        distanceData.add((startDateNepali, item.distanceInKm ?? 0));
        averageSpeedData.add((startDateNepali, item.averageSpeedInKm ?? 0));
        runTimeData.add((startDateNepali, (item.engineHours?.inMinutes.toDouble() ?? 0.0)));
      }
    }
    _viewModel = _viewModel.copyWith(
      distance: distanceData,
      averageSpeed: averageSpeedData,
      runTime: runTimeData,
    );
  }
}
