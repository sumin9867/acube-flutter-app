import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';

class StatusContainer extends StatelessWidget {
  final bool isOnline;
  final String updatedTime;

  const StatusContainer({
    super.key,
    required this.isOnline,
    required this.updatedTime,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final containerPadding = EdgeInsets.symmetric(
      horizontal: width * 0.025,
      vertical: width * 0.01,
    );
    final circleSize = width * 0.015;
    final spacing = width * 0.015;
    final fontSizeOnline = width * 0.032;
    final fontSizeOffline = width * 0.025;

    if (isOnline) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(6),
        ),
        padding: containerPadding,
        child: Row(
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: spacing),
            Text(
              'Active',
              style: context.textTheme.labelSmall!.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.w600,
                fontSize: fontSizeOnline,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFAF9FB),
          borderRadius: BorderRadius.circular(3),
        ),
        padding: containerPadding,
        child: Row(
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: spacing),
            Text(
              _normalizeUpdatedTime(context, updatedTime),
              style: context.textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: fontSizeOffline,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
  }

  String _normalizeUpdatedTime(BuildContext context, String time) {
    final lower = time.toLowerCase().trim();

    if (lower.isEmpty) return context.locale.statusUnavailable;

    if (lower.contains('few second') ||
        lower.contains('a second') ||
        lower.contains('seconds') ||
        lower == 'just now') {
      return context.locale.statusOneMinuteAgo;
    }

    final String result = time
        .replaceAll(RegExp(r'\bminutes\b', caseSensitive: false), context.locale.statusMinutesLabel)
        .replaceAll(RegExp(r'\bmins\b', caseSensitive: false), context.locale.statusMinutesLabel)
        .replaceAll(RegExp(r'\bminute\b', caseSensitive: false), context.locale.statusMinutesLabel)
        .replaceAll(RegExp(r'\bmin\b', caseSensitive: false), context.locale.statusMinutesLabel);

    return '$result ${context.locale.statusAgoSuffix}';
  }
}
