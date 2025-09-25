import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:injectable/injectable.dart';

part 'vehicle_search_cubit.freezed.dart';
part 'vehicle_search_state.dart';

@injectable
class VehicleSearchCubit extends Cubit<VehicleSearchState> {
  VehicleSearchCubit() : super(const _InactiveState());

  late final List<DeviceCubit> allDevices;

  void initialize(List<DeviceCubit> devices) {
    allDevices = devices;
  }

  void search(String query) {
    try {
      if (query.trim().isEmpty) {
        emit(const _InactiveState());
      } else {
        final devices = allDevices.where((device) {
          return device.state.name
              .toLowerCase()
              .contains(query.trim().toLowerCase());
        }).toList();
        devices.sort((a, b) {
          if (a.state.name.toLowerCase().startsWith(query.toLowerCase()) &&
              !b.state.name.toLowerCase().startsWith(query.toLowerCase())) {
            return -1;
          } else if (!a.state.name
                  .toLowerCase()
                  .startsWith(query.toLowerCase()) &&
              b.state.name.toLowerCase().startsWith(query.toLowerCase())) {
            return 1;
          } else {
            return a.state.name.compareTo(b.state.name);
          }
        });
        emit(_IdleState(devices));
      }
    } catch (e) {
      emit(const _InactiveState());
    }
  }

  void clear() {
    emit(const _InactiveState());
  }
}
