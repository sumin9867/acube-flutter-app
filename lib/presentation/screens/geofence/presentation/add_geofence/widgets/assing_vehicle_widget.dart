import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';

class AssignVehiclesTile extends StatefulWidget {
  final Function(List<String> selectedIds) onSelectionChanged;

  const AssignVehiclesTile({super.key, required this.onSelectionChanged});

  @override
  State<AssignVehiclesTile> createState() => _AssignVehiclesTileState();
}

class _AssignVehiclesTileState extends State<AssignVehiclesTile> {
  List<bool> _selected = [];

  void _notifyParent(List<DeviceCubit> deviceCubits) {
    final selectedIds = <String>[];
    for (int i = 0; i < deviceCubits.length; i++) {
      if (_selected[i]) {
        selectedIds.add(deviceCubits[i].state.id.toString());
      }
    }
    widget.onSelectionChanged(selectedIds);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
      title: const Text(
        'Assign Vehicles',
        style: TextStyle(
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: -0.3,
          color: Color.fromRGBO(24, 24, 24, 1),
        ),
      ),
      subtitle: const Text(
        'You can assign geofence for specific vehicles',
        style: TextStyle(
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: -0.3,
          color: Color.fromRGBO(100, 100, 100, 1),
        ),
      ),
      children: [
        BlocBuilder<MyDevicesCubit, MyDevicesState>(
          builder: (context, state) => state.maybeWhen(
            idle: (devices) {
              // Initialize selection list
              if (_selected.length != devices.length) {
                _selected = List<bool>.filled(devices.length, false);
              }

              return Column(
                children: devices.asMap().entries.map((entry) {
                  final index = entry.key;
                  final device = entry.value;

                  return BlocProvider.value(
                    value: device,
                    child: BlocBuilder<DeviceCubit, Device>(
                      builder: (context, deviceState) {
                        final isSelected = _selected[index];

                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? Colors.transparent : const Color.fromRGBO(235, 235, 235, 1),
                                width: 1,
                              ),
                              color: isSelected ? const Color.fromRGBO(8, 128, 234, 0.1) : Colors.transparent,
                            ),
                            child: AssignVehiclesTileHelper.getCategoryImage(
                              deviceState.category,
                              height: 40,
                            ),
                          ),
                          title: Text(
                            deviceState.name,
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 24 / 16,
                              letterSpacing: -0.3,
                              color: Color.fromRGBO(24, 24, 24, 1),
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              value: isSelected,
                              onChanged: (val) {
                                setState(() {
                                  _selected[index] = val ?? false;
                                  _notifyParent(devices);
                                });
                              },
                              activeColor: const Color.fromRGBO(8, 128, 234, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              splashRadius: 24,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class AssignVehiclesTileHelper {
  static Widget getCategoryImage(String? category, {double? height}) {
    height ??= 40;

    switch (category) {
      case 'car':
        return Assets.images.devices.car.carSide.image(height: height, fit: BoxFit.contain);
      case 'motorcycle':
        return Assets.images.devices.bike.bikeSide.image(height: height, fit: BoxFit.contain);
      case 'bus':
        return Assets.images.devices.bus.busSide.image(height: height, fit: BoxFit.contain);
      case 'schoolBus':
        return Assets.images.devices.schoolBus.schoolSide.image(height: height, fit: BoxFit.contain);
      case 'fire':
        return Assets.images.devices.fire.fireSide.image(height: height, fit: BoxFit.contain);
      case 'jcb':
        return Assets.images.devices.jcb.jcbSide.image(height: height, fit: BoxFit.contain);
      case 'pickup':
        return Assets.images.devices.pickupVan.pickupSide.image(height: height, fit: BoxFit.contain);
      case 'truck':
        return Assets.images.devices.truck.truckSide.image(height: height, fit: BoxFit.contain);
      case 'ambulance':
        return Assets.images.devices.ambulance.ambulanceSide.image(height: height, fit: BoxFit.contain);
      case 'scooter':
        return Assets.images.devices.scooter.scSide.image(height: height, fit: BoxFit.contain);
      case 'cycle':
        return Assets.images.devices.bicycle.cycleSide.image(height: height, fit: BoxFit.contain);
      case 'safari':
        return Assets.images.devices.safari.safariSide.image(height: height, fit: BoxFit.contain);
      case 'tempo':
        return Assets.images.devices.tempo.tempoSide.image(height: height, fit: BoxFit.contain);
      case 'van':
        return Assets.images.devices.van.vanSide.image(height: height, fit: BoxFit.contain);
      case 'tractor':
        return Assets.images.devices.trpp.trppSide.image(height: height, fit: BoxFit.contain);
      default:
        return Assets.images.selectedcar.image(height: height, fit: BoxFit.contain);
    }
  }
}
