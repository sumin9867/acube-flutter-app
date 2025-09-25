import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/utils/helpers/marker_helper.dart';
import 'package:gpspro/domain/enums/date_range_enum.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/util/debounce.dart';
import 'package:injectable/injectable.dart';
import 'package:pausable_timer/pausable_timer.dart';

part 'vehicle_playback_cubit.freezed.dart';
part 'vehicle_playback_state.dart';

@injectable
class VehiclePlaybackCubit extends Cubit<VehiclePlaybackState> {
  VehiclePlaybackCubit(
    this.deviceRepo,
    this.myDevicesCubit,
  ) : super(const _InitialState());

  final DeviceRepo deviceRepo;
  final MyDevicesCubit myDevicesCubit;
  late GoogleMapController googleMapController;
  Completer<GoogleMapController> _controller = Completer();

  late List<PositionModel> positionList;
  late final String vehicleId;
  PausableTimer? _playbackTimer;
  Map<DataRange, List<PositionModel>> cachePlaybackData = {};
  Marker? currentLocationMarker;
  DateTime selectedDate = DateTime.now();

  void initialize(
    String vehicleId,
  ) async {
    log('1');
    try {
      this.vehicleId = vehicleId;

      final range = await DataRange.today.getDateTimeRange();
      _fetchPolyline(
        dateRange: range!,
      );
    } catch (e, stackTrace) {
      log('Error initializing VehiclePlaybackCubit: $e', stackTrace: stackTrace);
      emit(VehiclePlaybackState.error('Error: $e'));
    }
  }

  Future<int> getmapId() {
    return _controller.future.then<int>(
      (value) {
        return value.mapId;
      },
    );
  }

  @override
  Future<void> close() {
    _playbackTimer?.cancel();
    return super.close();
  }

  void onMapCreated(GoogleMapController controller) {
    log('2');

    if (!_controller.isCompleted) {
      _controller.complete(controller);
      _startPlayback();
    }
    googleMapController = controller;
  }

  Future<void> _startPlayback() async {
    log('3');

    if (state is _IdleState && positionList.isNotEmpty) {
      LatLngBounds bounds;
      final List<LatLng> latLngList =
          positionList.map((position) => LatLng(position.latitude, position.longitude)).toList();

      if (latLngList.length == 1) {
        bounds = LatLngBounds(
          southwest: latLngList.first,
          northeast: latLngList.first,
        );
      } else {
        double minLat = latLngList.first.latitude;
        double maxLat = latLngList.first.latitude;
        double minLng = latLngList.first.longitude;
        double maxLng = latLngList.first.longitude;

        for (var position in latLngList) {
          minLat = position.latitude < minLat ? position.latitude : minLat;
          maxLat = position.latitude > maxLat ? position.latitude : maxLat;
          minLng = position.longitude < minLng ? position.longitude : minLng;
          maxLng = position.longitude > maxLng ? position.longitude : maxLng;
        }

        bounds = LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        );
      }

      final controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));

      initializePlaybackTimer();
    }
  }

  Future<void> animateCameraTo(LatLng target, {bool animate = true}) async {
    if (state is _IdleState) {
      final controller = await _controller.future;

      final cameraPosition = CameraPosition(
        target: target,
        zoom: 16,
      );

      if (animate) {
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(cameraPosition),
        );
      } else {
        await controller.moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
      }
    }
  }

  void togglePlayback() {
    if (state is _IdleState) {
      final isPlaying = (state as _IdleState).viewModel.isPlaying;
      if (isPlaying) {
        _playbackTimer?.pause();
      } else {
        _playbackTimer?.start();
      }
      emit(
        _IdleState(
          (state as _IdleState).viewModel.copyWith(
                isPlaying: !isPlaying,
              ),
        ),
      );
    }
  }

  void stopPlayback() {
    if (state is _IdleState) {
      _playbackTimer?.pause(); // Ensure it's fully stopped

      emit(
        _IdleState(
          (state as _IdleState).viewModel.copyWith(
                isPlaying: false, // explicitly set playing to false
              ),
        ),
      );
    }
  }

  final Throttle throttle = Throttle();

  // Future<void> onStopover(LatLng latLng) async {
  //   await throttle.call(() async {
  //     await state.whenOrNull(idle: (model) async {
  //       await animateCameraTo(model.currentLocationMarker.position,
  //           animate: true);
  //     });
  //   });
  // }

  final Debounce _debounce = Debounce();

  void seekTo(int index) {
    if (index >= positionList.length) return;
    if (state is _IdleState) {
      final target = LatLng(
        positionList[index].latitude,
        positionList[index].longitude,
      );

      animateCameraTo(target, animate: true);
      emit(
        _IdleState(
          (state as _IdleState).viewModel.copyWith(
                currentPlaybackIndex: index,
                vehicle: (state as _IdleState).viewModel.vehicle.copyWith(
                      position: positionList[index],
                    ),
              ),
        ),
      );
      _debounce.call(() {
        emit(
          _IdleState(
            (state as _IdleState).viewModel.copyWith(
                  currentLocationMarker: (state as _IdleState).viewModel.currentLocationMarker.copyWith(
                        positionParam: target,
                        rotationParam: positionList[index].course,
                      ),
                ),
          ),
        );
        if (_playbackTimer?.isActive == false) {
          initializePlaybackTimer();
          _playbackTimer?.start();
        }
        animateCameraTo(target, animate: true);
      });
    }
  }

  Future<void> _fetchPolyline({required DateTimeRange dateRange}) async {
    log('5');
    try {
      final int id = int.parse(vehicleId);
      final Device vehicle = myDevicesCubit.devices.firstWhere(
        (element) => element.id == id,
      );
      final DataRange dataRange = (state is _EmptyState)
          ? (state as _EmptyState).viewModel.dataRange
          : (state is _IdleState)
              ? (state as _IdleState).viewModel.dataRange
              : DataRange.today;
      if (state is _IdleState || state is _EmptyState) {
        emit(const _LoadingState());
      }

      final cache = cachePlaybackData[dataRange];
      if (cache != null) {
        positionList = cache;
      } else {
        positionList = await deviceRepo.getPositions(
          vehicleId,
          dateRange,
        );
        if (![DataRange.today, DataRange.custom].contains(dataRange)) {
          cachePlaybackData[dataRange] = positionList;
        }
      }
      if (positionList.isEmpty) {
        emit(_EmptyState(
          VehiclePlaybackEmptyViewModel(
            vehicle: vehicle,
            dataRange: dataRange,
            selectedDate: selectedDate,
          ),
        ));
        return;
      }

      final List<LatLng> polylineCoordinates = positionList
          .map(
            (e) => LatLng(
              e.latitude,
              e.longitude,
            ),
          )
          .toList();

      final BitmapDescriptor startIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(36, 36)),
        'assets/images/green_point.png',
      );

      final BitmapDescriptor endIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(36, 36)),
        'assets/images/circle_stop.png',
      );

      currentLocationMarker ??= await MarkerHelper.getMapMarker(
        playback: true,
        vehicle.copyWith(status: DeviceStatus.unknown),
      );
      currentLocationMarker = currentLocationMarker?.copyWith(
        positionParam: polylineCoordinates.first,
      );

      emit(
        _IdleState(
          VehiclePlaybackViewModel(
            vehicle: vehicle,
            startMarker: Marker(
              markerId: const MarkerId('start'),
              position: polylineCoordinates.first,
              icon: startIcon,
              anchor: const Offset(0.5, 0.5), // optional: move visual placement
            ),
            endMarker: Marker(
              markerId: const MarkerId('end'),
              position: polylineCoordinates.last,
              icon: endIcon,
              anchor: const Offset(0.5, 0.5),
            ),
            currentLocationMarker: currentLocationMarker!.copyWith(
              zIndexParam: 1.0, // ← this puts it above others
            ),
            polylineCoordinates: polylineCoordinates,
            playbackSize: positionList.length,
            currentPlaybackIndex: 0,
            isPlaying: false,
            playbackSpeed: 550,
            dataRange: dataRange,
            selectedDate: selectedDate,
            rssi: 2,
          ),
        ),
      );
    } catch (e) {
      emit(_ErrorState('Error $e'));
    }
  }

  void setPlaybackSpeed(int speed) {
    if (state is _IdleState) {
      _playbackTimer?.cancel();
      emit(
        _IdleState(
          (state as _IdleState).viewModel.copyWith(
                playbackSpeed: speed,
              ),
        ),
      );
      initializePlaybackTimer();
      _playbackTimer?.start();
    }
  }

  Future<void> filterDataByDate(DateTime selectedDate) async {
    log('Filtering data for date: $selectedDate');

    final DateTimeRange dateTimeRange = DateTimeRange(
      start: DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
      end: DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 23, 59, 59),
    );
    log('Filtering data for date: $dateTimeRange');

    log('Current state: $state');

    this.selectedDate = selectedDate;

    await state.whenOrNull(
      empty: (viewModel) async {
        log('Emitting empty state with new date range');
        emit(_EmptyState(viewModel.copyWith(
          dataRange: DataRange.custom,
        )));
        await _fetchPolyline(dateRange: dateTimeRange);
        _controller = Completer();
      },
      idle: (viewModel) async {
        log('Emitting idle state with new date range');
        emit(_IdleState(
            viewModel.copyWith(dataRange: DataRange.custom, currentPlaybackIndex: 0, selectedDate: selectedDate)));

        await _fetchPolyline(dateRange: dateTimeRange);
        log('Emitting idle state with new date rangedasda');

        _controller = Completer();
        log('Emitting idle state with new date rangedasda');
      },
      initial: () async {
        log('Emitting initial state with new date range');
      },
    );
  }

  void initializePlaybackTimer() {
    _playbackTimer?.cancel();

    _playbackTimer = PausableTimer.periodic(
      Duration(milliseconds: (state is _IdleState ? (state as _IdleState).viewModel.playbackSpeed : 1000)),
      () async {
        if (state is _IdleState) {
          VehiclePlaybackViewModel viewModel = (state as _IdleState).viewModel;

          int nextIndex = viewModel.currentPlaybackIndex + 1;

          while (nextIndex < positionList.length) {
            final currentPosition = positionList[viewModel.currentPlaybackIndex];
            final nextPosition = positionList[nextIndex];

            if (nextPosition.speed > 0 ||
                nextPosition.latitude != currentPosition.latitude ||
                nextPosition.longitude != currentPosition.longitude) {
              break;
            }

            nextIndex++;
          }

          if (nextIndex >= positionList.length) {
            _playbackTimer?.cancel();
            return;
          }

          viewModel = viewModel.copyWith(currentPlaybackIndex: nextIndex);

          final position = positionList[nextIndex];
          final target = LatLng(position.latitude, position.longitude);

          throttle.call(() async {
            await animateCameraTo(target);
          });

          emit(
            _IdleState(
              viewModel.copyWith(
                isPlaying: true,
                currentPlaybackIndex: nextIndex,
                currentLocationMarker: viewModel.currentLocationMarker.copyWith(
                  rotationParam: position.course,
                  positionParam: target,
                ),
                vehicle: viewModel.vehicle.copyWith(
                  position: position,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void rewindPlayback(int index) {
    _playbackTimer?.cancel();
    final viewModel = (state as _IdleState).viewModel.copyWith(
          currentPlaybackIndex: index,
        );

    emit(
      _IdleState(
        viewModel.copyWith(
          isPlaying: false,
          currentLocationMarker: viewModel.currentLocationMarker.copyWith(
            positionParam: LatLng(positionList[index].latitude, positionList[index].longitude),
          ),
          vehicle: viewModel.vehicle.copyWith(
            position: positionList[index],
          ),
        ),
      ),
    );

    initializePlaybackTimer();
  }
}
