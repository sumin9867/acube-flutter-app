part of 'add_vehicle_cubit.dart';

@freezed
class AddVehicleState with _$AddVehicleState {
  const factory AddVehicleState.idle(AddVehicleViewModel viewModel) = _IdleState;
  const factory AddVehicleState.errorState(String errorMsg) = _ErrorState;
  const factory AddVehicleState.success(String successMsg) = _SuccessState;
  const factory AddVehicleState.verified(String successMsg) = _Verified;
  const factory AddVehicleState.loading(String successMsg) = _Loading;
}

@freezed
class AddVehicleViewModel with _$AddVehicleViewModel {
  const factory AddVehicleViewModel({
    required AddVehicleStep step,
    required String imeiNumber,
    required String vehicleName,
    required String simNumber,
    required String vehicleModel,
    required int vehicleType,
    @Default(false) bool isLoading,
  }) = _AddVehicleViewModel;

  factory AddVehicleViewModel.empty() => const AddVehicleViewModel(
        step: AddVehicleStep.scan,
        imeiNumber: '',
        vehicleName: '',
        simNumber: '',
        vehicleModel: '',
        vehicleType: 1,
      );
}

enum AddVehicleStep {
  scan,
  add,
  activate,
}
