import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/filter/vehicle_filter_cubit.dart';
import 'package:gpspro/theme/app_colors.dart';

class VehicleSegmentedButton extends StatefulWidget {
  const VehicleSegmentedButton({super.key});

  @override
  State<VehicleSegmentedButton> createState() => _VehicleSegmentedButtonState();
}

class _VehicleSegmentedButtonState extends State<VehicleSegmentedButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final responsiveFontSize = width * 0.030; // e.g., ~14 on 400px width

    return BlocBuilder<VehicleFilterCubit, VehicleFilterState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 20), // initial spacing
                ...VehicleFilter.values.map((option) {
                  if (option == VehicleFilter.unknown) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(
                        option.name.capitalizeFirstofEach,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w600,
                          color: state.selectedFilter == option
                              ? context.colorScheme.onPrimary
                              : context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      selected: state.selectedFilter == option,
                      onSelected: (selected) {
                        if (state.selectedFilter != option) {
                          context.read<VehicleFilterCubit>().setFilter(option);
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      labelPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      side: BorderSide.none,
                      color: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.newUIprimaryColor;
                          }
                          return AppColors.filterbg;
                        },
                      ),
                    ),
                  );
                }),
                const SizedBox(width: 20), // ending spacing
              ],
            ),
          ),
        );
      },
    );
  }
}
