import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/domain/models/PermissionModel.dart';
import 'package:gpspro/gen/l10n/l10n.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';
import 'package:gpspro/presentation/screens/geofence/infrastructure/i_geofence_repo.dart';
import 'package:injectable/injectable.dart';

part 'geofence_cubit.freezed.dart';
part 'geofence_state.dart';

@injectable
class GeofenceCubit extends Cubit<GeofenceState> {
  GeofenceCubit(this.geofenceRepo) : super(const _InitialState());

  final GeofenceRepo geofenceRepo;
  late String vehicleId;

  Future<void> init(String vehicleId) async {
    try {
      this.vehicleId = vehicleId;
      emit(const _LoadingState(''));
      final result = await fetchGeofence();
      emit(_IdleState(result));
    } catch (e) {
      emit(_ErrorState(S.current.somthingWentWrong));
    }
  }

  void resetState() {
    emit(const GeofenceState.initial());
  }

  Future<void> toggleFenceSelection(GeofenceModel model, BuildContext context) async {
    await state.whenOrNull(
      idle: (geofenceList) async {
        try {
          // Show loading based on current selection
          final loadingMessage = model.isSelected ? 'Unlinking Geofence' : 'Linking Geofence';
          showLoadingDialog(context, loadingMessage, false);

          if (model.isSelected) {
            await _removeGeofence(model, context);
          } else {
            await addGeofence(model, context);
          }

          final updatedList = geofenceList
              .map(
                (fence) => (fence.id != model.id) ? fence : fence.copyWith(isSelected: !fence.isSelected),
              )
              .toList();

          dismissLoadingDialog(context);
          emit(_IdleState(updatedList));
        } catch (e) {
          dismissLoadingDialog(context);
          emit(_ErrorState(e.toString()));
        }
      },
    );
  }

  Future<void> deleteGeofence(GeofenceModel model, BuildContext context) async {
    try {
      showLoadingDialog(context, 'Deleting Geofence', false);

      await geofenceRepo.deleteGeofence(model.id!);
      state.whenOrNull(
        idle: (geofenceList) {
          final updatedList = geofenceList
              .where(
                (fence) => fence.id != model.id,
              )
              .toList();
          emit(_IdleState(updatedList));
        },
      );
      dismissLoadingDialog(context);

      AppToast.showSuccess(
        message: 'Geofence Deleted',
        context: context,
      );
    } catch (e) {
      dismissLoadingDialog(context);

      AppToast.showError(
        message: S.current.errorOnDeletingGeofence,
        context: context,
      );
    }
  }

  Future<void> refreshGeofence() async {
    final result = await fetchGeofence();
    emit(_IdleState(result));
  }

  Future<List<GeofenceModel>> fetchGeofence() async {
    log('this is vehicle from late $vehicleId');

    final futures = [
      geofenceRepo.getGeoFencesByUserID(),
      geofenceRepo.getGeoFencesByDeviceID(vehicleId),
    ];
    final results = await Future.wait(futures);
    final geoFenceList = results[0];
    final selectedGeofenceIds = (results[1]).map((fence) => fence.id).toList();

    return geoFenceList
        .map((fence) => fence.copyWith(
              isSelected: selectedGeofenceIds.contains(fence.id),
            ))
        .toList();
  }

  Future<void> addGeofence(GeofenceModel geofence, BuildContext context) async {
    try {
      final GeofencePermModel permissionModel = GeofencePermModel();
      permissionModel.deviceId = vehicleId;
      permissionModel.geofenceId = geofence.id;
      await geofenceRepo.addPermission(permissionModel);

      final updatedList = await fetchGeofence();

      final newList = updatedList.map((fence) {
        if (fence.id == geofence.id) {
          return fence.copyWith(isSelected: true);
        }
        return fence;
      }).toList();

      emit(_IdleState(newList));

      AppToast.showSuccess(
        message: S.current.fenceAddedSuccessfully,
        context: context,
      );
    } catch (e) {
      AppToast.showError(
        message: S.current.errorOnAddingGeofence,
        context: context,
      );
      rethrow;
    }
  }

  Future<void> editGeofence(GeofenceModel model, BuildContext context) async {
    final result = await geofenceRepo.editGeofence(model);

    result.fold(
      (errorMessage) {
        if (context.mounted) {
          AppToast.showError(message: errorMessage, context: context);
        }
      },
      (successMessage) {
        state.whenOrNull(
          idle: (geofenceList) {
            final updatedList = geofenceList.map((fence) {
              return fence.id == model.id ? model : fence;
            }).toList();
            emit(_IdleState(updatedList));
          },
        );
      },
    );
  }

  Future<void> _removeGeofence(GeofenceModel geofence, BuildContext context) async {
    try {
      final GeofencePermModel permissionModel = GeofencePermModel();
      permissionModel.deviceId = vehicleId;
      permissionModel.geofenceId = geofence.id;
      await geofenceRepo.deletePermission(permissionModel);
      refreshGeofence();
      AppToast.showSuccess(
        message: S.current.fenceRemovedSuccessfully,
        context: context,
      );
    } catch (e) {
      AppToast.showError(
        message: S.current.errorOnRemovingGeofence,
        context: context,
      );
      rethrow;
    }
  }
}
