import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/search_location_model.dart';
import 'package:gpspro/presentation/repository/i_search_location_repo.dart';
import 'package:injectable/injectable.dart';

part 'search_location_state.dart';
part 'search_location_cubit.freezed.dart';

@injectable
class SearchLocationCubit extends Cubit<SearchLocationState> {
  final SearchLocationRepo searchLocationRepo;

  SearchLocationCubit(this.searchLocationRepo) : super(const SearchLocationState.initial());

  Future<void> searchLocation(String query) async {
    emit(const SearchLocationState.loading());
    try {
      final locations = await searchLocationRepo.searchLocation(query: query);

      log('Search Location Response: $locations');

      if (locations.isEmpty) {
        emit(const SearchLocationState.empty());
      } else {
        emit(SearchLocationState.idle(locations));
      }
    } catch (e, stackTrace) {
      log('SearchLocationCubit Error: $e', error: e, stackTrace: stackTrace);
      emit(SearchLocationState.error(e.toString()));
    }
  }
}
