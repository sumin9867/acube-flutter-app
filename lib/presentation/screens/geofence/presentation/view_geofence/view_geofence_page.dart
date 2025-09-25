// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';
import 'package:gpspro/theme/app_colors.dart';

class ViewGeofencePage extends StatefulWidget {
  const ViewGeofencePage({
    super.key,
    required this.geofenceModel,
  });

  final GeofenceModel geofenceModel;

  @override
  ViewGeofencePageState createState() => ViewGeofencePageState();
}

class ViewGeofencePageState extends State<ViewGeofencePage> {
  final Completer<GoogleMapController> mController = Completer<GoogleMapController>();
  final double formHeight = 80;
  String? _mapStyle;
  MapType mapType = MapType.normal;
  bool trafficEnabled = false;
  Marker? marker;
  late final double radius;

  @override
  void initState() {
    super.initState();
    extractData();
    rootBundle.loadString(Assets.style).then((string) {
      setState(() {
        _mapStyle = string;
      });
    });
  }

  LatLng _parsePosition(String area) {
    final areaParts = area.split(' ');
    return LatLng(double.parse(areaParts[0]), double.parse(areaParts[1]));
  }

  double _parseRadius(String area) {
    final areaParts = area.split(' ');
    return double.parse(areaParts[2]);
  }

  Future<void> extractData() async {
    final area = (widget.geofenceModel.area ?? '').replaceAll('CIRCLE (', '').replaceAll(',', '').replaceAll(')', '');

    final position = _parsePosition(area);
    final rad = _parseRadius(area);

    setState(() {
      marker = Marker(
        // anchor: const Offset(.5,.5 ),
        markerId: MarkerId(widget.geofenceModel.id.toString()),
        position: position,
      );
      radius = rad;
    });
  }

  void toggleMapType() {
    setState(() {
      mapType = mapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void toggleTraffic() {
    setState(() {
      trafficEnabled = !trafficEnabled;
    });
  }

  double getZoomLevel(double radius) {
    double zoomLevel = 16;
    if (radius > 0) {
      final double radiusElevated = radius + radius / 2;
      final double scale = radiusElevated / 500;
      zoomLevel = 16 - log(scale) / log(2);
    }
    zoomLevel = num.parse(zoomLevel.toStringAsFixed(2)).toDouble();
    return zoomLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              children: [
                Builder(
                  builder: (context) => GoogleMap(
                    zoomControlsEnabled: false,
                    style: _mapStyle,
                    mapType: mapType,
                    trafficEnabled: trafficEnabled,
                    initialCameraPosition: CameraPosition(
                      target: marker?.position ?? const LatLng(0.0, 0.0), // Set initial position
                      zoom: getZoomLevel(radius),
                    ),
                    // markers: marker != null ? {marker!} : {},
                    circles: {
                      Circle(
                        circleId: const CircleId('geofenceRadius'),
                        center: marker?.position ?? const LatLng(0.0, 0.0), // Set center same as marker
                        radius: radius,
                        fillColor: AppColors.primaryColor.withOpacity(0.2),
                        strokeColor: AppColors.primaryColor,
                        strokeWidth: 2,
                      )
                    },
                    onMapCreated: (controller) {
                      if (!mController.isCompleted) {
                        mController.complete(controller);
                      }
                    },
                  ),
                ),
                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: Container(
                    height: formHeight,
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            widget.geofenceModel.name!,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (widget.geofenceModel.description?.isNotEmpty == true) ...[
                            AppText(
                              widget.geofenceModel.description!,
                              style: context.textTheme.bodyMedium?.copyWith(),
                            ),
                          ],
                          const SizedBox(height: 12),
                          Column(
                            children: [
                              AppText(
                                'Radius',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              AppText(
                                '${radius.toStringAsFixed(0)} m',
                                style: context.textTheme.bodyMedium?.copyWith(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
