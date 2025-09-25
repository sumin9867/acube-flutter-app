import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/pages/vehicle_map/vehicle_map_stop_bottom_sheet.dart';

class VehicleMapStopPage extends StatefulWidget {
  const VehicleMapStopPage({super.key, required this.stops});

  final VehicleStop stops;

  @override
  State<VehicleMapStopPage> createState() => _VehicleMapStopPageState();
}

class _VehicleMapStopPageState extends State<VehicleMapStopPage> {
  final _mapController = Completer<GoogleMapController>();
  late DeviceCubit _deviceCubit;
  late Future<BitmapDescriptor> _customMarker;
  String? _mapStyle;
  late MapType _mapType;

  late bool _trafficEnabled;
  Device? currentDevice;

  @override
  void initState() {
    super.initState();
    _mapType = locator.get<LiveMapCubit>().state.mapType;
    _mapStyle = locator.get<LiveMapCubit>().state.mapStyle ?? '';

    _trafficEnabled = locator.get<LiveMapCubit>().state.trafficEnabled;
    _customMarker = _loadCustomMarker();
    _fetchDevice();

    // rootBundle.loadString(Assets.style).then((s) => _mapStyle = s);
  }

  Future<void> _fetchDevice() async {
    try {
      final devices = locator.get<MyDevicesCubit>().devices;
      currentDevice = devices.firstWhere((d) => d.id == widget.stops.deviceId);
      setState(() {});
    } catch (e) {
      log('Device fetch error: $e');
    }
  }

  Future<BitmapDescriptor> _loadCustomMarker() async {
    final data = await rootBundle.load(Assets.images.circleStop.path);
    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  @override
  void dispose() {
    _mapController.future.then((c) => c.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // Header/AppBar
        Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.04,
            screenHeight * 0.015,
            screenWidth * 0.04,
            screenHeight * 0.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Stop Details', // You can customize to show stop name
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
            future: _customMarker,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GoogleMap(
                  mapType: _mapType,
                  style: _mapStyle,
                  zoomControlsEnabled: false,
                  trafficEnabled: _trafficEnabled,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.stops.latitude, widget.stops.longitude),
                    zoom: 16,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('stop'),
                      position: LatLng(widget.stops.latitude, widget.stops.longitude),
                      icon: snapshot.data!,
                    )
                  },
                  onMapCreated: (controller) => _mapController.complete(controller),
                  mapToolbarEnabled: false,
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                ),
              );
            },
          ),
        ),

        // Bottom sheet
        currentDevice != null
            ? VehicleMapStopBottomSheet(
                vehicle: currentDevice!,
                stop: widget.stops,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
