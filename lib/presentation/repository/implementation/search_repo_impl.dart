import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/data/sources/remote_source.dart';
import 'package:gpspro/domain/models/search_location_model.dart';
import 'package:gpspro/presentation/repository/i_search_location_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchLocationRepo)
class SearchRepoImpl implements SearchLocationRepo {
  final RemoteSource remoteSource;
  final Dio dio = Dio();

  SearchRepoImpl({required this.remoteSource});

  @override
  Future<List<SearchLocationModel>> searchLocation({required String query}) async {
    try {
      final response = await dio.get(
        'https://geo.itsoch.xyz/search.php?q=$query&format=jsonv2',
      );

      final List<SearchLocationModel> locations =
          (response.data as List).map((json) => SearchLocationModel.fromJson(json)).toList();

      log('I am resposne form $locations');

      return locations;
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }

  @override
  Future<SearchLocationModel> reverseLocation({required num longitude, required num latitude}) async {
    try {
      log('I have recached here $latitude');
      log('I have recached here $longitude');

      final response = await dio.get(
        'https://geo.itsoch.xyz/reverse.php?lat=$longitude&lon=$latitude&zoom=18&format=jsonv2',
      );

      final SearchLocationModel locations = SearchLocationModel.fromJson(response.data);

      log('I am resposne form $locations');

      return locations;
    } on AppException {
      rethrow;
    } catch (e, s) {
      AppLogger.error(e, stackTrace: s);
      throw const AppException();
    }
  }
}
