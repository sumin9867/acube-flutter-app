import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_command.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'vehicle_anti_theft_cubit.freezed.dart';
part 'vehicle_anti_theft_state.dart';

@injectable
class VehicleAntiTheftCubit extends Cubit<VehicleAntiTheftState> {
  VehicleAntiTheftCubit(this._deviceRepo) : super(const _InitialState());

  final DeviceRepo _deviceRepo;
  late Device vehicle;

  bool _isAntiTheftEnabled = false;
  final Map<String, String> _sosNumbers = {};

  String get antitheftKey => 'antitheft-${vehicle.id}';
  String sosNumbersKey(String deviceId) => 'sos_numbers-$deviceId';

  void initialize(Device vehicle) {
    this.vehicle = vehicle;
    _isAntiTheftEnabled = false;
    emit(_IdleState(_isAntiTheftEnabled));
  }

  Future<void> setSosNumbers(
    List<String> phoneNumbers,
    String deviceId, {
    int? callTimeout,
  }) async {
    emit(const VehicleAntiTheftState.loading('Setting SOS numbers...'));
    try {
      final numbers = phoneNumbers.take(3).join(',');
      _sosNumbers[deviceId] = numbers;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('sos-$deviceId', numbers);
      final sosCommand = 'SOS,A,$numbers#';
      await _sendCommand(deviceId, sosCommand);

      if (callTimeout != null) {
        await _sendCommand(deviceId, 'SOSCALLTIMEOUT,$callTimeout#');
      }

      emit(const VehicleAntiTheftState.activateVehicle('SOS numbers set successfully.'));
    } catch (e) {
      log(e.toString());
      emit(const VehicleAntiTheftState.error('Failed to set SOS numbers.'));
    }
  }

  Future<void> activateAntiTheft(String vehicleId) async {
    emit(const VehicleAntiTheftState.loading('Activating anti-theft. Vehicle will alert on unauthorized use.'));
    try {
      final commands = [
        'ACCALM,ON,2#',
        'MOVING,ON,10,2#',
        'POWER,ON,2#',
      ];

      for (var cmd in commands) {
        await _sendCommand(vehicle.id.toString(), cmd);
      }

      _isAntiTheftEnabled = true;
      emit(const VehicleAntiTheftState.activateVehicle('Anti-theft activated. Vehicle alerts are now ON.'));
    } catch (e) {
      log(e.toString());
      emit(const VehicleAntiTheftState.error('Failed to activate anti-theft features.'));
    }
  }

  Future<void> deactivateAntiTheft(String vehicleId) async {
    emit(const VehicleAntiTheftState.deactivateVehicle('Deactivating anti-theft. Vehicle alerts will be reduced.'));
    try {
      final commands = [
        'ACCALM,ON,0#',
        'MOVING,ON,10,0#',
        'POWER,ON,10,0#',
      ];

      for (var cmd in commands) {
        await _sendCommand(vehicle.id.toString(), cmd);
      }

      _isAntiTheftEnabled = false;
      emit(const VehicleAntiTheftState.deactivateVehicle('Anti-theft deactivated. Vehicle can be started normally.'));
    } catch (e) {
      log(e.toString());
      emit(const VehicleAntiTheftState.error('Failed to deactivate anti-theft features.'));
    }
  }

  Future<void> _sendCommand(String deviceId, String commandData) async {
    final command = {
      'textChannel': false,
      'type': 'custom',
      'attributes': {'data': commandData},
      'deviceId': deviceId,
    };
    await _deviceRepo.sendCommands(Command.fromJson(command));
  }

  Future<void> toggleAntiTheft() async {
    await state.whenOrNull(
      idle: (isAntiTheftEnabled) async {
        try {
          _isAntiTheftEnabled = !isAntiTheftEnabled;
          emit(_IdleState(_isAntiTheftEnabled));
        } catch (e) {
          emit(const _ErrorState('Failed to toggle anti-theft status.'));
          emit(_IdleState(isAntiTheftEnabled));
        }
      },
    );
  }
}
