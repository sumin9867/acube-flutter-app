import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/subscription_color.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/subscription_screen_widget/subscription_widget.dart';

class VehicleSubscriptionScreen extends StatelessWidget {
  const VehicleSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceCubit = context.read<MyDevicesCubit>();

    return Scaffold(
      backgroundColor: SubscriptionAppColors.background,
      appBar: AppBar(
        backgroundColor: SubscriptionAppColors.white,
        elevation: 0,
        title: Text(
          context.locale.subscription,
          style: context.textTheme.headlineSmall?.copyWith(
            color: const Color.fromRGBO(24, 24, 24, 1),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<MyDevicesCubit, MyDevicesState>(
        builder: (context, state) => state.maybeWhen(
          idle: (devices) {
            final now = DateTime.now();

            final sortedDevices = List<DeviceCubit>.from(devices)
              ..sort((a, b) {
                final aExpiry = a.state.expirationTime ?? now;
                final bExpiry = b.state.expirationTime ?? now;
                return aExpiry.compareTo(bExpiry);
              });

            return RefreshIndicator.adaptive(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: deviceCubit.refreshDevices,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 600;
                  return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 20),
                        sliver: SliverList.builder(
                          itemCount: sortedDevices.length,
                          itemBuilder: (context, index) =>
                              SubscriptionWidget(deviceCubit: sortedDevices[index], isWide: isWide),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
