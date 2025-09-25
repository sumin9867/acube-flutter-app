import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animarker/widgets/animarker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/utils/helpers/marker_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/app_scaffold.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/map_style_sheet.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/pages/vehicle_map/vehicle_bottom_sheet.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/widgets/map_action_buttons.dart';
import 'package:gpspro/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class VehicleDetailsPage extends StatefulWidget {
  const VehicleDetailsPage({
    super.key,
    required this.vehicleId,
  });

  final String vehicleId;

  @override
  State<VehicleDetailsPage> createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> with WidgetsBindingObserver {
  final Completer<GoogleMapController> mController = Completer<GoogleMapController>();
  late DeviceCubit _deviceCubit;
  late String? _mapStyle;
  late MapType mapType;
  late bool trafficEnabled;
  Marker? _marker;
  bool isInitialState = true;
  LatLng? startLocation;
  final DraggableScrollableController _draggableController = DraggableScrollableController();

  @override
  void initState() {
    _loadMapStyle();

    mapType = locator.get<LiveMapCubit>().state.mapType;
    trafficEnabled = locator.get<LiveMapCubit>().state.trafficEnabled;

    _deviceCubit = locator.get<MyDevicesCubit>().deviceCubits.firstWhere(
          (element) => element.state.id == int.parse(widget.vehicleId),
        );
    super.initState();
    locator.get<PolylineCubit>().clearPolyline();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _loadMapStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final storedStyle = prefs.getString('map_style_json') ?? 'simple';

    _mapStyle =
        storedStyle == 'simple' ? await rootBundle.loadString(Assets.style) : null; // Only apply custom JSON for simple

    context.read<LiveMapCubit>().changeMapTypeByName(storedStyle, await rootBundle.loadString(Assets.style));
  }

  void toggleTraffic() {
    setState(() {
      trafficEnabled = !trafficEnabled;
    });
  }

  void toggleSheet() {
    final screenHeight = MediaQuery.of(context).size.height;

    final double bottomSheetMinHeight = screenHeight * .4;
    log('I am Tapped');

    _draggableController.animateTo(
      bottomSheetMinHeight / screenHeight,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void openMap(double latitude, double longitude) async {
    final url = 'https://www.google.com/maps?q=$latitude,$longitude';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future<void> _onStopover(LatLng latLng) {
    return mController.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 16,
          ),
        ),
      );
    });
  }

  Future<String> loadMapStyle() async {
    return await rootBundle.loadString(Assets.style);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      locator.get<WebsocketCubit>().disconnect();
    }
    if (state == AppLifecycleState.resumed) {
      locator.get<PolylineCubit>().clearPolyline();
      locator.get<WebsocketCubit>().reconnect();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    mController.future.then((cntrl) => cntrl.dispose());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Theme(
      data: Theme.of(context).copyWith(
        bottomSheetTheme: BottomSheetThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent.withOpacity(0.5),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _deviceCubit,
          ),
        ],
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              authenticated: (user) {
                return BlocBuilder<DeviceCubit, Device>(
                  builder: (context, device) {
                    final now = DateTime.now();
                    final expiration = device.expirationTime ?? DateTime.now();

                    final difference = expiration.difference(now).inDays;
                    return AppStackScafold(
                      onBack: () {
                        locator.get<AppRouter>().pop(_marker);
                      },
                      bottomSheet: VehicleMapBottomSheet(
                        user: user,
                        vehicle: device,
                        draggableController: _draggableController,
                      ),
                      body: Padding(
                        padding: const EdgeInsets.only(bottom: 230),
                        child: Stack(
                          children: [
                            FutureBuilder<Marker>(
                              future: MarkerHelper.getMapMarker(device),
                              initialData: _marker,
                              builder: (context, ss) {
                                if (ss.connectionState == ConnectionState.waiting && isInitialState) {
                                  return const SizedBox.shrink();
                                }

                                final polylineCubit = context.read<PolylineCubit>();

                                if (ss.connectionState == ConnectionState.done) {
                                  if (ss.hasData) {
                                    _marker = ss.data;
                                    isInitialState = false;

                                    polylineCubit.addPolyline(device);
                                  }
                                }

                                return BlocBuilder<PolylineCubit, PolylineState>(
                                  builder: (context, polylineState) {
                                    final polylines = polylineState.polylines;
                                    final borderPolylines = polylineState.borderPolylines;
                                    final Set<Polyline> allPolylines = Set<Polyline>.of(polylines.values)
                                        .union(Set<Polyline>.of(borderPolylines.values));

                                    return _marker == null
                                        ? const SizedBox.shrink()
                                        : Animarker(
                                            useRotation: true,
                                            key: ValueKey('animarker-${device.id}'),
                                            mapId: mController.future.then<int>(
                                              (value) => value.mapId,
                                            ),
                                            markers: {_marker!},
                                            onStopover: _onStopover,
                                            child: buildMap(device, allPolylines),
                                          );
                                  },
                                );
                              },
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.035,
                                right: screenWidth * 0.035,
                                bottom: (difference <= 30 ? screenHeight * 0.17 : screenHeight * 0.11) +
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: BlocBuilder<LiveMapCubit, LiveMapState>(
                                builder: (context, livestate) {
                                  return MapActionButtons(
                                    isDeviceDetailsScreen: true,
                                    vehicle: device,
                                    deviceId: device.id.toString(),
                                    mapType: mapType,
                                    trafficEnabled: trafficEnabled,
                                    toggleMapType: () {
                                      log('i am clicked');
                                      showModalBottomSheet(
                                        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return MapStyleSheet(
                                            initialMapStyle:
                                                mapTypeNameFromType(livestate.mapType, livestate.mapStyle ?? ''),
                                            onApply: (finalMapStyle) async {
                                              final prefs = await SharedPreferences.getInstance();
                                              await prefs.setString('map_style_json', finalMapStyle);

                                              setState(() {
                                                _mapStyle = finalMapStyle;
                                              });

                                              context.read<LiveMapCubit>().changeMapTypeByName(
                                                  finalMapStyle, await rootBundle.loadString(Assets.style));
                                            },
                                          );
                                        },
                                      );
                                    },
                                    toggleTraffic: toggleTraffic,
                                    moveToGoogleMap: () {
                                      openMap(device.position!.latitude, device.position!.longitude);
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void toggledMap(LiveMapState state) {}

  String mapTypeNameFromType(MapType type, String mapStyle) {
    if (mapStyle.isEmpty) {
      return 'classic';
    }
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

  Widget buildMap(Device device, Set<Polyline> allPolylines) {
    return BlocBuilder<LiveMapCubit, LiveMapState>(
      builder: (context, state) {
        return GoogleMap(
          key: ValueKey('map-${device.id}'),
          mapType: state.mapType,
          style: state.mapStyle,
          trafficEnabled: trafficEnabled,
          initialCameraPosition: _deviceCubit.state.position != null
              ? CameraPosition(
                  target: LatLng(
                    _deviceCubit.state.position!.latitude,
                    _deviceCubit.state.position!.longitude,
                  ),
                  zoom: 16,
                )
              : const CameraPosition(
                  target: LatLng(0, 0),
                  zoom: 16,
                ),
          zoomControlsEnabled: false,
          compassEnabled: true,
          rotateGesturesEnabled: false,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          // style: _mapStyle,
          onTap: (LatLng latLng) {
            log('I am Tapped at: $latLng');
            toggleSheet(); // If you still want this behavior
          },
          onMapCreated: (controller) {
            if (!mController.isCompleted) {
              mController.complete(controller);
            }
          },
          mapToolbarEnabled: false,
          polylines: allPolylines,
        );
      },
    );
  }
}
