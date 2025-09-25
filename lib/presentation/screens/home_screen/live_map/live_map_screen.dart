import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/map_style_sheet.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/widgets/map_action_buttons.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LiveMapScreen extends StatefulWidget {
  const LiveMapScreen({super.key});

  @override
  State<LiveMapScreen> createState() => _LiveMapScreenState();
}

class _LiveMapScreenState extends State<LiveMapScreen> with WidgetsBindingObserver {
  String? _mapStyle;

  late final Completer<GoogleMapController> mController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    locator.get<WebsocketCubit>().init();
    mController = Completer<GoogleMapController>();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final storedStyle = prefs.getString('map_style_json') ?? 'simple';

    _mapStyle = storedStyle == 'simple' ? await rootBundle.loadString(Assets.style) : null;

    context.read<LiveMapCubit>().changeMapTypeByName(storedStyle, await rootBundle.loadString(Assets.style));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      locator.get<WebsocketCubit>().disconnect();
    } else if (state == AppLifecycleState.resumed) {
      locator.get<WebsocketCubit>().reconnect();
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    mController.future.then((cntrl) => cntrl.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<LiveMapCubit, LiveMapState>(
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          if (state.markers.isEmpty || state.isLoading) {
            return _buildLoadingUI();
          }

          return Stack(
            children: [
              GoogleMap(
                markers: state.markers.map((marker) => marker.marker).toSet(),
                mapType: state.mapType,
                trafficEnabled: state.trafficEnabled,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(28.3419602, 84.1535794),
                  zoom: 1,
                ),
                myLocationEnabled: true,
                style: state.mapStyle,
                onMapCreated: (GoogleMapController controller) {
                  context.read<LiveMapCubit>().onMapCreated(controller);
                  if (!mController.isCompleted) {
                    mController.complete(controller);
                    context.read<LiveMapCubit>().resetBoundaries();
                  }
                },
                clusterManagers: {
                  ClusterManager(
                    clusterManagerId: context.read<LiveMapCubit>().clusterManagerId,
                    onClusterTap: (Cluster cluster) {
                      context.read<LiveMapCubit>().resetBoundaries(bound: cluster.bounds);
                    },
                  )
                },
                mapToolbarEnabled: false,
              ),
              _buildMapActionButtons(context, state),
            ],
          );
        },
      ),
    ));
  }

  Widget _buildLoadingUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.loader.lottie(
            height: MediaQuery.of(context).size.height * 0.15,
            frameRate: FrameRate.max,
          ),
          const SizedBox(height: 15),
          const Text('Waiting for your device to come online.'),
        ],
      ),
    );
  }

  Widget _buildMapActionButtons(BuildContext context, LiveMapState state) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
      child: MapActionButtons(
        isDeviceDetailsScreen: false,
        deviceId: '',
        moveToCurrentLocation: () async {
          final controller = await mController.future;
          await moveToCurrentLocation(controller);
        },
        toggleMapType: () {
          showModalBottomSheet(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context) {
              return MapStyleSheet(
                initialMapStyle: mapTypeNameFromType(state.mapType, state.mapStyle ?? ''),
                onApply: (finalMapStyle) async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('map_style_json', finalMapStyle);

                  setState(() {
                    _mapStyle = finalMapStyle;
                  });

                  context
                      .read<LiveMapCubit>()
                      .changeMapTypeByName(finalMapStyle, await rootBundle.loadString(Assets.style));
                },
              );
            },
          );
        },
        toggleTraffic: () {
          context.read<LiveMapCubit>().toggleTraffic();
        },
        reloadMap: () {
          context.read<LiveMapCubit>().resetBoundaries();
        },
        mapType: state.mapType,
        trafficEnabled: state.trafficEnabled,
      ),
    );
  }

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

  Future<void> moveToCurrentLocation(GoogleMapController mapController) async {
    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return;
      }

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      );

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    } catch (e) {
      log('Error getting location: $e');
    }
  }

  Widget mapIcons(String image, String text) {
    return Column(
      spacing: 10,
      children: [
        Image.asset(
          'assets/images/$image.png',
          fit: BoxFit.fill,
          height: 85,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 20 / 14,
            letterSpacing: -0.3,
            color: Color.fromRGBO(24, 24, 24, 1),
          ),
        )
      ],
    );
  }
}
