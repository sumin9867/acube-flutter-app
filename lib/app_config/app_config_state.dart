part of 'app_config.dart';

@freezed
class AppConfigState with _$AppConfigState {
  const factory AppConfigState.loading() = LoadingState;
  const factory AppConfigState.idle(AppConfigModel appConfigModel) = IdleState;
  const factory AppConfigState.failed(String errorMessage) = ErrorState;
}
