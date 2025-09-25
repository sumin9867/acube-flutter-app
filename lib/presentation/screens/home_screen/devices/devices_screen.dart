import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/filter/vehicle_filter_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/search/vehicle_search_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/device_list.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_filter_segmented_button.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_search_bar.dart';
import 'package:gpspro/presentation/screens/home_screen/home_page_wrapper.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.05;
    final topSpacing = screenHeight * 0.015;

    return HomePageWrapper(
      title: context.locale.vehicleList,
      child: BlocProvider<VehicleFilterCubit>(
        create: (context) => locator<VehicleFilterCubit>(),
        child: BlocBuilder<VehicleFilterCubit, VehicleFilterState>(
          builder: (context, state) {
            final devices = state.devices;

            return BlocProvider<VehicleSearchCubit>(
              create: (context) => locator<VehicleSearchCubit>()..initialize(devices),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: const VehicleSearchBar(),
                      ),
                      BlocBuilder<VehicleSearchCubit, VehicleSearchState>(
                        builder: (context, searchState) {
                          return AnimatedSize(
                            duration: const Duration(milliseconds: 200),
                            child: searchState.when(
                              inactive: () => Padding(
                                padding: EdgeInsets.only(top: topSpacing),
                                child: const VehicleSegmentedButton(),
                              ),
                              idle: (devices) => const SizedBox(width: double.infinity),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: screenHeight * 0.01),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xFFFAF9FB)),
                      child: BlocBuilder<VehicleSearchCubit, VehicleSearchState>(
                        builder: (context, searchState) {
                          return searchState.when(
                            inactive: () => DevicesListView(devices: devices),
                            idle: (devices) => DevicesListView(devices: devices),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
