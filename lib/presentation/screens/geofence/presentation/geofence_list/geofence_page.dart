import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/add_geofence/add_geofence_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/view_geofence/geofence_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/widgets/current_location_button.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/geofence_list/geofence_bottom_sheet.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/map_style_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeofencePage extends StatefulWidget {
  const GeofencePage({super.key, required this.vehicleId});
  final String vehicleId;

  @override
  State<GeofencePage> createState() => _GeofencePageState();
}

class _GeofencePageState extends State<GeofencePage> {
  final webSocketCubit = locator.get<WebsocketCubit>();
  final DraggableScrollableController _draggableController = DraggableScrollableController();
  final Completer<GoogleMapController> mController = Completer<GoogleMapController>();

  String? _mapStyle;
  bool trafficEnabled = false;

  double? radius;
  LatLng? _circleCenter;

  @override
  void initState() {
    super.initState();
    webSocketCubit.disconnect();
    context.read<GeofenceCubit>().init(widget.vehicleId);
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final storedStyle = prefs.getString('map_style_json') ?? 'simple';

    // Only load custom JSON for "simple"
    final style = storedStyle == 'simple' ? await rootBundle.loadString(Assets.style) : null;
    _mapStyle = style;

    if (mounted) {
      context.read<LiveMapCubit>().changeMapTypeByName(storedStyle, style ?? '');
    }
  }

  @override
  void dispose() {
    webSocketCubit.reconnect();
    super.dispose();
  }

  void onGeofenceSelected(GeofenceModel model) {
    final area = (model.area ?? '').replaceAll('CIRCLE (', '').replaceAll(',', '').replaceAll(')', '');

    final parts = area.split(' ');
    if (parts.length < 3) return;

    final position = LatLng(double.parse(parts[0]), double.parse(parts[1]));
    final rad = double.parse(parts[2]);

    radius = rad;
    _circleCenter = position;

    _animateCamera(position, _calculateZoom(rad));
    setState(() {});
  }

  double _calculateZoom(double radius) {
    if (radius <= 0) return 16;
    final scale = (radius + radius / 2) / 500;
    return (16 - log(scale) / log(2)).clamp(0, 20).toDouble();
  }

  Future<void> _animateCamera(LatLng target, double zoom) async {
    final controller = await mController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: target, zoom: zoom)));
  }

  Future<void> _getCurrentLocation() async {
    final data = await context.read<AddGeofenceCubit>().getCurrentLocation();
    if (data != null) _animateCamera(data, 16);
  }

  String mapTypeNameFromType(MapType type, String mapStyle) {
    if (mapStyle.isEmpty) return 'classic';
    switch (type) {
      case MapType.normal:
        return 'simple';
      case MapType.hybrid:
        return 'satellite';
      case MapType.terrain:
        return 'terrain';
      default:
        return 'simple';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: .1,
        title: Text(
          'Geofence',
          style: context.textTheme.headlineSmall?.copyWith(
            color: const Color(0xFF181818),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocBuilder<LiveMapCubit, LiveMapState>(
        builder: (context, liveState) {
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  style: liveState.mapStyle,
                  mapType: liveState.mapType,
                  trafficEnabled: trafficEnabled,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(27.700769, 85.300140),
                    zoom: 6,
                  ),
                  markers: const {},
                  circles: (radius != null && _circleCenter != null)
                      ? {
                          Circle(
                            circleId: const CircleId('geofenceRadius'),
                            center: _circleCenter!,
                            radius: radius!,
                            fillColor: const Color.fromRGBO(1, 131, 250, 0.19),
                            strokeColor: const Color.fromRGBO(0, 145, 255, 1),
                            strokeWidth: 2,
                          ),
                        }
                      : {},
                  onMapCreated: (controller) {
                    if (!mController.isCompleted) mController.complete(controller);
                  },
                ),
              ),
              CurrentLocationButton(
                onPressed: _getCurrentLocation,
                bottomPosition: MediaQuery.of(context).size.height * .08,
                endPosition: 0,
              ),
              ToggleMapButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return MapStyleSheet(
                        initialMapStyle: mapTypeNameFromType(liveState.mapType, liveState.mapStyle ?? ''),
                        onApply: (finalMapStyle) async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('map_style_json', finalMapStyle);

                          _mapStyle = finalMapStyle;
                          if (mounted) {
                            context.read<LiveMapCubit>().changeMapTypeByName(
                                  finalMapStyle,
                                  await rootBundle.loadString(Assets.style),
                                );
                          }
                        },
                      );
                    },
                  );
                },
                bottomPosition: MediaQuery.of(context).size.height * .08,
                startPosition: 0,
              ),
            ],
          );
        },
      ),
      bottomSheet: GeofenceBottomSheet(
        vehicleId: widget.vehicleId,
        controller: _draggableController,
        onSelectGeofence: onGeofenceSelected,
      ),
    );
  }
}
