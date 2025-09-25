import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/vehicle_command.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:injectable/injectable.dart';

part 'engine_lock_cubit.freezed.dart';
part 'engine_lock_state.dart';

@injectable
class EngineLockCubit extends Cubit<EngineLockState> {
  final DeviceRepo _deviceRepo;

  EngineLockCubit(this._deviceRepo) : super(const EngineLockState.initial());

  Future<void> lockEngine(String deviceId) async {
    emit(const EngineLockState.locking('Locking engine......'));

    try {
      final command = {
        'textChannel': false,
        'type': 'custom',
        'attributes': {'data': 'RELAY,1#'},
        'deviceId': deviceId,
      };

      await _deviceRepo.sendCommands(Command.fromJson(command));

      emit(const EngineLockState.lockSuccess('Engine locked successfully. Unlock before your next ride.'));
    } catch (e) {
      emit(EngineLockState.error('Error sending lock command: $e'));
    }
  }

  Future<void> unlockEngine(String deviceId) async {
    emit(const EngineLockState.unlocking('Unlocking engine...'));

    try {
      final command = {
        'textChannel': false,
        'type': 'custom',
        'attributes': {'data': 'RELAY,0#'},
        'deviceId': deviceId,
      };

      await _deviceRepo.sendCommands(Command.fromJson(command));

      emit(const EngineLockState.unlockSuccess('Engine unlocked. You can now start the vehicle.'));
    } catch (e) {
      emit(EngineLockState.error('Error sending unlock command: $e'));
    }
  }
}
