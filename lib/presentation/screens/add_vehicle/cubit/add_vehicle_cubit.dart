import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:injectable/injectable.dart';

part 'add_vehicle_cubit.freezed.dart';
part 'add_vehicle_state.dart';

@injectable
class AddVehicleCubit extends Cubit<AddVehicleState> {
  AddVehicleCubit(this.deviceRepo) : super(_IdleState(AddVehicleViewModel.empty()));

  final DeviceRepo deviceRepo;

  Future<void> verifyImei(String imei, BuildContext context) async {
    emit(const AddVehicleState.loading('Verifying IMEI...'));

    try {
      final response = await deviceRepo.verifyImeiNumber(imei);

      response.fold(
        (failure) {
          emit(AddVehicleState.errorState(getErrorMessage(failure)));
        },
        (success) {
          log('IMEI verification success');
          confirmImei(imei);
          emit(const AddVehicleState.verified('IMEI verified!'));
        },
      );
    } catch (e) {
      emit(AddVehicleState.errorState('Unexpected error: ${e.toString()}'));
    }
  }

  void confirmImei(String imei) {
    state.maybeWhen(
      idle: (viewModel) {
        emit(_IdleState(
          viewModel.copyWith(
            imeiNumber: imei,
            step: AddVehicleStep.add,
          ),
        ));
      },
      orElse: () {},
    );
  }

  Future<void> addVehicle(
    String vehicleName,
    String imei,
    String registrationNumber,
    String simNumber,
    String vehicleModel,
    int vehicleType,
    BuildContext context,
  ) async {
    emit(const AddVehicleState.loading('Adding vehicle...'));

    try {
      final request = AddDeviceRequest(
        name: vehicleName,
        uniqueId: imei,
        phone: simNumber,
        model: vehicleModel,
        contact: simNumber,
        category: VehicleType.values[vehicleType].name,
        attributes: Attributes(registration: registrationNumber),
      );

      log('addDevice called');
      final result = await deviceRepo.addDevice(request);
      log('addDevice returned');
      result.fold(
        (failure) {
          log('addVehicle failed: $failure');
          emit(AddVehicleState.errorState('Failed to add vehicle: $failure'));
        },
        (device) {
          log('addVehicle success');
          emit(const AddVehicleState.success('Vehicle addeded'));
        },
      );
    } catch (e, s) {
      log('addVehicle error: $e', stackTrace: s);
      emit(AddVehicleState.errorState('Failed to add vehicle: ${e.toString()}'));
    }
  }

  void activateVehicle() {
    emit(const AddVehicleState.loading('Activating vehicle...'));

    state.maybeWhen(
      idle: (viewModel) {
        emit(const _SuccessState('Vehicle activated successfully!'));
      },
      orElse: () {},
    );
  }

  // Simulate a loading state for UI testing/demo purposes
  Future<void> triggerLoading() async {
    emit(const AddVehicleState.loading('Loading...'));
    await Future.delayed(const Duration(seconds: 2));
    emit(const AddVehicleState.success('Loading complete'));
  }
}

String getErrorMessage(failure) {
  return failure.when(
    server: () => 'Server error occurred. Please try again later.',
    network: () => 'Network error occurred. Please check your internet connection.',
    client: (errMsg) => errMsg,
    storage: () => 'Error loading from local storage.',
  );
}
