import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/RouteReport.dart';
import 'package:gpspro/domain/models/Summary.dart';
import 'package:gpspro/domain/models/vehicle_command.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/presentation/screens/add_vehicle/models/imei_verification_failure.dart';
import 'package:gpspro/presentation/screens/add_vehicle/models/imei_verification_success.dart';

abstract class DeviceRepo {
  Future<Either<String, List<Device>>> getDevices();
  Future<Either<String, String>> addDevice(AddDeviceRequest deviceRequest);

  Future<List<Summary>> getSummary(
    String deviceId,
    DateTime from,
    DateTime to, {
    bool fetchDailyData = false,
  });

  Future<List<VehicleTrip>> getTrip(
    String deviceId,
    DateTime from,
    DateTime to,
  );

  Future<List<VehicleStop>> getStops(
    String deviceId,
    DateTime from,
    DateTime to,
  );
  Future<Either<String, bool>> hasDevicesQuickCheck();

  Future<List<RouteReport>> getRoute(String deviceId, String from, String to);
  Future<Response> sendCommands(Command command);

  Future<List<PositionModel>> getPositions(
    String deviceId,
    DateTimeRange dateTimeRange,
  );

  Future<Device> getDeviceById(String id);
  Future<Either<ImeiVerificationFailure, ImeiVerificationSuccess>> verifyImeiNumber(String imei);

  Future<Response> updateDevice(DeviceCustomName device);
  Future<String> getMileage(String deviceId);
  Future<bool> updateMileage(String deviceId, String mileage);
}
