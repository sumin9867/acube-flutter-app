part of 'notification_settings_cubit.dart';

@freezed
class NotificationSettingsState with _$NotificationSettingsState {
  const factory NotificationSettingsState.initial() = _InitialState;
  const factory NotificationSettingsState.loading() = _LoadingState;
  const factory NotificationSettingsState.idle(List<Map<String, bool>> notificationTypes) = _IdleState;
  const factory NotificationSettingsState.error(String errorMsg) = _ErrorState;
  const factory NotificationSettingsState.success() = _SuccessState;
}
