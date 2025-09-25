part of 'share_location_cubit.dart';

@freezed
class ShareLocationState with _$ShareLocationState {
  const factory ShareLocationState.initial() = _Initial;
  const factory ShareLocationState.loading() = _Loading;
  const factory ShareLocationState.success(String token) = _Success;
  const factory ShareLocationState.error(String message) = _Error;
}
