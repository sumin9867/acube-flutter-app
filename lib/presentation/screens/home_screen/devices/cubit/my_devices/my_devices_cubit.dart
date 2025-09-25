import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:injectable/injectable.dart';

part 'my_devices_cubit.freezed.dart';
part 'my_devices_state.dart';

@lazySingleton
class MyDevicesCubit extends Cubit<MyDevicesState> {
  MyDevicesCubit({
    required this.deviceRepo,
  }) : super(const MyDevicesState.loading());

  final DeviceRepo deviceRepo;
  final LinkedHashMap<int, DeviceCubit> _deviceIdDeviceMap = LinkedHashMap();

  List<int> get _deviceIds => _deviceIdDeviceMap.keys.toList();
  List<Device> get devices => _deviceIdDeviceMap.values.map((e) => e.state).toList();
  List<DeviceCubit> get deviceCubits => _deviceIdDeviceMap.values.toList();
  bool get isIdleState => state is _IdleState;

  Future<void> init() async {
    await getDevices();
  }

  void updateDevicePosition(int deviceId, PositionModel position) {
    try {
      _deviceIdDeviceMap[deviceId]?.update(position: position);
    } catch (e) {
      AppLogger.error(e);
    }
  }

  void updateDevice(Device device) {
    try {
      if (_deviceIds.contains(device.id)) {
        _deviceIdDeviceMap[device.id]?.updateDevice(device);
      } else {
        _deviceIdDeviceMap[device.id] = DeviceCubit(device);
      }
    } catch (e) {
      AppLogger.error(e);
    }
  }

  Future<void> deviceListFilter(DeviceStatus? status) async {
    List<DeviceCubit> searchResult = [];
    if (status == null) {
      searchResult = deviceCubits;
    } else {
      for (var device in deviceCubits) {
        if (status == device.state.status) {
          searchResult.add(device);
        }
      }
    }
    emit(_IdleState(searchResult));
  }

  Future<void> getDevices({int retries = 3}) async {
    emit(const MyDevicesState.loading());

    for (int attempt = 0; attempt < retries; attempt++) {
      try {
        // Fetch devices using Either
        final result = await deviceRepo.getDevices(); // returns Either<AppException, List<Device>>

        result.fold(
          (failure) {
            // If last attempt, handle error
            if (attempt == retries - 1) {
              if (_deviceIdDeviceMap.isNotEmpty) {
                // Fallback to existing devices
                emit(MyDevicesState.idle(deviceCubits));
              } else {
                // No devices at all
                emit(MyDevicesState.error('Failed to retrieve devices: $failure'));
              }
            } else {
              // Wait before retrying (exponential backoff)
              final delaySeconds = 2 * (attempt + 1);
              Future.delayed(Duration(seconds: delaySeconds));
            }
          },
          (devList) {
            // Successfully fetched devices
            _deviceIdDeviceMap.clear();
            for (var device in devList) {
              _deviceIdDeviceMap[device.id] = DeviceCubit(device);
            }

            emit(MyDevicesState.idle(deviceCubits));
          },
        );

        // If success, exit loop
        if (result.isRight()) return;
      } catch (e, stackTrace) {
        // Catch unexpected errors
        AppLogger.error('getDevices failed (attempt ${attempt + 1}): $e', stackTrace: stackTrace);

        if (attempt == retries - 1) {
          if (_deviceIdDeviceMap.isNotEmpty) {
            emit(MyDevicesState.idle(deviceCubits));
          } else {
            emit(MyDevicesState.error('Failed to retrieve devices: ${e.toString()}'));
          }
        } else {
          final delaySeconds = 2 * (attempt + 1);
          await Future.delayed(Duration(seconds: delaySeconds));
        }
      }
    }
  }

  Future<void> refreshDevices() async {
    await getDevices();
  }

  Future<void> clearState() async {
    _deviceIdDeviceMap.clear();

    // Delay example or async tasks
    await Future.delayed(const Duration(milliseconds: 50));

    if (!isClosed) {
      emit(const _IdleState([]));
    }
  }
}

class DeviceCubit extends Cubit<Device> {
  DeviceCubit(super.device);

  void updateDevice(Device device) {
    try {
      emit(device.copyWith(
        position: state.position,
      ));
    } catch (e) {
      AppLogger.error(e);
    }
  }

  void update({
    DeviceAttribute? attributes,
    int? groupId,
    String? name,
    String? uniqueId,
    DeviceStatus? status,
    DateTime? lastUpdate,
    int? positionId,
    String? phone,
    String? model,
    String? contact,
    String? category,
    bool? disabled,
    String? photo,
    PositionModel? position,
  }) {
    final updatedState = state.copyWith(
      attributes: attributes ?? state.attributes,
      groupId: groupId ?? state.groupId,
      name: name ?? state.name,
      uniqueId: uniqueId ?? state.uniqueId,
      status: status ?? state.status,
      lastUpdate: lastUpdate ?? state.lastUpdate,
      positionId: positionId ?? state.positionId,
      phone: phone ?? state.phone,
      model: model ?? state.model,
      contact: contact ?? state.contact,
      category: category ?? state.category,
      disabled: disabled ?? state.disabled,
      photo: photo ?? state.photo,
      position: position ?? state.position,
    );
    emit(updatedState);
  }
}

class PolylineState {
  final Map<PolylineId, Polyline> polylines;
  final Map<PolylineId, Polyline> borderPolylines;

  PolylineState({required this.polylines, required this.borderPolylines});
}

@lazySingleton
class PolylineCubit extends Cubit<PolylineState> {
  LatLng? startLocation;
  int _updateCounter = 0;

  PolylineCubit() : super(PolylineState(polylines: {}, borderPolylines: {}));

  void clearPolyline() {
    startLocation = null;
    _updateCounter = 0;
    if (!isClosed) emit(PolylineState(polylines: {}, borderPolylines: {}));
  }

  void addPolyline(Device device) {
    if (device.position == null) return;

    _updateCounter++;

    if (_updateCounter < 3) return;

    final LatLng newLocation = LatLng(device.position!.latitude, device.position!.longitude);

    if (startLocation == null) {
      startLocation = newLocation;
      return;
    }

    const PolylineId polylineId = PolylineId('vehicle_path');
    const PolylineId borderPolylineId = PolylineId('vehicle_path_border');
    Future.delayed(const Duration(milliseconds: 700), () {
      final Map<PolylineId, Polyline> updatedPolylines = Map<PolylineId, Polyline>.from(state.polylines);
      final Map<PolylineId, Polyline> updatedBorderPolylines = Map<PolylineId, Polyline>.from(state.borderPolylines);

      if (updatedPolylines.containsKey(polylineId) && updatedBorderPolylines.containsKey(borderPolylineId)) {
        final List<LatLng> points = List.from(updatedPolylines[polylineId]!.points);
        points.add(newLocation);

        updatedPolylines[polylineId] = updatedPolylines[polylineId]!.copyWith(pointsParam: points);
        updatedBorderPolylines[borderPolylineId] =
            updatedBorderPolylines[borderPolylineId]!.copyWith(pointsParam: points);
      } else {
        updatedPolylines[polylineId] = Polyline(
          polylineId: polylineId,
          color: AppColors.newPrimaryColor,
          width: 5,
          points: [startLocation!, newLocation],
          geodesic: true,
          visible: true,
          zIndex: 10,
        );

        updatedBorderPolylines[borderPolylineId] = Polyline(
          polylineId: borderPolylineId,
          points: [startLocation!, newLocation],
          color: Colors.black,
          width: 6,
          zIndex: 1,
          geodesic: true,
          visible: true,
        );
      }

      startLocation = newLocation;

      if (!isClosed) {
        emit(PolylineState(
          polylines: updatedPolylines,
          borderPolylines: updatedBorderPolylines,
        ));
      }
    });
  }
}