import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/repository/i_event_repo.dart';
import 'package:injectable/injectable.dart';

part 'single_event_cubit.freezed.dart';
part 'single_event_state.dart';

@lazySingleton
class SingleEventCubit extends Cubit<SingleEventState> {
  SingleEventCubit(
    this._eventRepo,
  ) : super(const SingleEventState.initial());

  final EventRepo _eventRepo;
  final List<VehicleEvent> _allEvents = [];
  bool _hasMoreItems = true;
  final int _currentPage = 1;

  Future<void> fetchEvents({
    required List<String> types,
    required String from,
    required String deviceId,
    required String to,
    required int limit,
    required int page,
  }) async {
    log('Fetching events for device: $deviceId, from: $from, to: $to, limit: $limit, page: $page');
    List<VehicleEvent> currentEvents = [];

    // Ensure from/to have trailing Z
    final fromUtc = ensureUtcZ(from);
    final toUtc = ensureUtcZ(to);

    if (page > 1) {
      state.maybeWhen(
        idle: (events, hasMore) {
          currentEvents = List.from(events);
        },
        orElse: () {
          if (!isClosed) emit(const SingleEventState.loading());
        },
      );
    } else {
      if (!isClosed) emit(const SingleEventState.loading());
    }

    try {
      // Fetch the events
      final eventList = await _eventRepo.getAllDeviceEvents(
        deviceIds: [deviceId],
        types: types,
        from: from,
        to: to,
        limit: limit,
        page: page,
      );

      log('Fetched events: $eventList');
      final combinedEvents = [...currentEvents, ...eventList];
      _hasMoreItems = eventList.length == limit;

      // Emit the idle state with the fetched data
      if (!isClosed) {
        emit(SingleEventState.idle(combinedEvents, _hasMoreItems));
      }
    } catch (e) {
      log('Error fetching events: $e');

      // Emit error state if an exception occurs
      if (!isClosed) {
        emit(SingleEventState.error(e.toString()));
      }
    }
  }

  Future<void> getCoordinates(String positionId, String deviceId) async {
    try {
      final coordinatesList = await _eventRepo.getPositionById(positionId, deviceId);
      if (!isClosed) {
        emit(SingleEventState.coordinatesLoaded(coordinatesList));
      }
    } catch (e) {
      log('Error fetching coordinates: $e');
      if (!isClosed) {
        emit(SingleEventState.error(e.toString()));
      }
    }
  }

  String ensureUtcZ(String dateTime) {
    if (!dateTime.endsWith('Z')) {
      return '${dateTime}Z';
    }
    return dateTime;
  }
}
