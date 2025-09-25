import 'package:flutter/material.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_name_address_section.dart';

class VehicleDetailsHeader extends StatelessWidget {
  const VehicleDetailsHeader({
    super.key,
    required this.model,
  });

  final Device model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(241, 241, 241, 1),
          ),
          color: const Color.fromRGBO(255, 255, 255, 1)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: AppHelper.getVehicleImage(model).image(
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: VehicleNameAddressSection(model: model)),
        ],
      ),
    );
  }
}
