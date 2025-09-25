import 'package:gpspro/domain/models/vehicle_stop.dart';

abstract class StopItem {}

class StopPoint extends StopItem {
  final VehicleStop stop;
  StopPoint(this.stop);
}


