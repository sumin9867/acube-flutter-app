import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animarker/helpers/google_map_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/pages/vehicle_map/vehicle_map_trip_bottom_sheet.dart';
import 'package:gpspro/theme/app_colors.dart';

class VehicleMapTripPage extends StatefulWidget {
  final VehicleTrip trips;
  const VehicleMapTripPage({super.key, required this.trips});

  @override
  State<VehicleMapTripPage> createState() => _VehicleMapTripPageState();
}

class _VehicleMapTripPageState extends State<VehicleMapTripPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late DeviceCubit _deviceCubit;
  String? _mapStyle;
  late MapType _mapType;
  late bool _trafficEnabled;
  late Future<BitmapDescriptor> _customMarkerStart;
  late Future<BitmapDescriptor> _customMarkerEnd;
  late Future<List<LatLng>> _polylineFuture;
  Device? currentDevice;

  @override
  void initState() {
    super.initState();
    _mapType = locator.get<LiveMapCubit>().state.mapType;
    _mapStyle = locator.get<LiveMapCubit>().state.mapStyle ?? '';

    _trafficEnabled = locator.get<LiveMapCubit>().state.trafficEnabled;

    _customMarkerStart = _createCustomMarker('stop_circle');
    _customMarkerEnd = _createCustomMarker('reached_circle');

    _deviceCubit = locator.get<MyDevicesCubit>().deviceCubits.firstWhere(
          (c) => c.state.id == widget.trips.deviceId,
        );

    _polylineFuture = _fetchPolyline(
      widget.trips.deviceId,
      DateTimeRange(start: widget.trips.startTime, end: widget.trips.endTime),
    );

    _fetchDevice();

    // rootBundle.loadString(Assets.style).then((s) => _mapStyle = s);
  }

  Future<void> _fetchDevice() async {
    try {
      final devices = locator.get<MyDevicesCubit>().devices;
      currentDevice = devices.firstWhere((d) => d.id == widget.trips.deviceId);
      setState(() {});
    } catch (e) {
      // ignore
    }
  }

  Future<BitmapDescriptor> _createCustomMarker(String type) async {
    final data =
        await rootBundle.load(type == 'stop_circle' ? Assets.images.circleStop.path : Assets.images.greenPoint.path);
    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  Future<List<LatLng>> _fetchPolyline(int deviceId, DateTimeRange range) async {
    try {
      final posList = await locator.get<DeviceRepo>().getPositions(deviceId.toString(), range);
      return posList.map((p) => LatLng(p.latitude, p.longitude)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider.value(
      value: _deviceCubit,
      child: BlocBuilder<DeviceCubit, Device>(
        builder: (context, device) {
          return Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.04,
                  screenHeight * 0.015,
                  screenWidth * 0.04,
                  screenHeight * 0.00,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Trip Details',
                        style: TextStyle(
                          fontSize: screenHeight * 0.018,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close, size: screenHeight * 0.02),
                    ),
                  ],
                ),
              ),

              // Map
              Expanded(
                child: FutureBuilder<BitmapDescriptor>(
                  future: _customMarkerStart,
                  builder: (context, startSnapshot) {
                    if (!startSnapshot.hasData) return const Center(child: CircularProgressIndicator());
                    final startIcon = startSnapshot.data!;
                    return FutureBuilder<BitmapDescriptor>(
                      future: _customMarkerEnd,
                      builder: (context, endSnapshot) {
                        if (!endSnapshot.hasData) return const Center(child: CircularProgressIndicator());
                        final endIcon = endSnapshot.data!;
                        return FutureBuilder<List<LatLng>>(
                          future: _polylineFuture,
                          builder: (context, polySnap) {
                            if (!polySnap.hasData) return const Center(child: CircularProgressIndicator());
                            final polyline = polySnap.data!;
                            return GoogleMap(
                              style: _mapStyle,
                              mapType: _mapType,
                              myLocationButtonEnabled: false,
                              myLocationEnabled: false,
                              zoomControlsEnabled: false,
                              trafficEnabled: _trafficEnabled,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(widget.trips.startLat, widget.trips.startLon),
                                zoom: 16,
                              ),
                              markers: {
                                Marker(
                                    markerId: const MarkerId('start'),
                                    position: LatLng(widget.trips.startLat, widget.trips.startLon),
                                    icon: startIcon,
                                    anchor: const Offset(0.5, 0.5)),
                                Marker(
                                    markerId: const MarkerId('end'),
                                    position: LatLng(widget.trips.endLat, widget.trips.endLon),
                                    icon: endIcon,
                                    anchor: const Offset(0.5, 0.5)),
                              },
                              polylines: {
                                Polyline(
                                  polylineId: const PolylineId('route'),
                                  points: polyline,
                                  color: AppColors.newPrimaryColor,
                                  width: 5,
                                ),
                              },
                              onMapCreated: (controller) {
                                _controller.complete(controller);
                                final bounds = GoogleMapHelper.boundsFromLatLngList([
                                  LatLng(widget.trips.startLat, widget.trips.startLon),
                                  LatLng(widget.trips.endLat, widget.trips.endLon),
                                  ...polyline,
                                ]);
                                controller.animateCamera(
                                  CameraUpdate.newLatLngBounds(bounds, 40),
                                );
                              },
                              mapToolbarEnabled: false,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              // Bottom sheet
              if (currentDevice != null)
                VehicleMapTripBottomSheet(
                  vehicle: currentDevice!,
                  trip: widget.trips,
                ),
            ],
          );
        },
      ),
    );
  }
}
