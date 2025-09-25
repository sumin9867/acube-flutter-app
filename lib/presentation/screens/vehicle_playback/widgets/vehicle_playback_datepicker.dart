import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PlayBackDatePicker extends StatefulWidget {
  final TextEditingController dateController;
  final Function(DateTime) onDateSelected; // Callback to parent

  const PlayBackDatePicker({
    super.key,
    required this.dateController,
    required this.onDateSelected,
  });

  @override
  State<PlayBackDatePicker> createState() => _PlayBackDatePickerState();
}

class _PlayBackDatePickerState extends State<PlayBackDatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();

    if (widget.dateController.text.isNotEmpty) {
      _selectedDate = DateFormat('yyyy-MM-dd').parse(widget.dateController.text);
    } else {
      _selectedDate = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: const Text(
              'Select date',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.cancel_outlined),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            child: SfDateRangePicker(
              toggleDaySelection: true,
              headerHeight: 50,
              backgroundColor: Colors.white,
              initialSelectedDate: _selectedDate, // Use stored selected date
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is DateTime) {
                  setState(() {
                    _selectedDate = args.value as DateTime;
                    widget.dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
                  });

                  widget.onDateSelected(_selectedDate!); // Send date to parent
                  context.pop();
                }
              },
              selectionMode: DateRangePickerSelectionMode.single,
              showNavigationArrow: true,
              monthViewSettings: DateRangePickerMonthViewSettings(
                enableSwipeSelection: true,
                dayFormat: 'EEE',
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                ),
                firstDayOfWeek: 7,
              ),
              maxDate: DateTime.now(),
              minDate: DateTime.now().subtract(const Duration(days: 90)),
              allowViewNavigation: true,
              viewSpacing: 100,
              headerStyle: const DateRangePickerHeaderStyle(
                textAlign: TextAlign.start,
                backgroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              selectionColor: context.colorScheme.primary,
              selectionTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              monthCellStyle: DateRangePickerMonthCellStyle(
                disabledDatesTextStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                todayTextStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
