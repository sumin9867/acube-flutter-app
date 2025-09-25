part of 'vehicle_anti_theft_cubit.dart';

@freezed
class VehicleAntiTheftState with _$VehicleAntiTheftState {
  const factory VehicleAntiTheftState.initial() = _InitialState;
  const factory VehicleAntiTheftState.loading(String message) = _LoadingState;

  const factory VehicleAntiTheftState.idle(bool isAntiTheftEnabled) = _IdleState;

  const factory VehicleAntiTheftState.error(String errorMsg) = _ErrorState;

  const factory VehicleAntiTheftState.activateVehicle(String message) = _ActivateVehicleState;

  const factory VehicleAntiTheftState.deactivateVehicle(String message) = _DeactivateVehicleState;
}
