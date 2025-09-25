import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/i_sharemodel.dart';
import 'package:gpspro/presentation/repository/i_share_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ShareRepo implements IShareRepo {
  final Dio _dio;

  ShareRepo({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<ShareResponse> generateShareLink(String expiration, String deviceId) async {
    try {
      const String url = 'https://itsochvts.com/api/devices/share';

      final userSession = locator.get<AuthCubit>().userSession;

      // Check for null access token
      if (userSession?.accessToken == null) {
        throw Exception('No valid access token found.');
      }

      // Check for null access token
      if (userSession?.cookie == null) {
        throw Exception('No valid cookie found.');
      }
      final Map<String, dynamic> data = {
        'deviceId': deviceId,
        'expiration': expiration,
      };

      final Map<String, dynamic> headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': userSession?.cookie,
      };

      final Response response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: headers,
          responseType: ResponseType.plain,
        ),
      );

      debugPrint('Raw Response: ${response.data}');
      debugPrint('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final token = response.data.toString().trim();
        return ShareResponse(token: token);
      } else {
        throw Exception('Failed to generate share link. Status code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        debugPrint('Dio Error: ${e.message}');
        debugPrint('Response: ${e.response?.data}');
      }
      throw Exception('Error generating share link: $e');
    }
  }
}
