import 'package:flutter/material.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/router/router.dart';

enum DataRange {
  today('Today'),
  yesterday('Yesterday'),
  thisWeek('This Week'),
  lastWeek('Last Week'),
  thisMonth('This Month'),
  custom('Custom');

  final String label;
  const DataRange(this.label);
}

extension DataRangeExtension on DataRange {
  Future<DateTimeRange?> getDateTimeRange() async {
    // Helper: convert a DateTime to Nepal Time (UTC+5:45) by adding offset
    DateTime toNepalTime(DateTime dt) {
      return dt.toUtc().subtract(const Duration(hours: 5, minutes: 45));
    }

    final DateTime now = DateTime.now();

    switch (this) {
      case DataRange.today:
        final startUtc = DateTime.utc(now.year, now.month, now.day, 0, 0, 0);
        final endUtc = DateTime.utc(now.year, now.month, now.day, 23, 59, 59);
        return DateTimeRange(
          start: toNepalTime(startUtc),
          end: toNepalTime(endUtc),
        );

      case DataRange.yesterday:
        final yesterday = now.subtract(const Duration(days: 1));
        final startUtc = DateTime.utc(yesterday.year, yesterday.month, yesterday.day, 0, 0, 0);
        final endUtc = DateTime.utc(yesterday.year, yesterday.month, yesterday.day, 23, 59, 59);
        return DateTimeRange(
          start: toNepalTime(startUtc),
          end: toNepalTime(endUtc),
        );

      case DataRange.thisWeek:
        // Start from last Sunday (including today if today is Sunday)
        final int daysSinceSunday = now.weekday % 7; // Sunday=7 % 7 = 0, Monday=1 % 7=1 ... Saturday=6
        final sunday = now.subtract(Duration(days: daysSinceSunday));
        final startUtc = DateTime.utc(sunday.year, sunday.month, sunday.day, 0, 0, 0);
        final endUtc = DateTime.utc(now.year, now.month, now.day, 23, 59, 59);
        return DateTimeRange(
          start: toNepalTime(startUtc),
          end: toNepalTime(endUtc),
        );

      case DataRange.lastWeek:
        // Last week's Sunday to Saturday
        final int daysSinceSunday = now.weekday % 7;
        final lastSunday =
            now.subtract(Duration(days: daysSinceSunday + 7)); // go back one full week + days since Sunday
        final lastSaturday = lastSunday.add(const Duration(days: 6));
        final startUtc = DateTime.utc(lastSunday.year, lastSunday.month, lastSunday.day, 0, 0, 0);
        final endUtc = DateTime.utc(lastSaturday.year, lastSaturday.month, lastSaturday.day, 23, 59, 59);
        return DateTimeRange(
          start: toNepalTime(startUtc),
          end: toNepalTime(endUtc),
        );

      case DataRange.thisMonth:
        final startUtc = DateTime.utc(now.year, now.month, 1, 0, 0, 0);
        final endUtc = DateTime.utc(now.year, now.month, now.day, 23, 59, 59);
        return DateTimeRange(
          start: toNepalTime(startUtc),
          end: toNepalTime(endUtc),
        );

      case DataRange.custom:
        final picked = await showDateRangePicker(
          context: locator.get<AppRouter>().navigationKey.currentContext!,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          initialDateRange: DateTimeRange(
            start: DateTime.now().subtract(const Duration(days: 7)),
            end: DateTime.now(),
          ),
        );

        if (picked == null) return null;

        final startUtc = DateTime.utc(picked.start.year, picked.start.month, picked.start.day, 0, 0, 0);
        final endUtc = DateTime.utc(picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);

        return DateTimeRange(
          start: toNepalTime(startUtc),
          end: toNepalTime(endUtc),
        );
    }
  }
}
