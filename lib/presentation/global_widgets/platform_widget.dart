import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  final Widget? ios;
  final Widget? android;
  final Widget fallbackWidget;

  /// Creates a [PlatformWidget].
  ///
  /// Either [ios] or [android] can be provided; if not, [fallbackWidget] is used.
  const PlatformWidget({
    super.key,
    this.ios,
    this.android,
    this.fallbackWidget = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
        return ios ?? fallbackWidget;
      case TargetPlatform.android:
        return android ?? fallbackWidget;
      default:
        return fallbackWidget;
    }
  }
}