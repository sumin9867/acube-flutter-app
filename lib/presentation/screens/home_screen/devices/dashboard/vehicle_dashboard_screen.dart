import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/cubit/vehicle_dashboard_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/dashboard_views.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/dashboard_views/tabs/telematics/cubit/vehicle_telematics_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/widget/dashboard_tab.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/widget/date_selector_row.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/widget/shimmer_list.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/dashboard/widget/summary_telemetics.dart';

enum VehicleDashbaordTab {
  summary,
  trips,
  stops,
  events,
  telematics,
}

class VehicleDashboardScreen extends StatefulWidget {
  const VehicleDashboardScreen({super.key, required this.model});
  final Device model;

  @override
  State<VehicleDashboardScreen> createState() => _VehicleDashboardScreenState();
}

class _VehicleDashboardScreenState extends State<VehicleDashboardScreen> {
  final webSocketCubit = locator.get<WebsocketCubit>();
  VehicleDashbaordTab _selectedTab = VehicleDashbaordTab.summary;

  @override
  void initState() {
    webSocketCubit.disconnect();
    super.initState();
  }

  @override
  void dispose() {
    webSocketCubit.reconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<VehicleDashboardCubit>()..initialize(deviceId: widget.model.id)),
          BlocProvider(create: (_) => locator<VehicleTelematicsCubit>()),
        ],
        child: Column(
          children: [
            // App Bar
            AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: const Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: const BackButton(),
            ),

            // Date selector + Tab Bar + Body
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fixed: Date Selector
                  _selectedTab == VehicleDashbaordTab.telematics
                      ? BlocBuilder<VehicleTelematicsCubit, VehicleTelematicsState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => const ShimmerListLoader(
                                itemCount: 1,
                                height: 20,
                              ),
                              idle: (vm) => DateSelectorRow(
                                dateRange: DateTimeRange(start: vm.startDate, end: vm.endDate),
                                onChangePressed: () {
                                  context.read<VehicleTelematicsCubit>().selectDate(context, _tabToStep, _selectedTab);
                                },
                              ),
                              orElse: () => const SizedBox(height: 44),
                            );
                          },
                        )
                      : BlocBuilder<VehicleDashboardCubit, VehicleDashboardState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => const ShimmerListLoader(
                                itemCount: 1,
                                height: 20,
                              ),
                              idle: (vm, _) => DateSelectorRow(
                                dateRange: DateTimeRange(start: vm.startDate, end: vm.endDate),
                                onChangePressed: () {
                                  context.read<VehicleDashboardCubit>().selectDate(
                                        context,
                                        _tabToStep(_selectedTab),
                                      );
                                },
                              ),
                              orElse: () => const SizedBox(height: 44),
                            );
                          },
                        ),

                  const SizedBox(height: 8),

                  // Fixed: Tab Bar
                  DashboardTabBar(
                    selected: _selectedTab,
                    onChanged: (tab) => setState(() => _selectedTab = tab),
                  ),

                  const SizedBox(height: 8),

                  // Scrollable: Tab Content
                  Expanded(
                    child: BlocBuilder<VehicleDashboardCubit, VehicleDashboardState>(
                      builder: (context, state) => state.when(
                        initial: () => const SizedBox.shrink(),
                        loading: () => const ShimmerListLoader(),
                        error: (msg) => Center(child: Text(msg)),
                        idle: (vm, _) => _buildTabContent(vm),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(dynamic vm) {
    switch (_selectedTab) {
      case VehicleDashbaordTab.summary:
        return VehicleDashboardSummaryView(summary: vm.summary, model: widget.model);
      case VehicleDashbaordTab.trips:
        return SingleChildScrollView(child: VehicleDashboardTripsView(trips: vm.trips, device: widget.model));
      case VehicleDashbaordTab.stops:
        return SingleChildScrollView(child: VehicleDashboardStopsView(stops: vm.stops, device: widget.model));
      case VehicleDashbaordTab.events:
        return VehicleDashboardEventsView(device: widget.model, start: vm.startDate, end: vm.endDate);
      case VehicleDashbaordTab.telematics:
        return const SingleChildScrollView(child: SummaryTelemetics());
    }
  }

  DashboardStep _tabToStep(VehicleDashbaordTab tab) {
    switch (tab) {
      case VehicleDashbaordTab.summary:
        return DashboardStep.summary;
      case VehicleDashbaordTab.trips:
        return DashboardStep.trips;
      case VehicleDashbaordTab.stops:
        return DashboardStep.stops;
      case VehicleDashbaordTab.events:
        return DashboardStep.events;
      case VehicleDashbaordTab.telematics:
        return DashboardStep.telematics;
    }
  }
}
