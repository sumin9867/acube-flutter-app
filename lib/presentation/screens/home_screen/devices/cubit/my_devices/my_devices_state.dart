part of 'my_devices_cubit.dart';

@freezed
class MyDevicesState with _$MyDevicesState {
  const factory MyDevicesState.loading() = _LoadingState;
  const factory MyDevicesState.idle(List<DeviceCubit> devices) = _IdleState;
  const factory MyDevicesState.error(String errorMessage) = _ErrorState;
}
