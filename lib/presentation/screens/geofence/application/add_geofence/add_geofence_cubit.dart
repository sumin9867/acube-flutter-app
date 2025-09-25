import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';
import 'package:gpspro/presentation/screens/geofence/infrastructure/i_geofence_repo.dart';
import 'package:injectable/injectable.dart';

part 'add_geofence_cubit.freezed.dart';
part 'add_geofence_state.dart';

@injectable
class AddGeofenceCubit extends Cubit<AddGeofenceState> {
  final GeofenceRepo geofenceRepo;

  AddGeofenceCubit(
    this.geofenceRepo,
  ) : super(const _InitialState());

  void selectedPosition(LatLng position) {
    emit(_IdleState(
      AddGeofenceModel(
        position: position,
        fenceName: '',
        radiusInMeter: 100,
      ),
    ));
  }

  LatLng? _currentPosition;

  LatLng? get currentPosition => _currentPosition;

  Future<LatLng?> getCurrentLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const AddGeofenceState.error('Location services are disabled.'));
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        emit(const AddGeofenceState.error('Location permission denied.'));
        return null;
      }
    }

    try {
      final Position position = await Geolocator.getCurrentPosition();
      _currentPosition = LatLng(position.latitude, position.longitude);

      emit(AddGeofenceState.locationUpdated(
        _currentPosition!,
      ));
      return _currentPosition;
    } catch (e) {
      emit(AddGeofenceState.error('Error fetching location: $e'));
      return null;
    }
  }

  Future<void> addGeofence({
    required BuildContext context,
    required String name,
    required String description,
    required double radius,
    required LatLng position,
    required Map<String, dynamic> attributes,
  }) async {
    try {
      showLoadingDialog(context, 'Adding Geofence', false);
      final GeofenceModel geofence = GeofenceModel(
        name: name,
        description: description,
        calendarId: 0,
        area: 'CIRCLE (${position.latitude} ${position.longitude}, ${radius.toStringAsFixed(1)})',
        attributes: attributes,
      );
      log('this log add geofence $geofence');
      await geofenceRepo.addGeofence(geofence);
      dismissLoadingDialog(context);
      emit(const AddGeofenceState.success('Successfully Added'));
    } catch (e) {
      dismissLoadingDialog(context);

      AppToast.showError(message: 'Error on adding geofence. Please try again!', context: context);
      emit(_ErrorState(e.toString()));
    } finally {
      dismissLoadingDialog(context);
    }
  }
}
