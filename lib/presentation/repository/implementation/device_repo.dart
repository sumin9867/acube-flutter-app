import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/constants/api_constant.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:gpspro/database/position_database.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/RouteReport.dart';
import 'package:gpspro/domain/models/Summary.dart';
import 'package:gpspro/domain/models/vehicle_command.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/screens/add_vehicle/models/imei_verification_failure.dart';
import 'package:gpspro/presentation/screens/add_vehicle/models/imei_verification_success.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DeviceRepo)
class DeviceRepoImp implements DeviceRepo {
  final RemoteSource remoteSource;
  final PositionDatabase positionDB;

  DeviceRepoImp({
    required this.remoteSource,
    required this.positionDB,
  });

  static const _defaultDeviceUrl = '${ApiConstant.baseUrl}/devices';
  static const _computedUrl = '${ApiConstant.baseUrl}/computed';

  @override
  Future<Either<String, List<Device>>> getDevices() async {
    try {
      final response = await remoteSource.get(
        _defaultDeviceUrl,
      );

      if (response.data == null || response.data is! List) {
        return left('Invalid response format');
      }

      final list = response.data as List<dynamic>;
      final devices = list.map((e) => Device.fromJson(e)).toList();

      return right(devices);
    } on DioException catch (dioError, stackTrace) {
      String errorMessage = 'Unknown error';

      if (dioError.response != null && dioError.response!.data != null) {
        final data = dioError.response!.data;
        try {
          if (data is Map<String, dynamic> && data['message'] != null) {
            if (data['message'] is Map<String, dynamic> && data['message']['message'] != null) {
              errorMessage = data['message']['message'];
            } else if (data['message'] is String) {
              errorMessage = data['message'];
            }
          } else if (data is String) {
            errorMessage = data;
          }
        } catch (e) {
          log('Error parsing API error message: $e', stackTrace: stackTrace);
        }
      }

      log('getDevices failed: $errorMessage', stackTrace: stackTrace);
      return left(errorMessage);
    } catch (e, stackTrace) {
      log('getDevices failed: $e', stackTrace: stackTrace);
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> hasDevicesQuickCheck() async {
    try {
      final response = await remoteSource.get(
        _defaultDeviceUrl,
        options: Options(
          // This prevents Dio from throwing automatically for non-2xx
          validateStatus: (status) => true,
        ),
      );

      log('Devices API raw data: ${response.data}');
      log('Status code: ${response.statusCode}');

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        // Success
        final data = response.data;
        if (data is List) {
          return right(data.isNotEmpty);
        } else {
          return right(false);
        }
      } else {
        // Error response from server
        final data = response.data;
        String message = 'Unknown error';

        if (data != null) {
          if (data is Map<String, dynamic>) {
            if (data['message'] != null) {
              final nested = data['message'];
              if (nested is Map<String, dynamic> && nested['message'] != null) {
                message = nested['message'].toString();
              } else {
                message = nested.toString();
              }
            } else {
              message = data.toString();
            }
          } else {
            message = data.toString();
          }
        }

        log('Server error message: $message');
        return left(message);
      }
    } on DioException catch (e) {
      // Catch network / other Dio errors
      final data = e.response?.data;
      String message = e.message?.toString() ?? 'Network error occurred';

      if (data != null) {
        if (data is Map<String, dynamic>) {
          if (data['message'] != null) {
            final nested = data['message'];
            if (nested is Map<String, dynamic> && nested['message'] != null) {
              message = nested['message'].toString();
            } else {
              message = nested.toString();
            }
          } else {
            message = data.toString();
          }
        } else {
          message = data.toString();
        }
      }

      log('DioError server message: $message');
      return left(message);
    } catch (e) {
      log('Unexpected error: $e');
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> addDevice(AddDeviceRequest deviceRequest) async {
    try {
      final cookie = locator.get<AuthCubit>().userSession?.cookie;
      if (cookie == null) {
        return const Left('No user session cookie found');
      }

      final Map<String, dynamic> data = deviceRequest.toJson();

      final response = await remoteSource.post(
        _defaultDeviceUrl,
        data: data,
      );

      if (response.statusCode != 201) {
        final errorMsg = (response.data is Map && response.data.containsKey('message'))
            ? response.data['message'].toString()
            : (response.statusMessage ?? 'Unknown error');
        return Left(errorMsg);
      }

      return const Right('Device added successfully');
    } on AppException {
      return const Left('AppException occurred');
    } catch (e) {
      return const Left('Unexpected error occurred');
    }
  }

  @override
  Future<List<VehicleStop>> getStops(
    String deviceId,
    DateTime from,
    DateTime to,
  ) async {
    log('📡 Fetching stops for deviceId: $deviceId');

    final cookie = locator.get<AuthCubit>().userSession?.cookie;

    final headers = {
      'Cookie': cookie,
      'Content-Type': 'application/json',
    };

    final queryParams = {
      'deviceId': deviceId,
      'from': from.toUtc().toIso8601String(),
      'to': to.toUtc().toIso8601String(),
    };

    try {
      final response = await remoteSource.get(
        '/api/reports/stops',
        queryParams: queryParams,
      );

      final Iterable list = response.data as List<dynamic>;
      final data = List<VehicleStop>.generate(
        list.length,
        (index) => VehicleStop.fromJson(list.elementAt(index)),
      );

      return data;
    } catch (e, s) {
      log('❌ Unknown error in getStops: $e', stackTrace: s);
      throw AppException(
        message: 'Failed to fetch stops: $e',
      );
    }
  }

  @override
  Future<List<Summary>> getSummary(String deviceId, DateTime from, DateTime to, {bool fetchDailyData = false}) async {
    try {
      final response = await remoteSource.get(
        '/api/reports/summary',
        queryParams: {
          'deviceId': deviceId,
          'from': from.toUtc().toIso8601String(),
          'to': to.toUtc().toIso8601String(),
          'daily': fetchDailyData.toString()
        },
      );

      log('I am data from summary $response');
      final Iterable list = response.data as List<dynamic>;
      return List<Summary>.generate(list.length, (index) => Summary.fromJson(list.elementAt(index)));
    } catch (e, s) {
      log('Error in getSummary $e');
      throw const AppException();
    }
  }

  @override
  Future<List<VehicleTrip>> getTrip(String deviceId, DateTime from, DateTime to) async {
    log('Response received for getTrip - deviceId: $deviceId, from: $from, to: $to');
    final cookie = locator.get<AuthCubit>().userSession?.cookie;

    final headers = {
      'Cookie': cookie,
      'Content-Type': 'application/json',
    };

    final queryParams = {
      'deviceId': deviceId,
      'from': from.toUtc().toIso8601String(),
      'to': to.toUtc().toIso8601String(),
    };

    final response = await remoteSource.get(
      '/api/reports/trips',
      queryParams: queryParams,
      options: Options(
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    log('Response received $response');

    try {
      // Ensure the response is a list
      if (response.data is! List) {
        throw const AppException(message: 'API response is not a list');
      }

      final List<dynamic> list = response.data;

      // ✅ Handle empty list case
      if (list.isEmpty) {
        log('⚠️ No trips found for the given parameters');
        return [];
      }

      final trips = <VehicleTrip>[];
      for (int i = 0; i < list.length; i++) {
        final item = list[i];

        if (item is! Map<String, dynamic>) {
          throw const AppException(message: 'Invalid trip item format');
        }

        final trip = VehicleTrip.fromJson(item);
        trips.add(trip);
      }

      log('✅ Successfully parsed ${trips.length} trips');
      return trips;
    } on AppException catch (e) {
      log('AppException occurred: ${e.message}');
      rethrow;
    } catch (e, s) {
      log('❌ Unknown error occurred: $e\n$s');
      throw const AppException(message: 'Failed to fetch trips');
    } finally {
      log('🔚 Finished getTrip execution');
    }
  }

  @override
  Future<Response> sendCommands(Command command) async {
    try {
      final response = await remoteSource.post(
        '/api/commands/send',
        data: command.toJson(),
      );

      return response;
    } catch (e, s) {
      log('Error sending command: $e', stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<RouteReport>> getRoute(String deviceId, String from, String to) async {
    try {
      final response = await remoteSource.get(
        '/api/reports/route',
        queryParams: {
          'deviceId': deviceId,
          'from': from,
          'to': to,
        },
      );
      final Iterable list = response.data['data'] as List<dynamic>;
      return List<RouteReport>.generate(
        list.length,
        (index) => RouteReport.fromJson(list.elementAt(index)),
      );
    } on AppException {
      rethrow;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<List<PositionModel>> getPositions(String deviceId, DateTimeRange range) async {
    try {
      final response = await remoteSource.get(
        '/api/positions',
        queryParams: {
          'deviceId': deviceId,
          'from': range.start.toUtc().toIso8601String(),
          'to': range.end.toUtc().toIso8601String(),
        },
      );

      log('i am response playback $response');

      final list = response.data as List<dynamic>;
      return foundation.compute(
        (data) => data.map((e) => PositionModel.fromJson(e)).toList(),
        list,
      );
    } catch (e, s) {
      log('Error in getPositions: $e');

      throw AppException(message: e.toString());
    }
  }

  @override
  Future<Device> getDeviceById(String id) async {
    try {
      final response = await remoteSource.get(
        _defaultDeviceUrl,
        queryParams: {'id': id},
      );
      final list = response.data as List<dynamic>;
      if (list.isEmpty) throw const AppException(message: 'Device not found');
      return Device.fromJson(list.first);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<Response> updateDevice(DeviceCustomName device) async {
    try {
      final response = await remoteSource.put(
        '$_defaultDeviceUrl/${device.id}',
        data: device.toJson(),
      );
      return response;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<Either<ImeiVerificationFailure, ImeiVerificationSuccess>> verifyImeiNumber(String imei) async {
    try {
      final response = await remoteSource.get(
        '$_defaultDeviceUrl/check-imei/$imei',
      );

      if ([200, 201].contains(response.statusCode)) {
        return const Right(ImeiVerificationSuccess.network(apiData: 'IMEI Verified'));
      }

      return const Left(ImeiVerificationFailure.client(message: 'Unexpected error'));
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      log(e.toString());
      return const Left(ImeiVerificationFailure.client(
          message: 'IMEI you entered is already in use. Please verify your IMEI and try again.'));
    }
  }

  ImeiVerificationFailure _handleDioError(DioException e) {
    final status = e.response?.statusCode ?? 0;
    final message = e.response?.data?['message'] ?? 'Unknown error';

    if (status == 401) {
      return ImeiVerificationFailure.client(message: message);
    } else if (status >= 500) {
      return const ImeiVerificationFailure.server();
    }
    return const ImeiVerificationFailure.network();
  }

  @override
  Future<String> getMileage(String deviceId) async {
    try {
      final response = await remoteSource.get(
        'https://itsochvts.com/api/attributes/computed?deviceId=$deviceId',
      );

      if (response.statusCode == 200 && response.data is List && response.data.isNotEmpty) {
        final description = response.data[0]['description']?.toString().toLowerCase() ?? '';
        return description.split('km/l').first.trim();
      }

      throw const AppException(message: 'Error fetching mileage');
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<bool> updateMileage(String deviceId, String mileage) async {
    try {
      final response = await remoteSource.post(
        '$_computedUrl/mileage',
        data: {'vehicleId': deviceId, 'mileage': mileage},
      );

      return [200, 201].contains(response.statusCode);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw const AppException();
    }
  }
}
