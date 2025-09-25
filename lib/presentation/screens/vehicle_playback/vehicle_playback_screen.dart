import 'dart:async';
import 'dart:developer';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/gen/l10n/l10n.dart';
import 'package:gpspro/presentation/app_shadow.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/global_widgets/map_style_helper.dart';
import 'package:gpspro/presentation/global_widgets/trackon_appbar.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/error_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/map_style_sheet.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/cubit/vehicle_playback_cubit.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/vehicle_info_card.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/vehicle_playback_bottom_sheet.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/vehicle_playback_datepicker.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/vehicle_stops_info_card.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class VehiclePlaybackScreen extends StatelessWidget {
  const VehiclePlaybackScreen({
    super.key,
    required this.vehicleId,
  });
  final String vehicleId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<VehiclePlaybackCubit>()..initialize(vehicleId),
      child: _VehiclePlaybackBodyScreen(vehicleId: vehicleId),
    );
  }
}

class _VehiclePlaybackBodyScreen extends StatefulWidget {
  const _VehiclePlaybackBodyScreen({
    required this.vehicleId,
  });
  final String vehicleId;

  @override
  State<_VehiclePlaybackBodyScreen> createState() => __VehiclePlaybackBodyScreenState();
}

class __VehiclePlaybackBodyScreenState extends State<_VehiclePlaybackBodyScreen> {
  MapType mapType = MapType.normal;
  bool trafficEnabled = false;
  String? _mapStyle;
  final ValueNotifier<VehicleStop?> selectedLatLng = ValueNotifier<VehicleStop?>(null);

  bool isPlayings = true;
  ValueNotifier<bool> isStopMarkerTapped = ValueNotifier<bool>(false);

  final webSocketCubit = locator.get<WebsocketCubit>();
  final TextEditingController dateController = TextEditingController();
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final Set<Marker> _stopMarkers = <Marker>{};
  DateTime selectedDates = DateTime.now();
  LatLng? startLocation;
  List<VehicleStop> stopsList = [];
  List<VehicleTrip> tripList = [];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final savedStyle = prefs.getString('map_style_json');
      if (savedStyle != null) {
        _mapStyle = savedStyle;
      } else {
        rootBundle.loadString(Assets.style).then((string) {
          _mapStyle = string;
        });
      }
    });

    selectedLatLng.addListener(() {
      log('I am caleed in info ');
      final latLng = selectedLatLng.value;
      if (latLng != null) {
        _customInfoWindowController.addInfoWindow
            ?.call(VehicleStopsInfoCard(vehicleStop: latLng), LatLng(latLng.latitude, latLng.longitude));
      }
      final target = LatLng(latLng!.latitude, latLng.longitude);
      context.read<VehiclePlaybackCubit>().animateCameraTo(target);
    });

    loadStopsOnMap();
    webSocketCubit.disconnect();
    rootBundle.loadString(Assets.style).then((string) {
      _mapStyle = string;
    });
  }

  @override
  void dispose() {
    webSocketCubit.reconnect();

    super.dispose();
  }

  final DeviceRepo deviceRepo = locator.get<DeviceRepo>();

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('MMM').format(selectedDates);
    final String formattedDay = DateFormat('dd').format(selectedDates);

    DateFormat('MMM dd').format(DateTime.now());

    return Scaffold(
      appBar: const TrackonAppbar(text: 'Vehicle Playback'),
      bottomSheet: VehiclePlaybackBottomSheet(
        onPlaybackStateChanged: (bool value) {},
        stop: stopsList,
        trip: tripList,
        onStopTap: (vehicleStop) {
          log('Stop tapped: $vehicleStop');
          isStopMarkerTapped.value = true;
          context.read<VehiclePlaybackCubit>().stopPlayback();

          final latLng = LatLng(vehicleStop.latitude, vehicleStop.longitude);

          context.read<VehiclePlaybackCubit>().animateCameraTo(latLng);

          _customInfoWindowController.addInfoWindow?.call(
            VehicleStopsInfoCard(vehicleStop: vehicleStop),
            latLng,
          );

          context.pop();
        },
      ),
      body: BlocBuilder<LiveMapCubit, LiveMapState>(
        builder: (context, liveState) {
          return BlocBuilder<VehiclePlaybackCubit, VehiclePlaybackState>(
            buildWhen: (_, __) => true,
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => ErrorScreen(
                  title: 'Error',
                  message: message,
                  onRetry: () {
                    context.read<VehiclePlaybackCubit>().initialize(widget.vehicleId);
                  },
                ),
                empty: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 170),
                    child: Stack(
                      children: [
                        emptyContainer(),
                        emptyDatePicker(formattedDay, formattedDate),
                      ],
                    ),
                  );
                },
                idle: (state) {
                  final isPlaying = state.isPlaying;

                  if (isPlaying) {
                    isStopMarkerTapped.value = false;

                    _customInfoWindowController.hideInfoWindow?.call();
                  } else {
                    _customInfoWindowController.addInfoWindow?.call(
                      VehicleInfoCard(
                        address: state.vehicle.position?.address,
                        speed: state.vehicle.position?.speed ?? 0,
                        rssi: state.vehicle.position?.attributes?.rssi ?? 0,
                        signalLabel: _getSignalLabel(state.vehicle.position?.attributes?.rssi ?? 0),
                      ),
                      state.currentLocationMarker.position,
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 170),
                    child: Stack(
                      children: [
                        googleMap(state, isPlaying, liveState),
                        Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .04),
                          child: Align(alignment: Alignment.center, child: Container()),
                        ),
                        customInfoWindow(state),
                        datePicker(formattedDay, formattedDate),
                        toggleMap(liveState)
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showTopModal() async {
    log('pressed');
    await showTopModalSheet(
      context,
      PlayBackDatePicker(
        dateController: dateController,
        onDateSelected: (selectedDate) {
          setState(() {
            if (selectedDate != selectedDates) {
              setState(() {
                selectedDates = selectedDate;
              });

              if (mounted) {
                context.read<VehiclePlaybackCubit>().filterDataByDate(selectedDates);
                loadStopsOnMap();
              }
            }
          });
        },
      ),
      backgroundColor: Colors.white,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(10),
      ),
    );
  }

  Widget toggleMap(LiveMapState liveState) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: MediaQuery.of(context).size.height * .16),
      child: GestureDetector(
        onTap: () {
          log('I am style $_mapStyle');
          showModalBottomSheet(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return MapStyleSheet(
                initialMapStyle: mapTypeNameFromType(liveState.mapType, liveState.mapStyle ?? ''),
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
        child: Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFE0E0E0),
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: -1,
                ),
                BoxShadow(
                  color: Color(0xFFBDBDBD),
                  offset: Offset(0, 1),
                  blurRadius: 3,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: SvgPicture.asset(
              'assets/icons/playback/layer.svg',
            )),
      ),
    );
  }

  Widget datePicker(String formattedDay, String formattedDate) {
    return PositionedDirectional(
      top: 10,
      end: 10,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => _showTopModal(),
          child: Container(
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [AppShadow.normal],
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/playback/calendar.svg',
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    children: [
                      Text(
                        formattedDay,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customInfoWindow(VehiclePlaybackViewModel state) {
    return ValueListenableBuilder<bool>(
      valueListenable: isStopMarkerTapped,
      builder: (context, isTapped, _) {
        final address = state.vehicle.position?.address ?? '';

        final double screenWidth = MediaQuery.of(context).size.width;
        final double screenHeight = MediaQuery.of(context).size.height;
        final double maxWidth = screenWidth * 0.6;
        final double maxHeight = screenHeight * 0.3;

        final window = WidgetsBinding.instance.platformDispatcher.views.first;
        final double dpi = window.devicePixelRatio * 160;
        final double dpiFactor = dpi / 420;

        final TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: address,
            style: const TextStyle(fontSize: 14),
          ),
          maxLines: null,
          textDirection: Directionality.of(context),
        )..layout(maxWidth: maxWidth);

        final double textWidth = textPainter.size.width;
        final double textHeight = textPainter.size.height;

        final double paddingHorizontal = 16 * dpiFactor;
        final double paddingVertical = 12 * dpiFactor;

        double width = textWidth + paddingHorizontal;
        if (width < 150) width = 160;
        if (isTapped) width *= 1.5;
        width = width.clamp(150, maxWidth);

        double height = textHeight + paddingVertical * 2.5;
        if (isTapped) height *= 1.2;
        height = height.clamp(80, maxHeight);

        log('CustomInfoWindow size → width: $width, height: $height');

        return CustomInfoWindow(
          controller: _customInfoWindowController,
          height: height,
          width: width,
          offset: 10,
        );
      },
    );
  }

  Widget googleMap(VehiclePlaybackViewModel state, bool isPlaying, LiveMapState liveState) {
    return Animarker(
      isActiveTrip: true,
      shouldAnimateCamera: false,
      key: ValueKey('animarker-${state.vehicle.id}-${state.dataRange}'),
      duration: Duration(milliseconds: state.playbackSpeed),
      mapId: context.read<VehiclePlaybackCubit>().getmapId(),
      markers: {state.startMarker, state.endMarker, state.currentLocationMarker},
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: GoogleMap(
          markers: _stopMarkers,
          onCameraMove: (position) {
            _customInfoWindowController.onCameraMove!();
          },
          onCameraIdle: () {},
          key: ValueKey('map-${state.vehicle.id}'),
          initialCameraPosition: CameraPosition(
            target: state.currentLocationMarker.position,
            zoom: 16,
          ),
          zoomGesturesEnabled: isPlaying ? false : true,
          mapType: liveState.mapType,
          trafficEnabled: trafficEnabled,
          polylines: {
            Polyline(
              polylineId: const PolylineId('polyline'),
              points: state.polylineCoordinates,
              color: const Color.fromARGB(255, 40, 40, 40),
              width: 6,
            ),
            Polyline(
              polylineId: const PolylineId('polyline_border'),
              points: state.polylineCoordinates,
              color: const Color.fromRGBO(8, 128, 234, 1),
              width: 5,
            ),
          },
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: true,
          style: liveState.mapStyle,
          onMapCreated: (GoogleMapController controller) {
            _customInfoWindowController.googleMapController = controller;
            context.read<VehiclePlaybackCubit>().onMapCreated(controller);
          },
        ),
      ),
    );
  }

  Widget emptyContainer() {
    return Container(
      alignment: Alignment.center,
      color: context.colorScheme.primaryContainer.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_playback.png',
            height: MediaQuery.of(context).size.height * .25,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).noPlayBackDataFound,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget emptyDatePicker(String formattedDay, String formattedDate) {
    return PositionedDirectional(
      top: 10,
      end: 10,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => _showTopModal(),
          child: Container(
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [AppShadow.normal],
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 218, 218, 218),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: const Icon(
                    Icons.calendar_month_rounded,
                    size: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    children: [
                      Text(
                        formattedDay,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadStopsOnMap() async {
    final BitmapDescriptor endIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(36, 36)),
      'assets/images/circle_stop.png',
    );

    try {
      final DateTime startDate = DateTime(selectedDates.year, selectedDates.month, selectedDates.day, 0, 0, 0, 0, 0);
      final DateTime endDate =
          DateTime(selectedDates.year, selectedDates.month, selectedDates.day, 23, 59, 59, 999, 999);
      final List<VehicleStop> stops = await deviceRepo.getStops(widget.vehicleId, startDate, endDate);
      final List<VehicleTrip> trip = await deviceRepo.getTrip(widget.vehicleId, startDate, endDate);
      setState(() {
        stopsList = stops;
        tripList = trip;
      });

      final List<Marker> markers = stops.map((stop) {
        return Marker(
            onTap: () {
              isStopMarkerTapped.value = true;

              _customInfoWindowController.addInfoWindow?.call(
                  VehicleStopsInfoCard(
                    vehicleStop: stop,
                  ),
                  LatLng(stop.latitude, stop.longitude));
            },
            anchor: const Offset(0.5, 0.5),
            markerId: MarkerId('${stop.latitude},${stop.longitude}'),
            position: LatLng(stop.latitude, stop.longitude),
            icon: endIcon);
      }).toList();

      setState(() {
        _stopMarkers.clear();

        if (markers.length > 2) {
          _stopMarkers.addAll(markers.sublist(1));
        }
      });
    } catch (e) {
      log('Error loading stops: $e');
    }
  }

  void toggledMap(LiveMapState state) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return MapStyleSheet(
          initialMapStyle: MapStyleHelper.mapTypeNameFromType(state.mapType),
          onApply: (finalMapStyle) async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('map_style_json', finalMapStyle);

            setState(() {
              _mapStyle = finalMapStyle;
            });

            context.read<LiveMapCubit>().changeMapTypeByName(finalMapStyle, await rootBundle.loadString(Assets.style));
          },
        );
      },
    );
  }

  void toggleTraffic() {
    setState(() {
      trafficEnabled = !trafficEnabled;
    });
  }

  String _getSignalLabel(int rssi) {
    if (rssi < 3) {
      return 'Poor';
    } else if (rssi == 3) {
      return 'Normal';
    } else {
      return 'High';
    }
  }
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

Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permission permanently denied.');
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}

void fetchLocation() async {
  try {
    final Position position = await getCurrentLocation();
    log('Lat: ${position.latitude}, Lng: ${position.longitude}');
  } catch (e) {
    log('Error: $e');
  }
}
