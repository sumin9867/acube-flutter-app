import 'package:gpspro/domain/models/Device.dart';

class DeviceArguments {
  final int? id;
  final String? name;
  final Device? device;
  DeviceArguments(
    this.id,
    this.name,
    this.device,
  );
}
