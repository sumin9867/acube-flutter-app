import 'package:dartz/dartz.dart';
import 'package:gpspro/domain/models/PermissionModel.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';

abstract class GeofenceRepo {
  Future<GeofenceModel> addGeofence(GeofenceModel fence);
  Future<void> deleteGeofence(int geofenceId);
  Future<Either<String, String>> editGeofence(GeofenceModel geofenceModel);
  Future<void> addPermission(GeofencePermModel permission);
  Future<void> deletePermission(GeofencePermModel permission);
  Future<List<GeofenceModel>> getGeoFencesByDeviceID(String deviceId);
  Future<List<GeofenceModel>> getGeoFencesByUserID();
}
