import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/enums/date_range_enum.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/router/app_router.dart';
import 'package:jiffy/jiffy.dart';

class DateTimeHelper {
  static Future<(DataRange, DateTimeRange)?> dateRangePicker({
    DateTimeRange? initialDateRange,
    List<DataRange>? customList,
    DataRange initialPreset = DataRange.today,
  }) async {
    log('I am selected date');
    final pickedRange = await showModalBottomSheet<DataRange>(
      context: locator.get<AppRouter>().navigationKey.currentContext!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final List<DataRange> values = customList ?? List.from(DataRange.values);
        DataRange selected = initialPreset;
        log('I am selected: $selected');
        return StatefulBuilder(
          builder: (context, setState) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .6,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 16, 8),
                      child: Row(
                        children: [
                          const Text(
                            'Select Date Range',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              height: 24 / 18,
                              letterSpacing: -0.3,
                              color: Color(0xFF181818),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.close, color: Color(0xFF181818)),
                            splashRadius: 20,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: values.length,
                        itemBuilder: (_, i) {
                          final range = values[i];
                          return RadioListTile<DataRange>(
                            value: range,
                            activeColor: const Color.fromRGBO(8, 128, 234, 1),
                            groupValue: selected,
                            onChanged: (val) async {
                              if (val == null) return;
                              setState(() => selected = val);

                              Navigator.pop(context, val);
                            },
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: _Title(range),
                            subtitle: _Subtitle(range),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (pickedRange == null) return null;

    if (pickedRange == DataRange.custom) {
      DateTimeRange? pickedDateTimeRange;
      do {
        pickedDateTimeRange = await showDateRangePicker(
          context: locator.get<AppRouter>().navigationKey.currentContext!,
          firstDate: DateTime.now().subtract(const Duration(days: 90)),
          lastDate: DateTime.now(),
          initialDateRange: initialDateRange ??
              DateTimeRange(
                start: DateTime.now().subtract(const Duration(days: 7)),
                end: DateTime.now(),
              ),
        );

        if (pickedDateTimeRange == null) return null;

        if (pickedDateTimeRange.start.isAtSameMomentAs(pickedDateTimeRange.end)) {
          AppToast.showError(
            message: 'Start and End dates cannot be the same. Please select a different range.',
            context: locator.get<AppRouter>().navigationKey.currentContext!,
          );
        }
      } while (pickedDateTimeRange.start.isAtSameMomentAs(pickedDateTimeRange.end));

      return (pickedRange, pickedDateTimeRange);
    }

    final presetRange = await pickedRange.getDateTimeRange();
    return presetRange == null ? null : (pickedRange, presetRange);
  }

  static String formatEEEEMMddyyyy(DateTime datetime) {
    return Jiffy.parseFromDateTime(datetime).format(pattern: 'EEEE, MMM dd, yyyy');
  }

  static String formatEEEEddyyyy(DateTime datetime) {
    return Jiffy.parseFromDateTime(datetime).format(pattern: 'EEEE, dd, yyyy');
  }

  static List<DateTimeRange> getSingleDayRanges(DateTimeRange multiDayRange) {
    final List<DateTimeRange> singleDayRanges = [];

    Jiffy currentDayStart = Jiffy.parseFromDateTime(multiDayRange.start);
    final Jiffy lastDayEnd = Jiffy.parseFromDateTime(multiDayRange.end);

    while (currentDayStart.isBefore(lastDayEnd) || currentDayStart.isSame(lastDayEnd)) {
      final DateTime dayStart = currentDayStart.isSame(Jiffy.parseFromDateTime(multiDayRange.start))
          ? multiDayRange.start
          : currentDayStart.startOf(Unit.day).dateTime;

      final DateTime dayEnd = currentDayStart.isSame(Jiffy.parseFromDateTime(multiDayRange.end).startOf(Unit.day))
          ? multiDayRange.end
          : currentDayStart.endOf(Unit.day).dateTime;

      singleDayRanges.add(DateTimeRange(start: dayStart, end: dayEnd));
      currentDayStart = currentDayStart.add(days: 1).startOf(Unit.day);
    }

    return singleDayRanges;
  }
}

class DateRangePickerResult {
  final DataRange? pickedRange;
  final DateTimeRange? pickedDateTimeRange;
  final bool isSameRange;

  DateRangePickerResult({
    required this.pickedRange,
    required this.pickedDateTimeRange,
    required this.isSameRange,
  });
}

String _getSubtitle(DataRange range) {
  final now = Jiffy.now();
  switch (range) {
    case DataRange.today:
      return now.format(pattern: 'EEE, d MMM');
    case DataRange.yesterday:
      return now.subtract(days: 1).format(pattern: 'EEE, d MMM');
    case DataRange.thisWeek:
      // Monday as start
      final start = now.startOf(Unit.week); // Monday
      final end = start.add(days: 5); // Saturday
      return '${start.format(pattern: "dd MMM yyyy")} – ${end.format(pattern: "dd MMM yyyy")}';

    case DataRange.lastWeek:
      final start = now.subtract(weeks: 1).startOf(Unit.week);
      final end = now.subtract(weeks: 1).endOf(Unit.week);
      return '${start.format(pattern: "dd MMM yyyy")} – ${end.format(pattern: "dd MMM yyyy")}';
    case DataRange.thisMonth:
      final start = now.startOf(Unit.month);
      final end = now.endOf(Unit.month);
      return '${start.format(pattern: "dd MMM yyyy")} – ${end.format(pattern: "dd MMM yyyy")}';
    case DataRange.custom:
      return 'Select Date from Calendar';
  }
}

class _Title extends StatelessWidget {
  const _Title(this.range);
  final DataRange range;

  @override
  Widget build(BuildContext context) => Text(
        range.label,
        style: const TextStyle(
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: -0.3,
          color: Color(0xFF181818),
        ),
      );
}

class _Subtitle extends StatelessWidget {
  const _Subtitle(this.range);
  final DataRange range;

  @override
  Widget build(BuildContext context) => Text(
        _getSubtitle(range),
        style: const TextStyle(
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: -0.3,
          color: Color(0xFF646464),
        ),
      );
}
