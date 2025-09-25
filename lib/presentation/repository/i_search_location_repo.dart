import 'package:gpspro/domain/models/search_location_model.dart';

abstract class SearchLocationRepo {
  Future<List<SearchLocationModel>> searchLocation({
    required String query, // Assuming you search with a query
  });
  Future<SearchLocationModel> reverseLocation({
    required num longitude,
    required num latitude, // Assuming you search with a query
  });
}
