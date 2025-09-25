import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/PositionModel.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/repository/i_event_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/events/widgets/event_bottom_sheet.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class EventsMap extends StatefulWidget {
  final VehicleEvent vehicleEvent;
  const EventsMap({super.key, required this.vehicleEvent});

  @override
  State<EventsMap> createState() => _EventsMapState();
}

class _EventsMapState extends State<EventsMap> {
  final mController = Completer<GoogleMapController>();
  late Future<List<PositionModel>> coordinatesList;
  late Future<BitmapDescriptor> customMarker;
  late MapType mapType;
  late String mapStyle;

  late bool trafficEnabled;
  String? _mapStyle;
  Device? currentDevice;

  @override
  void initState() {
    super.initState();
    mapType = locator.get<LiveMapCubit>().state.mapType;
    mapStyle = locator.get<LiveMapCubit>().state.mapStyle ?? '';

    trafficEnabled = locator.get<LiveMapCubit>().state.trafficEnabled;
    rootBundle.loadString(Assets.style).then((s) => _mapStyle = s);
    customMarker = _createCustomMarker(widget.vehicleEvent.type);
    coordinatesList = _fetchCoordinates();
    _fetchDevice();
  }

  Future<List<PositionModel>> _fetchCoordinates() {
    return locator
        .get<EventRepo>()
        .getPositionById(widget.vehicleEvent.positionId.toString(), widget.vehicleEvent.deviceId.toString());
  }

  Future<void> _fetchDevice() async {
    try {
      final devices = locator.get<MyDevicesCubit>().devices;
      currentDevice = devices.firstWhere(
        (d) => d.id == widget.vehicleEvent.deviceId,
      );
      setState(() {});
    } catch (e) {
      log('Device fetch error: $e');
    }
  }

  @override
  void dispose() {
    mController.future.then((c) => c.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        _buildHeader(context, screenHeight, screenWidth),
        Expanded(child: _buildMap()),
        FutureBuilder<List<PositionModel>>(
          future: coordinatesList,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) return const SizedBox.shrink();

            final position = snapshot.data!.first;
            final displayAddress = position.address ?? 'No address available';

            return currentDevice != null
                ? EventBottomSheet(
                    model: currentDevice!,
                    vehicleEvent: widget.vehicleEvent,
                    address: displayAddress,
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, double screenHeight, double screenWidth) {
    final event = widget.vehicleEvent;

    final String mainMessage = getEventMessage(event);
    String? subMessage;

    // For commandResult, show the actual result as subtitle
    if (event.type == 'commandResult' && event.attributes?['result'] != null) {
      subMessage = event.attributes!['result'].toString();
    }

    return Padding(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainMessage,
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Render subtitle only if it exists
                if (subMessage != null) ...[
                  SizedBox(height: screenHeight * 0.005), // small spacing
                  Text(
                    subMessage,
                    style: TextStyle(
                      fontSize: screenHeight * 0.013,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01), // small spacing
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Iconsax.close_circle, size: screenHeight * 0.03),
          ),
        ],
      ),
    );
  }

  String getEventMessage(VehicleEvent event) {
    if (event.type == 'deviceOverspeed') {
      final speedStr = event.attributes?['speed']?.toString();
      final speedKmh = (speedStr != null && double.tryParse(speedStr) != null)
          ? (double.parse(speedStr) * 1.852).round()
          : 'Unknown';
      return 'Over Speeding at $speedKmh km/h';
    } else if (event.type == 'alarm') {
      return _buildEventText(event.type, event.attributes);
    } else {
      return _getReadableType(event.type);
    }
  }

  String _buildEventText(String type, Map<String, dynamic>? attributes) {
    if (type.toLowerCase() == 'alarm') {
      final alarmValue = attributes?['alarm']?.toString().toLowerCase();

      const Map<String, String> alarmTitles = {
        'sos': 'Emergency SOS Triggered',
        'overspeed': 'Overspeed Detected',
        'vibration': 'Unusual Vibration Detected',
        'powercut': 'Power Cut Alert',
        'lowbattery': 'Low Battery Warning',
        'movement': 'Movement Detected',
        'accident': 'Possible Accident Detected',
        'hardacceleration': 'Hard Acceleration Detected',
        'hardbraking': 'Hard Braking Detected',
        'hardcornering': 'Hard Cornering Detected',
        'tampering': 'Tampering Detected',
        'lowpower': 'Low Power Warning',
      };

      return alarmTitles[alarmValue] ?? 'Alarm - ${alarmValue ?? 'Unknown'}';
    }
    return '';
  }

  String _getReadableType(String type) {
    const types = {
      'commandResult': 'Command Result',
      'deviceInactive': 'Device Inactive',
      'queuedCommandSent': 'Queued Command Sent',
      'deviceMoving': 'Device Moving',
      'deviceStopped': 'Device Stopped',
      'deviceOverspeed': 'Device Overspeed',
      'deviceFuelDrop': 'Device Fuel Drop',
      'deviceFuelIncrease': 'Device Fuel Increase',
      'geofenceEnter': 'Geofence Enter',
      'geofenceExit': 'Geofence Exit',
      'ignitionOn': 'Ignition On',
      'alarm': 'Alarm',
      'ignitionOff': 'Ignition Off',
      'maintenance': 'Maintenance',
      'textMessage': 'Text Message',
      'driverChanged': 'Driver Changed',
      'media': 'Media',
    };

    return types[type] ?? type;
  }

  Widget _buildMap() {
    return FutureBuilder<List<PositionModel>>(
      future: coordinatesList,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) return const Center(child: CircularProgressIndicator());

        final position = snapshot.data!.first;
        return FutureBuilder<BitmapDescriptor>(
          future: customMarker,
          builder: (context, markerSnap) {
            if (!markerSnap.hasData) return const Center(child: CircularProgressIndicator());

            return GoogleMap(
              mapType: mapType,
              style: mapStyle,
              trafficEnabled: trafficEnabled,
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 16,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('event'),
                  position: LatLng(position.latitude, position.longitude),
                  icon: markerSnap.data!,
                )
              },
              onMapCreated: (controller) => mController.complete(controller),
              mapToolbarEnabled: false,
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
            );
          },
        );
      },
    );
  }

  Future<BitmapDescriptor> _createCustomMarker(String type) async {
    final icons = {
      'ignitionOn': Assets.icons.events.ignitionPng.path,
      'ignitionOff': Assets.icons.events.ignitionPng.path,
      'geofenceEnter': Assets.icons.events.geofencePng.path,
      'geofenceExit': Assets.icons.events.geofencePng.path,
      'deviceOverspeed': Assets.icons.events.overspeedPng.path,
      'deviceOffline': Assets.icons.events.deviceOfflinePng.path,
      'stopped': Assets.icons.events.stopPng.path,
      'commandResult': Assets.icons.events.commandPng.path,
      'alarm': Assets.icons.events.deviceAlarmPng.path,
      'vibration': Assets.icons.events.vibrationPng.path,
      'moving': Assets.icons.events.movingPng.path,
      'accident': Assets.icons.events.accidentPng.path,
      'hardAcceleration': Assets.icons.events.deviceAlarmPng.path,
      'hardBraking': Assets.icons.events.deviceAlarmPng.path,
      'hardCornering': Assets.icons.events.deviceAlarmPng.path,
      'powercut': Assets.icons.events.deviceAlarmPng.path,
      'tampering': Assets.icons.events.deviceAlarmPng.path,
      'lowPower': Assets.icons.events.deviceAlarmPng.path,
    };

    final assetPath = icons[type] ?? Assets.images.greenPoint.path;
    final bytes = (await rootBundle.load(assetPath)).buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    const radius = 50.0;
    canvas.drawCircle(const Offset(radius, radius), radius - 1, Paint()..color = Colors.red);

    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      const Rect.fromLTWH(20, 20, 60, 60),
      Paint()..colorFilter = const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );

    final result = await recorder.endRecording().toImage(100, 100);
    final byteData = await result.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}
