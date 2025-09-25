import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/core/utils/helpers/date_time_helper.dart';
import 'package:gpspro/domain/enums/date_range_enum.dart';
import 'package:gpspro/domain/models/Summary.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/repository/i_event_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/tabs/telematics/cubit/vehicle_telematics_cubit.dart';
import 'package:injectable/injectable.dart';

part 'vehicle_dashboard_cubit.freezed.dart';
part 'vehicle_dashboard_state.dart';

enum DashboardStep { summary, trips, stops, events, telematics }

@injectable
class VehicleDashboardCubit extends Cubit<VehicleDashboardState> {
  VehicleDashboardCubit({
    required this.deviceRepo,
    required this.eventRepo,
  }) : super(const _InitialState());

  final DeviceRepo deviceRepo;
  final EventRepo eventRepo;
  Summary? summary;
  List<VehicleTrip> trips = [];
  List<VehicleStop> stops = [];
  List<VehicleEvent> events = [];

  late int deviceId;

  DateTime? lastFetchedSummary;
  DateTime? lastFetchedTrips;
  DateTime? lastFetchedStops;
  DateTime? lastFetchedEvents;
  DateTime? lastFetchedTelematics;

  bool isFetching = false;

  void initialize({required int deviceId}) async {
    try {
      state.maybeWhen(
          idle: (_, __) => null,
          orElse: () async {
            this.deviceId = deviceId;
            final DateTimeRange? dateRange = await DataRange.today.getDateTimeRange();
            log('I ahve start date from dashboard ${dateRange!.start}');

            final viewModel = VehicleDashboardViewModel(
              summary: const Summary(),
              trips: trips,
              stops: stops,
              events: [],
              range: DataRange.today,
              startDate: dateRange.start,
              endDate: dateRange.end,
            );

            emit(VehicleDashboardState.idle(viewModel, CancelToken()));
            await refresh(DashboardStep.summary, false);
          });
    } catch (e) {
      emit(_ErrorState(e.toString()));
    }
  }

  Future<void> selectDate(
    BuildContext context,
    DashboardStep dashboardStep,
  ) async {
    try {
      log('I was called');

      await state.whenOrNull(
        idle: (viewModel, cancelToken) async {
          final result = await DateTimeHelper.dateRangePicker(
            initialPreset: viewModel.range,
            initialDateRange: DateTimeRange(
              start: viewModel.startDate,
              end: viewModel.endDate,
            ),
          );

          log('i am selected date after subsctrating $result');

          if (result != null) {
            final selectedStart = result.$2.start;
            final selectedEnd = result.$2.end;

            final bool isSameRange =
                selectedStart.isAtSameMomentAs(viewModel.startDate) && selectedEnd.isAtSameMomentAs(viewModel.endDate);

            if (!isSameRange) {
              final updatedViewModel = viewModel.copyWith(
                range: result.$1,
                startDate: selectedStart,
                endDate: selectedEnd,
              );

              emit(_IdleState(updatedViewModel, CancelToken()));
              await refresh(dashboardStep, true);
            }

            if (result.$1 == DataRange.thisMonth ||
                result.$1 == DataRange.thisWeek ||
                result.$1 == DataRange.lastWeek) {
              await context.read<VehicleTelematicsCubit>().selectDateDashBoard(
                    dashboardStep: dashboardStep,
                    result: result,
                    context: context,
                  );
            }
          }
        },
      );
    } catch (e, stack) {
      log('[DASHBOARD] Error in selectDate: $e\n$stack');
      emit(_ErrorState(e.toString()));
    }
  }

  Future<void> selectDateTelematics({
    required DashboardStep dashboardStep,
    required (DataRange, DateTimeRange)? result,
  }) async {
    // Your implementation here

    try {
      await state.whenOrNull(
        idle: (viewModel, cancelToken) async {
          if (result != null) {
            final bool isSameRange = result.$2.start.isAtSameMomentAs(viewModel.startDate) &&
                result.$2.end.isAtSameMomentAs(viewModel.endDate);

            if (!isSameRange) {
              final updatedViewModel = viewModel.copyWith(
                range: result.$1,
                startDate: result.$2.start,
                endDate: result.$2.end,
              );
              emit(_IdleState(updatedViewModel, CancelToken()));
              await refresh(DashboardStep.summary, true);
            } else {
              log('[DASHBOARD] Selected range is the same. No update triggered.');
            }
          }
        },
      );
    } catch (e, stack) {
      log('[DASHBOARD] Error in selectDate: $e\n$stack');
      emit(_ErrorState(e.toString()));
    }
  }

  Future<void> refresh(DashboardStep step, bool isDateSelected) async {
    if (isFetching) return;
    try {
      await state.whenOrNull(
        idle: (viewModel, cancelToken) async {
          emit(const _LoadingState());
          final now = DateTime.now();

          if (isDateSelected ||
              lastFetchedSummary == null ||
              now.difference(lastFetchedSummary!) > const Duration(minutes: 10)) {
            summary = await fetchVehicleSummary(viewModel.startDate, viewModel.endDate);
            lastFetchedSummary = now;
            trips = await fetchVehicleTrips(viewModel.startDate, viewModel.endDate);
            lastFetchedTrips = now;
            stops = await fetchVehicleStops(viewModel.startDate, viewModel.endDate);
            lastFetchedStops = now;
          }

          // ✅ Decide what to emit
          final updatedTrips = trips; // now always new trips (even if empty)
          final updatedStops = stops;

          emit(_IdleState(
            viewModel.copyWith(
              summary: _recalculateSummary(summary ?? viewModel.summary, updatedTrips, updatedStops),
              trips: updatedTrips,
              stops: updatedStops,
              events: events,
            ),
            CancelToken(),
          ));
        },
      );
    } catch (e, s) {
      log('[DASHBOARD] Error in refresh: $e\n$s');
      emit(_ErrorState(e.toString()));
    }
  }

  Summary _recalculateSummary(
    Summary summary,
    List<VehicleTrip> trips,
    List<VehicleStop> stops,
  ) {
    final Duration tripDuration = trips.fold(Duration.zero, (prev, trip) => prev + trip.duration);

    final Duration stopDuration = stops.fold(Duration.zero, (prev, stop) => prev + stop.duration);

    return summary.copyWith(
      stopCount: stops.length,
      stopDuration: stopDuration,
      tripCount: trips.length,
      tripDuration: tripDuration,
    );
  }

  Future<Summary> fetchVehicleSummary(
    DateTime start,
    DateTime end,
  ) async {
    isFetching = true;
    final summaryList = await deviceRepo.getSummary(
      '$deviceId',
      start,
      end,
    );
    isFetching = false;
    if (summaryList.isEmpty) {
      return const Summary();
    } else {
      return summaryList.first;
    }
  }

  Future<List<VehicleTrip>> fetchVehicleTrips(
    DateTime start,
    DateTime end,
  ) async {
    isFetching = true;

    final trips = await deviceRepo.getTrip(
      '$deviceId',
      start,
      end,
    );
    log('Fetched $trips trips');
    isFetching = false;

    trips.sort((a, b) => b.startTime.compareTo(a.startTime));
    return trips;
  }

  Future<List<VehicleStop>> fetchVehicleStops(
    DateTime start,
    DateTime end,
  ) async {
    isFetching = true;

    final stops = await deviceRepo.getStops(
      '$deviceId',
      start,
      end,
    );
    isFetching = false;

    return stops;
  }
}
