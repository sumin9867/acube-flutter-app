import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:gpspro/domain/models/PermissionModel.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';
import 'package:gpspro/presentation/screens/geofence/infrastructure/i_geofence_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GeofenceRepo)
class GeofenceRepoImp implements GeofenceRepo {
  final RemoteSource remoteSource;

  const GeofenceRepoImp({required this.remoteSource});

  @override
  Future<GeofenceModel> addGeofence(GeofenceModel fence) async {
    try {
      log('addGeofence request: ${fence.toJson()}');

      final result = await remoteSource.post(
        'api/geofences',
        data: fence.toJson(),
      );

      log('addGeofence response: ${result.statusCode}');
      return GeofenceModel.fromJson(result.data);
    } catch (e, s) {
      // Log the actual error returned by the API or Dio
      if (e is DioException) {
        log('addGeofence DioError: ${e.response?.data ?? e.message}');
      } else {
        log('addGeofence unexpected error: $e', stackTrace: s);
      }
      rethrow; // propagate error to caller
    }
  }

  @override
  Future<void> deleteGeofence(int geofenceId) async {
    try {
      await remoteSource.delete('api/geofences/$geofenceId');
    } catch (e, s) {
      log('deleteGeofence failed: $e', stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> addPermission(GeofencePermModel permission) async {
    try {
      await remoteSource.post(
        'api/permissions',
        data: permission.toJson(),
      );
    } catch (e, s) {
      log('addPermission failed: $e', stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deletePermission(GeofencePermModel permission) async {
    try {
      await remoteSource.delete(
        'api/permissions',
        data: permission.toJson(),
      );
    } catch (e, s) {
      log('deletePermission failed: $e', stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<GeofenceModel>> getGeoFencesByDeviceID(String deviceId) async {
    try {
      final response = await remoteSource.get(
        'api/geofences',
        queryParams: {'deviceId': deviceId},
      );
      final listMap = response.data as List<dynamic>;
      return listMap.map((e) => GeofenceModel.fromJson(e)).toList();
    } catch (e, s) {
      log('getGeoFencesByDeviceID failed: $e', stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<GeofenceModel>> getGeoFencesByUserID() async {
    try {
      final response = await remoteSource.get('api/geofences');
      final listMap = response.data as List<dynamic>;
      return listMap.map((e) => GeofenceModel.fromJson(e)).toList();
    } catch (e, s) {
      log('getGeoFencesByUserID failed: $e', stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<Either<String, String>> editGeofence(geofence) async {
    try {
      log('editGeofence request params: ${geofence.toJson()}');
      final response = await remoteSource.put(
        'api/geofences/${geofence.id}',
        data: geofence.toJson(),
      );
      log('editGeofence response: $response');
      return const Right('Geofence updated successfully');
    } on AppException catch (e) {
      log('editGeofence AppException: ${e.message}');
      return Left(e.message ?? 'Failed to update geofence');
    } catch (e, s) {
      log('editGeofence unexpected error: $e', stackTrace: s);
      return const Left('Unexpected error occurred');
    }
  }
}
