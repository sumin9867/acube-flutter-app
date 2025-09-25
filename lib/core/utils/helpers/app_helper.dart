import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/assets.gen.dart';

enum VehicleType {
  car,
  motorcycle,
  bus,
  ambulance,
  fire,
  schoolBus,
  truck,
  jcb,
  van,
  cycle,
  pickup,
  safari,
  tempo,
  scooter,
  tractor,
  rmc,
}

extension VehicleTypeExtension on VehicleType {
  String get stringValue => toString().split('.').last;
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

class AppHelper {
  static Widget getCategoryImage(
    BuildContext context,
    bool? isExpired,
    String? category, {
    double? customHeight,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;

    final double carHeight = customHeight ?? screenHeight * 0.13;
    final double bikeHeight = customHeight ?? screenHeight * 0.18;
    final double smallHeight = customHeight ?? screenHeight * 0.15;

    double topFactor(double factor) {
      // If expired, leave default top
      if (isExpired == true) return -screenHeight * factor;
      // If not expired, move slightly up
      return -screenHeight * (factor + 0.04);
    }

    Widget buildImage(Image image, {double top = -15, double end = 5}) {
      return PositionedDirectional(
        top: top,
        end: end,
        child: IgnorePointer(child: image),
      );
    }

    switch (category) {
      case 'car':
        return buildImage(
          Assets.images.devices.car.carSide.image(height: carHeight, fit: BoxFit.contain),
          top: topFactor(-0.02),
          end: 5,
        );
      case 'motorcycle':
      case 'bike':
        return buildImage(
          Assets.images.devices.bike.bikeSide.image(height: bikeHeight, fit: BoxFit.contain),
          top: topFactor(-0.03),
          end: 20,
        );
      case 'bus':
        return buildImage(
          Assets.images.devices.bus.busSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
          end: -25,
        );
      case 'schoolBus':
        return buildImage(
          Assets.images.devices.schoolBus.schoolSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'fire':
        return buildImage(
          Assets.images.devices.fire.fireSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'jcb':
        return buildImage(
          Assets.images.devices.jcb.jcbSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'pickup':
      case 'pickup_van':
        return buildImage(
          Assets.images.devices.pickupVan.pickupSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'truck':
        return buildImage(
          Assets.images.devices.truck.truckSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'ambulance':
        return buildImage(
          Assets.images.devices.ambulance.ambulanceSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'scooter':
        return buildImage(
          Assets.images.devices.scooter.scSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
          end: 20,
        );
      case 'cycle':
      case 'bicycle':
        return buildImage(
          Assets.images.devices.bicycle.cycleSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'safari':
        return buildImage(
          Assets.images.devices.safari.safariSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'tempo':
        return buildImage(
          Assets.images.devices.tempo.tempoSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );
      case 'van':
        return buildImage(
          Assets.images.devices.van.vanSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );

      case 'rmc':
        return buildImage(
          Assets.images.devices.rmc.rmcSide.image(height: customHeight ?? screenHeight * 0.12, fit: BoxFit.contain),
          top: topFactor(-0.010),
        );
      case 'tractor':
      case 'trpp':
        return buildImage(
          Assets.images.devices.trpp.trppSide.image(height: smallHeight, fit: BoxFit.contain),
          top: topFactor(-0.018),
        );

      default:
        return buildImage(
          Assets.images.selectedcar.image(height: carHeight, fit: BoxFit.contain),
          top: topFactor(0.012),
          end: 0,
        );
    }
  }

  static String getCourseDirection(double course) {
    if (course >= 337.5 || course < 22.5) return 'N';
    if (course >= 22.5 && course < 67.5) return 'NE';
    if (course >= 67.5 && course < 112.5) return 'E';
    if (course >= 112.5 && course < 157.5) return 'SE';
    if (course >= 157.5 && course < 202.5) return 'S';
    if (course >= 202.5 && course < 247.5) return 'SW';
    if (course >= 247.5 && course < 292.5) return 'W';
    if (course >= 292.5 && course < 337.5) return 'NW';
    return 'N/A';
  }

  static String meterToKm(double meter, [int fractionDigits = 2]) => (meter / 1000).toStringAsFixed(fractionDigits);

  static String formatSpeed(double speed) => (speed * 1.852).toStringAsFixed(0);

  static String rssiIntToLabel(int? rssi) {
    if (rssi == null) return 'Off';
    if (rssi <= 1) return 'Weak';
    if (rssi <= 3) return 'Normal';
    return 'Strong';
  }

  static double knotsToKmph(double knots, [int fractionDigits = 2]) =>
      double.parse((knots * 1.852).toStringAsFixed(fractionDigits));

  static AssetGenImage getVehicleImage(Device vehicle) {
    switch (vehicle.category) {
      case 'ambulance':
        return Assets.images.devices.ambulance.ambulanceSide;
      case 'bike':
      case 'motorcycle':
        return Assets.images.devices.bike.bikeSide;
      case 'bus':
        return Assets.images.devices.bus.busSide;
      case 'car':
        return Assets.images.devices.car.carSide;
      case 'fire':
        return Assets.images.devices.fire.fireSide;
      case 'jcb':
        return Assets.images.devices.jcb.jcbSide;
      case 'pickup':
      case 'pickup_van':
        return Assets.images.devices.pickupVan.pickupSide;
      case 'school_bus':
        return Assets.images.devices.schoolBus.schoolSide;
      case 'truck':
        return Assets.images.devices.truck.truckSide;
      case 'scooter':
        return Assets.images.devices.scooter.scSide;
      case 'safari':
        return Assets.images.devices.safari.safariSide;
      case 'bicycle':
      case 'cycle':
        return Assets.images.devices.bicycle.cycleSide;
      case 'trpp':
      case 'tractor':
        return Assets.images.devices.trpp.trppSide;
      case 'van':
        return Assets.images.devices.van.vanSide;
      case 'tempo':
        return Assets.images.devices.tempo.tempoSide;
      case 'rmc':
        return Assets.images.devices.rmc.rmcSide;
      default:
        return Assets.images.devices.car.carSide;
    }
  }

  static AssetGenImage getVehiclePngImage(Device vehicle) => getVehicleImage(vehicle);
}
