import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/repository/i_event_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:injectable/injectable.dart';

part 'events_cubit.freezed.dart';
part 'events_state.dart';

@lazySingleton
class EventsCubit extends Cubit<EventsState> {
  EventsCubit(this.eventRepo, this.devicesCubit) : super(const EventsState.loading());

  final EventRepo eventRepo;
  final MyDevicesCubit devicesCubit;

  bool _hasMoreItems = true;
  final List<VehicleEvent> _allEvents = [];

  Future<void> fetchEvents({
    required List<String> types,
    required String from,
    required String to,
    required int limit,
    required int page,
  }) async {
    log('Fetching events page $page from $from to $to');

    if (!devicesCubit.isIdleState) {
      await devicesCubit.getDevices();
    }

    if (page == 1) {
      _allEvents.clear(); // Clear previous data on new query
      emit(const EventsState.loading());
    }

    try {
      final devices = devicesCubit.devices;
      final deviceIds = devices.map((e) => e.id.toString()).toList();

      final eventList = await eventRepo.getAllDeviceEvents(
        deviceIds: deviceIds,
        types: types,
        from: from,
        to: to,
        limit: limit,
        page: page,
      );

      final sortedEventList = eventList.map((event) {
        final deviceName = devices
                .firstWhere(
                  (device) => device.id == event.deviceId,
                )
                .name ??
            'Unknown';
        return event.copyWith(deviceName: deviceName);
      }).toList()
        ..sort((a, b) => b.eventTime.compareTo(a.eventTime));

      _allEvents.addAll(sortedEventList);
      _hasMoreItems = sortedEventList.length == limit;

      emit(EventsState.idle(List.of(_allEvents), _hasMoreItems));
    } catch (e) {
      emit(EventsState.error(e.toString()));
    }
  }

  Future<List<PositionModel>> getCoordinates(String positionId, String deviceId) async {
    try {
      emit(const EventsState.loading());

      final coordinatesList = await eventRepo.getPositionById(positionId, deviceId);

      emit(EventsState.coordinatesLoaded(coordinatesList));

      return coordinatesList;
    } catch (e) {
      emit(EventsState.error(e.toString()));
      rethrow;
    }
  }
}
