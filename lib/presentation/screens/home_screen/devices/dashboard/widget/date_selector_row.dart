import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:intl/intl.dart';

class DateSelectorRow extends StatelessWidget {
  const DateSelectorRow({
    required this.dateRange,
    required this.onChangePressed,
    super.key,
  });

  final DateTimeRange dateRange;
  final VoidCallback onChangePressed;
  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String humanLabelFor(BuildContext context, DateTime start, DateTime end) {
    final l10n = context.locale;

    // Always compare with LOCAL time
    final now = DateTime.now();
    final DateTime todayStart = DateTime(now.year, now.month, now.day);
    final DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));

    bool isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

    bool isSameRange(DateTime aStart, DateTime aEnd, DateTime bStart, DateTime bEnd) =>
        isSameDay(aStart, bStart) && isSameDay(aEnd, bEnd);

    // Today
    if (isSameDay(start.toLocal(), todayStart) && isSameDay(end.toLocal(), todayStart)) {
      return l10n.today;
    }

    // Yesterday
    if (isSameDay(start.toLocal(), yesterdayStart) && isSameDay(end.toLocal(), yesterdayStart)) {
      return l10n.yesterday;
    }

    // Week helpers
    DateTime startOfWeek(DateTime d) => DateTime(d.year, d.month, d.day).subtract(Duration(days: d.weekday - 1));
    DateTime endOfWeek(DateTime d) => startOfWeek(d).add(const Duration(days: 6));

    final DateTime thisWeekStart = startOfWeek(todayStart);
    final DateTime thisWeekEnd = endOfWeek(todayStart);

    if (isSameRange(start.toLocal(), end.toLocal(), thisWeekStart, thisWeekEnd)) {
      return l10n.thisWeek;
    }

    final DateTime lastWeekStart = thisWeekStart.subtract(const Duration(days: 7));
    final DateTime lastWeekEnd = thisWeekEnd.subtract(const Duration(days: 7));

    if (isSameRange(start.toLocal(), end.toLocal(), lastWeekStart, lastWeekEnd)) {
      return l10n.lastWeek;
    }

    // Month helpers
    DateTime startOfMonth(DateTime d) => DateTime(d.year, d.month, 1);
    DateTime endOfMonth(DateTime d) => DateTime(d.year, d.month + 1, 1).subtract(const Duration(days: 1));

    final DateTime thisMonthStart = startOfMonth(todayStart);
    final DateTime thisMonthEnd = endOfMonth(todayStart);

    if (isSameRange(start.toLocal(), end.toLocal(), thisMonthStart, thisMonthEnd)) {
      return l10n.thisMonth;
    }

    // Default formatting
    final df = DateFormat('d MMM');
    final dfYear = DateFormat('d MMM yyyy');

    return start.year == end.year
        ? '${df.format(start.toLocal())} – ${df.format(end.toLocal())} ${start.year}'
        : '${dfYear.format(start.toLocal())} – ${dfYear.format(end.toLocal())}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.locale;
    final label = humanLabelFor(context, dateRange.start, dateRange.end);
    log('i am label $label');

    final showSubtitle = label == l10n.today || label == l10n.yesterday;
    final df = DateFormat('EEE, d MMMM');
    final subtitle = showSubtitle ? df.format(dateRange.end) : '';

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/statistics/calendar.svg',
            width: 20,
            height: 20,
            color: const Color(0xFF808080),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF181818),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (showSubtitle) ...[
            const SizedBox(width: 8),
            Text(
              subtitle,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: -0.3,
                color: Color(0xFF646464),
              ),
            ),
          ],
          const Spacer(),
          TextButton(
            onPressed: onChangePressed,
            child: Text(
              l10n.change,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0880EA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
