import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_launch_config.freezed.dart';

@freezed
class LaunchConfiguration with _$LaunchConfiguration {
  const LaunchConfiguration._();

  const factory LaunchConfiguration({
    required String newRelicToken,
  }) = _LaunchConfiguration;
}
