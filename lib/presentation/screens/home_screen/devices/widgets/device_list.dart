import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_card.dart';
import 'package:gpspro/router/route_helper.dart';
import 'package:gpspro/router/route_params.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({
    super.key,
    required this.devices,
  });

  final List<DeviceCubit> devices;

  @override
  Widget build(BuildContext context) {
    if (devices.isEmpty) {
      return const Center(
        child: Text('No devices found'),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20.0,
      ),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _DeviceCardWrapper(
            deviceCubit: device,
          ),
        );
      },
    );
  }
}

class _DeviceCardWrapper extends StatelessWidget {
  const _DeviceCardWrapper({
    required this.deviceCubit,
  });

  final DeviceCubit deviceCubit;

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;

    final user = authState.maybeMap(
      authenticated: (auth) => auth.user,
      orElse: () => null,
    );

    if (user == null) {
      return const SizedBox.shrink();
    }

    return BlocProvider.value(
      value: deviceCubit,
      child: BlocBuilder<DeviceCubit, Device>(
        builder: (context, device) {
          return GestureDetector(
            onTap: () {
              RouteHelper.pushDeviceDetailsPage(
                VehicleDetailsRouteParams(
                  device: device,
                ),
              );
            },
            child: VehicleCard(
              user: user,
              model: device,
            ),
          );
        },
      ),
    );
  }
}
