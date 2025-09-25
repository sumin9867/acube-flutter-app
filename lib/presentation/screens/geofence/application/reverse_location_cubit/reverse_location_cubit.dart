import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/search_location_model.dart';
import 'package:gpspro/presentation/repository/i_search_location_repo.dart';
import 'package:injectable/injectable.dart';

part 'reverse_location_cubit.freezed.dart';
part 'reverse_location_state.dart';

@injectable
class ReverseLocationCubit extends Cubit<ReverseLocationState> {
  final SearchLocationRepo searchLocationRepo;
  ReverseLocationCubit(this.searchLocationRepo) : super(const ReverseLocationState.initial());

  Future<void> reverseLocation(num longitude, num latitude) async {
    if (isClosed) return; // don't emit if already closed

    log('Reverse geocoding started, long: $longitude, lat:$latitude');
    emit(const ReverseLocationState.loading());

    try {
      final locations = await searchLocationRepo.reverseLocation(
        longitude: longitude,
        latitude: latitude,
      );

      if (isClosed) return; // check again
      log('Response: ${locations.displayName}');
      emit(ReverseLocationState.idle(locations));
    } catch (e) {
      if (isClosed) return;
      emit(ReverseLocationState.error(e.toString()));
    }
  }
}
