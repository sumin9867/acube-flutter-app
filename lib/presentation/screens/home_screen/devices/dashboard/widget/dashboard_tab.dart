

import 'package:flutter/material.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/vehicle_dashboard_screen.dart';

class DashboardTabBar extends StatelessWidget {
  const DashboardTabBar({
    required this.selected,
    required this.onChanged,
  });

  final VehicleDashbaordTab selected;
  final ValueChanged<VehicleDashbaordTab> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(249, 249, 249, 1),
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        itemCount: VehicleDashbaordTab.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tab = VehicleDashbaordTab.values[index];
          final isSelected = (selected == tab);

          return ChoiceChip(
            label: Text(
              tab.name[0].toUpperCase() + tab.name.substring(1),
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: -0.3,
                color: isSelected ? Colors.white : const Color(0xFF181818),
              ),
            ),
            selected: isSelected,
            onSelected: (_) => onChanged(tab),
            selectedColor: const Color.fromRGBO(8, 128, 234, 1),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            showCheckmark: false,
            backgroundColor: const Color.fromRGBO(37, 0, 73, 0.05),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}

