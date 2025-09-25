import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/repository/i_event_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EventRepo)
class EventRepoImp implements EventRepo {
  final RemoteSource remoteSource;

  EventRepoImp({required this.remoteSource});

  @override
  Future<List<VehicleEvent>> getAllDeviceEvents({
    required List<String> deviceIds,
    required List<String> types,
    required String from,
    required String to,
    required int limit,
    required int page,
  }) async {
    try {
      log('Fetch from $from to $to for types: $types and deviceIds: $deviceIds');
      final uri = Uri(
        scheme: 'https',
        host: 'api.trackongps.com',
        path: '/api2/events',
        queryParameters: {
          'from': from,
          'to': to,
          'sort': 'desc',
          'page': '$page',
          'limit': '$limit',
        },
      );
      log('I am Url $uri');

      final buffer = StringBuffer(uri.query);
      for (var type in types) {
        buffer.write('&type=$type');
      }
      for (var id in deviceIds) {
        buffer.write('&deviceIds=$id');
      }

      final fullUrl = '${uri.replace(query: buffer.toString())}';
      log('Final GET URL: $fullUrl');

      final response = await remoteSource.get(
        fullUrl,
      );

      final responseData = response.data;

      if (responseData == null || responseData['data'] is! List) {
        throw Exception('Invalid response format: no data list found');
      }

      final listMap = responseData['data'] as List;

      return listMap.map((item) {
        item['attributes'] = _parseAttributes(item['attributes']);
        return VehicleEvent.fromJson(item);
      }).toList();
    } on DioException catch (e, s) {
      final errorMessage = e.response?.data?['message'] ?? e.message;
      _handleError('getAllDeviceEvents failed', errorMessage, s);
    } catch (e, s) {
      _handleError('getAllDeviceEvents failed', e, s);
    }
  }

  @override
  Future<List<PositionModel>> getPositionById(
    String positionId,
    String deviceId,
  ) async {
    log('Position id $positionId');
    try {
      final response = await remoteSource.get(
        'api/positions',
        queryParams: {
          'deviceId': deviceId,
          'id': positionId,
        },
      );

      final listMap = response.data as List<dynamic>;
      return listMap.map((item) => PositionModel.fromJson(item)).toList();
    } catch (e, s) {
      _handleError('getPositionById failed', e, s);
    }
  }

  Map<String, dynamic> _parseAttributes(dynamic rawAttributes) {
    if (rawAttributes == null || rawAttributes == '') return {};
    if (rawAttributes is Map<String, dynamic>) return rawAttributes;
    try {
      return jsonDecode(rawAttributes);
    } catch (_) {
      return {};
    }
  }

  Never _handleError(String message, Object error, StackTrace stackTrace) {
    AppLogger.error('$message: $error', stackTrace: stackTrace);
    throw const AppException();
  }
}
