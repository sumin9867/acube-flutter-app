import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/presentation/app_shadow.dart';
import 'package:gpspro/presentation/screens/share_location/share_dialog.dart';

class MapActionButtons extends StatelessWidget {
  const MapActionButtons(
      {super.key,
      required this.mapType,
      required this.trafficEnabled,
      required this.toggleMapType,
      required this.toggleTraffic,
      this.moveToCurrentLocation,
      this.moveToGoogleMap,
      this.reloadMap,
      required this.deviceId,
      this.vehicle,
      this.isDeviceDetailsScreen = false});

  final MapType mapType;
  final bool trafficEnabled;
  final VoidCallback toggleMapType;
  final VoidCallback toggleTraffic;
  final VoidCallback? moveToCurrentLocation;
  final VoidCallback? reloadMap;
  final VoidCallback? moveToGoogleMap;
  final String deviceId;
  final Device? vehicle;
  final bool isDeviceDetailsScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 34,
          height: 90, // Optional: Fixed height to better divide halves

          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [AppShadow.dark],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: toggleTraffic,
                  child: Icon(
                    trafficEnabled ? Icons.traffic_sharp : Icons.traffic_outlined,
                    color: trafficEnabled ? context.colorScheme.primary : null,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 20,
              ),
              SizedBox(
                child: GestureDetector(
                  onTap: toggleMapType,
                  child: Container(
                    child: const Icon(
                      Icons.map_outlined,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        if (isDeviceDetailsScreen)
          Container(
            width: 34,
            height: 90,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [AppShadow.dark],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // Top Half (Share)
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) {
                          return ShareDialog(deviceId: deviceId, vehicle: vehicle!);
                        },
                      );
                    },
                    child: const Icon(
                      Icons.share_rounded,
                      size: 18,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 1,
                  thickness: 1,
                ),
                // Bottom Half (Directions)
                Expanded(
                  child: InkWell(
                    onTap: moveToGoogleMap,
                    child: const Icon(
                      Icons.directions_outlined,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (!isDeviceDetailsScreen)
          IconTheme(
            data: IconThemeData(
              color: context.colorScheme.outline,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (reloadMap != null)
                  buildIconButton(
                    context,
                    icon: Icons.refresh_rounded,
                    onTap: reloadMap!,
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (moveToCurrentLocation != null) ...[
                  buildIconButton(
                    context,
                    icon: Icons.my_location_rounded,
                    onTap: moveToCurrentLocation!,
                  ),
                  const SizedBox(height: 10),
                ],
                if (moveToGoogleMap != null) ...[
                  buildIconButton(
                    context,
                    icon: Icons.directions_outlined,
                    onTap: moveToGoogleMap!,
                  ),
                  const SizedBox(height: 10),
                ],
              ],
            ),
          ),
      ],
    );
  }

  InkWell buildIconButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colorScheme.surface,
          boxShadow: const [AppShadow.dark],
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}

void showShareDialog(BuildContext context, String deviceId, Device vehicle) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ShareDialog(deviceId: deviceId, vehicle: vehicle);
    },
  );
}
