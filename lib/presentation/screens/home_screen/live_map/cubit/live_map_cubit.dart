// ignore_for_file: unused_element, deprecated_member_use

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_animarker/helpers/google_map_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/app_permission.dart';
import 'package:gpspro/core/utils/helpers/marker_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/router/router.dart';
import 'package:injectable/injectable.dart';

part 'live_map_cubit.freezed.dart';
part 'live_map_state.dart';

@lazySingleton
class LiveMapCubit extends Cubit<LiveMapState> {
  LiveMapCubit(this.myDevicesCubit) : super(const LiveMapState(markers: [])) {
    _initialize();
  }

  final MyDevicesCubit myDevicesCubit;
  Position? currentPosition;
  late GoogleMapController mapController;

  bool _emitMarkers = true;
  final clusterManagerId = ClusterManagerId(UniqueKey().toString());

  StreamSubscription? _myDevicesSubscription;

  Future<void> _initialize() async {
    _setState();
    await _getCurrentPosition();
  }

  Future<void> updateMarker(int deviceId, PositionModel position) async {
    if (!_emitMarkers) return;

    final device = myDevicesCubit.devices.firstWhere(
      (item) => item.id == deviceId,
    );

    if (device.position == null) return;

    final today = DateTime.now();
    if (device.expirationTime != null && device.expirationTime!.isBefore(today)) {
      // Device is expired, remove its marker if present
      final filteredMarkers = state.markers.where((m) => m.deviceId != deviceId).toList();
      emit(state.copyWith(markers: filteredMarkers));
      return;
    }

    final marker = await _getMarkerFromDevice(device);
    final markers = state.markers.map((m) {
      return m.deviceId == deviceId ? MarkerModel(deviceId: deviceId, marker: marker) : m;
    }).toList();

    if (!markers.any((m) => m.deviceId == deviceId)) {
      markers.add(MarkerModel(deviceId: deviceId, marker: marker));
    }

    if (isClosed) return;
    emit(state.copyWith(markers: markers));
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    // resetBoundaries();
  }

  Future<void> moveToCurrentLocation() async {
    if (currentPosition == null) return;
    _animateCameraTo(
      target: LatLng(
        currentPosition!.latitude,
        currentPosition!.longitude,
      ),
    );
  }

  void changeMapTypeByName(String mapTypeName, String? mapStyle) async {
    MapType selectedType;
    String selectedStyle = ''; // Initialize with a default value

    switch (mapTypeName.toLowerCase()) {
      case 'simple':
        selectedType = MapType.normal; // Use custom JSON for style
        selectedStyle = mapStyle ?? '';
        break;
      case 'classic':
        selectedType = MapType.normal;
        selectedStyle = '';
        break;
      case 'satellite':
        selectedType = MapType.hybrid;
        selectedStyle = mapStyle ?? '';
        break;
      case 'terrain':
        selectedType = MapType.terrain;
        selectedStyle = mapStyle ?? '';
        break;
      default:
        selectedType = MapType.normal;
        selectedStyle = mapStyle ?? '';
        break;
    }
    if (isClosed) return;
    emit(state.copyWith(
      mapType: selectedType,

      mapStyle: selectedStyle, // store the JSON string if needed
    ));
  }

  void toggleTraffic() {
    emit(state.copyWith(trafficEnabled: !state.trafficEnabled));
  }

  Future<void> _getCurrentPosition() async {
    try {
      await AppPermissions.checkLocationPermission();
      currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      log('Error in Current Position: $e');
    }
  }

  void _listenToMyDevicesCubit() {
    _myDevicesSubscription = myDevicesCubit.stream.listen((_) => _setState());
  }

  void _setState() {
    myDevicesCubit.state.maybeWhen(
      idle: (devices) async {
        if (!_emitMarkers) return;
        emit(state.copyWith(markers: await _getMarkers(devices)));
      },
      orElse: () {},
    );
  }

  void resetBoundaries({LatLngBounds? bound}) {
    bound ??= GoogleMapHelper.boundsFromLatLngList(state.markers.map((e) => e.marker.position).toList());
    final CameraUpdate update = CameraUpdate.newLatLngBounds(bound, 50);
    _safeAnimateCamera(update);
  }

  void _animateCameraTo({required LatLng target}) {
    if (target.latitude < -85 || target.latitude > 85) return;

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: target, zoom: 13)),
    );
  }

  void _safeAnimateCamera(CameraUpdate update) async {
    await mapController.animateCamera(update);
    if ((await mapController.getVisibleRegion()).southwest.latitude == 90) {
      _safeAnimateCamera(update);
    }
  }

  Future<List<MarkerModel>> _getMarkers(List<DeviceCubit> devices) async {
    final List<MarkerModel> markers = [];

    final today = DateTime.now();

    await Future.wait(devices.map((deviceCubit) async {
      final device = deviceCubit.state;

      // Only include devices that are NOT expired
      if (device.position != null && (device.expirationTime == null || device.expirationTime!.isAfter(today))) {
        markers.add(MarkerModel(
          deviceId: device.id,
          marker: await _getMarkerFromDevice(device),
        ));
      }
    }));

    return markers;
  }

  Future<Marker> _getMarkerFromDevice(Device device) async {
    return MarkerHelper.getMapMarker(
      device,
      addName: true,
      clusterManagerId: Platform.isAndroid ? clusterManagerId : null,
      onTap: () => _onMarkerTap(device),
    );
  }

  Future<void> _onMarkerTap(Device device) async {
    _emitMarkers = false;
    final result = await RouteHelper.pushDeviceDetailsPage(VehicleDetailsRouteParams(device: device));

    if (result is Marker) {
      final updatedMarker = MarkerModel(
        deviceId: device.id,
        marker: await _getMarkerFromDevice(device.copyWith(
          position: device.position?.copyWith(
            latitude: result.position.latitude,
            longitude: result.position.longitude,
          ),
        )),
      );

      emit(state.copyWith(markers: [for (final m in state.markers) m.deviceId == device.id ? updatedMarker : m]));
    }

    _emitMarkers = true;
  }

  void clearMarkers() {
    if (isClosed) return;
    emit(state.copyWith(markers: []));
  }

  void restartConnection() {
    _initialize();
  }

  Future<void> clearState() async {
    clearMarkers();

    _myDevicesSubscription?.cancel();
    _myDevicesSubscription = null;

    currentPosition = null;
    _emitMarkers = true;
  }

  @override
  Future<void> close() {
    _myDevicesSubscription?.cancel();
    return super.close();
  }
}
