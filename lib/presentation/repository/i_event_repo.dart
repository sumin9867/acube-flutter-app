import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';

abstract class EventRepo {
  Future<List<VehicleEvent>> getAllDeviceEvents({
    required List<String> deviceIds,
    required List<String> types,
    required String from,
    required String to,
    required int limit,
    required int page,
  });

  Future<List<PositionModel>> getPositionById(String positionId, String deviceId);
}
