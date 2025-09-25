
import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';

import 'package:gpspro/presentation/screens/home_screen/events/widgets/events_filter.dart';
class EventsTabBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index, List<String> types) onTabSelected;

  const EventsTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

 @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  final iconSize = screenWidth * 0.04;


  return Container(
    padding: EdgeInsets.only(
      bottom: screenHeight * 0.01,
      left: screenWidth * 0.04,
      right: screenWidth * 0.04,
    ),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
    ),
    child: Row(
      children: List.generate(EventsFilter.filters.length, (index) {
        final isSelected = index == selectedIndex;
        final filter = EventsFilter.filters[index];

        return Row(
          children: [
            Icon(
              EventsFilter.icons[index],
              key: ValueKey<bool>(isSelected), // For animation
              color: isSelected
                  ? context.colorScheme.primary
                  : Colors.grey,
              size: iconSize,
            ),
            SizedBox(width: screenWidth * 0.012),
            Text(
              filter,
              key: ValueKey<int>(index),
            ),
          ],
        );
      }),
    ),
  );
}
}