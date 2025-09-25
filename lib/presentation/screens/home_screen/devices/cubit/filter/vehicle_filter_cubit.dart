import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:injectable/injectable.dart';

part 'vehicle_filter_cubit.freezed.dart';
part 'vehicle_filter_state.dart';

enum VehicleFilter {
  all,
  moving,
  idle,
  stopped,
  offline,
  unknown,
}

@injectable
class VehicleFilterCubit extends Cubit<VehicleFilterState> {
  VehicleFilterCubit(this.myDevicesCubit)
      : super(const VehicleFilterState(
          selectedFilter: VehicleFilter.all,
          devices: [],
        )) {
    initialize();
  }

  final MyDevicesCubit myDevicesCubit;
  StreamSubscription? _devicesSubscription; // Store subscription

  void initialize() {
    setFilter(VehicleFilter.all);
    _listenToMyDevicesCubit();
  }

  void _listenToMyDevicesCubit() {
    _devicesSubscription = myDevicesCubit.stream.listen(
      (deviceState) {
        if (isClosed) return; // Prevent emitting after close
        deviceState.maybeWhen(
          idle: (devices) {
            emit(state.copyWith(
              devices: _filterDevices(),
            ));
          },
          orElse: () {
            emit(state.copyWith(devices: []));
          },
        );
      },
    );
  }

  void setFilter(VehicleFilter filter) {
    if (isClosed) return; // Prevent emitting after close
    emit(
      state.copyWith(
        selectedFilter: filter,
        devices: _filterDevices(filter),
      ),
    );
  }

  List<DeviceCubit> _filterDevices([VehicleFilter? filter]) {
    return myDevicesCubit.state.maybeWhen(
      idle: (devices) {
        switch (filter ?? state.selectedFilter) {
          case VehicleFilter.all:
            return _sortDevices(devices); // Apply sorting
          case VehicleFilter.offline:
          case VehicleFilter.unknown:
            return devices.where((device) => device.state.status == DeviceStatus.offline).toList();
          case VehicleFilter.moving:
            return devices
                .where((device) =>
                    device.state.status == DeviceStatus.online &&
                    device.state.position?.speed != null &&
                    device.state.position!.speed > 0 &&
                    device.state.position?.attributes?.ignition != null &&
                    device.state.position!.attributes!.ignition == true)
                .toList();
          case VehicleFilter.stopped:
            return devices
                .where((device) => (device.state.status == DeviceStatus.online &&
                    (device.state.position?.attributes?.ignition == null ||
                        device.state.position!.attributes!.ignition == false)))
                .toList();
          case VehicleFilter.idle:
            return devices
                .where((device) =>
                    device.state.status == DeviceStatus.online &&
                    (device.state.position?.attributes?.ignition ?? false) == true && // Ignition is ON
                    (device.state.position?.speed ?? 0.0) == 0.0) // Speed is 0 (or null, defaulting to 0.0)
                .toList();
        }
      },
      orElse: () => [],
    );
  }

  /// **Sorting function:** Orders devices as Moving → Idle → Stopped
  List<DeviceCubit> _sortDevices(List<DeviceCubit> devices) {
    final List<DeviceCubit> movingDevices = devices
        .where((device) =>
            device.state.status == DeviceStatus.online &&
            device.state.position?.speed != null &&
            device.state.position!.speed > 0 &&
            device.state.position?.attributes?.ignition != null &&
            device.state.position!.attributes!.ignition == true)
        .toList();

    final List<DeviceCubit> idleDevices = devices
        .where((device) =>
            device.state.status == DeviceStatus.online &&
            (device.state.position?.attributes?.ignition ?? false) == true &&
            (device.state.position?.speed ?? 0.0) == 0.0)
        .toList();

    final List<DeviceCubit> stoppedDevices = devices
        .where((device) =>
            device.state.status == DeviceStatus.online &&
            (device.state.position?.attributes?.ignition == null ||
                device.state.position!.attributes!.ignition == false))
        .toList();
    final List<DeviceCubit> offlineDevices =
        devices.where((device) => device.state.status == DeviceStatus.offline).toList();

    final List<DeviceCubit> unknownDevices =
        devices.where((device) => device.state.status == DeviceStatus.unknown).toList();

    // Combine lists in the required order: Moving → Idle → Stopped → Offline/Unknown
    return [...movingDevices, ...idleDevices, ...stoppedDevices, ...offlineDevices, ...unknownDevices];
  }

  @override
  Future<void> close() {
    _devicesSubscription?.cancel(); // Cancel subscription on close
    return super.close();
  }
}
