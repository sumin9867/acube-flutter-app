import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/cubit/home_screen_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DevicesQuickCheckCubit extends Cubit<DevicesQuickCheckState> {
  final DeviceRepo deviceRepository;

  DevicesQuickCheckCubit(this.deviceRepository) : super(DevicesQuickCheckInitial());

  Future<void> checkDevices({bool isRetry = false}) async {
    emit(DevicesQuickCheckLoading());

    try {
      final response = await deviceRepository.hasDevicesQuickCheck();
      response.fold(
        (error) {
          if (error.toString().toLowerCase().contains('unauthorized') ||
              error.toString().toLowerCase().contains('401') ||
              error.toString().toLowerCase().contains('session expired')) {
            emit(DevicesQuickCheckFailure('Session expired. Please log in again.'));
          } else {
            emit(DevicesQuickCheckFailure('Failed to load devices: $error'));
          }
        },
        (hasDevices) {
          emit(DevicesQuickCheckSuccess(hasDevices));
        },
      );
    } catch (e) {
      if (e.toString().toLowerCase().contains('unauthorized') || e.toString().toLowerCase().contains('401')) {
        emit(DevicesQuickCheckFailure('Session expired. Please log in again.'));
      } else {
        emit(DevicesQuickCheckFailure('Unexpected error: ${e.toString()}'));
      }
    }
  }
}
