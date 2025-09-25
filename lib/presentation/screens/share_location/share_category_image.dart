import 'package:flutter/material.dart';
import 'package:gpspro/gen/assets.gen.dart';

class ShareCategoryImage extends StatelessWidget {
  final String? category;

  const ShareCategoryImage({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * 0.08;

    switch (category) {
      case 'car':
        return Assets.images.devices.car.carSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'motorcycle':
        return Assets.images.devices.bike.bikeSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'scooter':
        return Assets.images.devices.scooter.scSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'bus':
        return Assets.images.devices.bus.busSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'school_bus':
        return Assets.images.devices.schoolBus.schoolSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'fire':
        return Assets.images.devices.fire.fireSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'jcb':
        return Assets.images.devices.jcb.jcbSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'pickup_van':
        return Assets.images.devices.pickupVan.pickupSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'truck':
        return Assets.images.devices.truck.truckSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      case 'ambulance':
        return Assets.images.devices.ambulance.ambulanceSide.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
      default:
        return Assets.images.selectedcar.image(
          height: imageHeight,
          fit: BoxFit.contain,
        );
    }
  }
}
