import 'package:flutter/material.dart';
import 'package:gpspro/gen/assets.gen.dart';

enum VehicleType {
  motorcycle,
  car,
  scooter,
  van,
  ambulance,
  cycle,
  fire,
  schoolBus,
  truck,
  pickup,
  safari,
  jcb,
  bus,
  tempo,
  tractor,
  rmc,
}

class VehicleImageHelper {
  static const double _imageSize = 50;

  static Widget getVehicleImage(VehicleType vehicle) {
    switch (vehicle) {
      case VehicleType.motorcycle:
        return Assets.images.devices.bike.bikeSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.car:
        return Assets.images.devices.car.carSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.scooter:
        return Assets.images.devices.scooter.scSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.van:
        return Assets.images.devices.van.vanSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.ambulance:
        return Assets.images.devices.ambulance.ambulanceSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.cycle:
        return Assets.images.devices.bicycle.cycleSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.fire:
        return Assets.images.devices.fire.fireSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.schoolBus:
        return Assets.images.devices.schoolBus.schoolSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.truck:
        return Assets.images.devices.truck.truckSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.pickup:
        return Assets.images.devices.pickupVan.pickupSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.safari:
        return Assets.images.devices.safari.safariSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.jcb:
        return Assets.images.devices.jcb.jcbSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.bus:
        return Assets.images.devices.bus.busSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.tempo:
        return Assets.images.devices.tempo.tempoSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.tractor:
        return Assets.images.devices.trpp.trppSide.image(height: _imageSize, width: _imageSize);
      case VehicleType.rmc:
        return Assets.images.devices.rmc.rmcSide.image(height: _imageSize, width: _imageSize);
    }
  }
}
