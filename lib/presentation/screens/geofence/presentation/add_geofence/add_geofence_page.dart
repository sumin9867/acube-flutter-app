import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/screens/geofence/application/add_geofence/add_geofence_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/reverse_location_cubit/reverse_location_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/application/view_geofence/geofence_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/widgets/add_geofence_appbar.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/widgets/current_location_button.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/widgets/location_list_widget.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/widgets/shimmer_list.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/cubit/live_map_cubit.dart';
import 'package:gpspro/theme/app_colors.dart';

class AddGeofencePage extends StatefulWidget {
  const AddGeofencePage({
    super.key,
    required this.vehicleId,
  });

  final String vehicleId;

  @override
  State<AddGeofencePage> createState() => _AddGeofencePageState();
}

class _AddGeofencePageState extends State<AddGeofencePage> {
  String? _selectedAddress;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final ValueNotifier<bool> isSearchingNotifier = ValueNotifier(false);
  final ValueNotifier<bool> isSearchingInitialNotifier = ValueNotifier(true);

  final Completer<GoogleMapController> mController = Completer<GoogleMapController>();

  LatLng? _currentPosition;
  double minRadius = 100;
  double maxRadius = 5000;
  MapType mapType = MapType.normal;
  bool trafficEnabled = false;
  final ValueNotifier<double> _radius = ValueNotifier(100);
  final Set<Marker> _markers = {};
  final ValueNotifier<Set<Circle>> _circles = ValueNotifier({});

  static const LatLng _defaultPosition = LatLng(27.6667, 85.3500);

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    context.read<LiveMapCubit>();
    _getCurrentLocation();
  }

  void _handleSearchStateChanged(bool isSearching) {
    isSearchingNotifier.value = isSearching;
    if (!isSearching) {
      isSearchingInitialNotifier.value = true;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    _searchController.dispose();
    mController.future.then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddGeofenceCubit>(
      create: (context) => locator.get<AddGeofenceCubit>(),
      child: BlocConsumer<AddGeofenceCubit, AddGeofenceState>(
        listener: (context, state) {
          state.maybeWhen(
              success: (message) {
                AppToast.showSuccess(message: message, context: context);
                context.pop();

                context.read<GeofenceCubit>().init(widget.vehicleId);
              },
              error: (errorMsg) {
                AppToast.showError(message: errorMsg, context: context);
              },
              orElse: () {});
        },
        builder: (context, state) {
          final addGeofenceCubit = context.read<AddGeofenceCubit>();

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AddGeofenceAppbar(
              onSearchStateChanged: _handleSearchStateChanged,
              isSearchingNotifier: isSearchingNotifier,
              isSearchingInitialNotifier: isSearchingInitialNotifier,
            ),
            body: Column(
              children: [
                BlocBuilder<LiveMapCubit, LiveMapState>(
                  builder: (context, liveState) {
                    return Expanded(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .68,
                            child: Stack(children: [
                              Positioned.fill(
                                child: ValueListenableBuilder<Set<Circle>>(
                                  valueListenable: _circles,
                                  builder: (context, circles, _) {
                                    return GoogleMap(
                                      mapToolbarEnabled: false,
                                      key: ValueKey('map-${widget.vehicleId}'),
                                      zoomControlsEnabled: false,
                                      mapType: liveState.mapType,
                                      style: liveState.mapStyle,
                                      trafficEnabled: trafficEnabled,
                                      zoomGesturesEnabled: true,
                                      initialCameraPosition: CameraPosition(
                                        target: _currentPosition ?? _defaultPosition,
                                        zoom: 10,
                                      ),
                                      markers: _markers,
                                      circles: circles,
                                      onMapCreated: (controller) {
                                        if (!mController.isCompleted) {
                                          mController.complete(controller);
                                        }
                                      },
                                      myLocationEnabled: true,
                                      myLocationButtonEnabled: false,
                                      onCameraIdle: () {
                                        _updateCirclePosition();
                                      },
                                      onCameraMove: (CameraPosition position) async {
                                        _currentPosition = position.target;
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .04),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/icons/marker/marker_geofence.png',
                                      width: 35,
                                      height: 35,
                                    )),
                              ),
                            ]),
                          ),
                          LocationSearchWidget(
                            getCurrentLocation: _getCurrentLocation,
                            moveCameraTo: _moveCameraTo,
                            radius: _radius.value,
                            zoomLevel: _calculateZoomLevel(_radius.value),
                            isSearchingNotifier: isSearchingNotifier,
                            isSearchingInitialNotifier: isSearchingInitialNotifier,
                          ),
                          CurrentLocationButton(
                              onPressed: () => _getCurrentLocation(),
                              bottomPosition: MediaQuery.of(context).size.height * .3,
                              endPosition: 0),
                          // ToggleMapButton(
                          //     onPressed: () {
                          //       showModalBottomSheet(
                          //         backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                          //         context: context,
                          //         isScrollControlled: true,
                          //         builder: (context) {
                          //           return MapStyleSheet(
                          //             initialMapStyle: mapTypeNameFromType(liveState.mapType, liveState.mapStyle ?? ''),
                          //             onApply: (finalMapStyle) async {
                          //               final prefs = await SharedPreferences.getInstance();
                          //               await prefs.setString('map_style_json', finalMapStyle);

                          //               setState(() {
                          //                 _mapStyle = finalMapStyle;
                          //               });

                          //               context.read<LiveMapCubit>().changeMapTypeByName(
                          //                   finalMapStyle, await rootBundle.loadString(Assets.style));
                          //             },
                          //           );
                          //         },
                          //       );
                          //     },
                          //     bottomPosition: MediaQuery.of(context).size.height * .2,
                          //     startPosition: 0),
                          PositionedDirectional(
                            bottom: 0,
                            start: 0,
                            end: 0,
                            child: Container(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 14),
                                  BlocBuilder<ReverseLocationCubit, ReverseLocationState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () => const SizedBox.shrink(),
                                        loading: () => const ShimmerList(
                                          itemCount: 1,
                                          firstshimmerheight: 10,
                                          firstshimmerWidth: 200,
                                          secondshimmerheight: 10,
                                          secondshimmerwidth: 150,
                                          gap: 10,
                                        ),
                                        idle: (viewModel) {
                                          _selectedAddress = [
                                            viewModel.address['road'],
                                            viewModel.address['city_district'],
                                            viewModel.address['state'],
                                            viewModel.address['country'],
                                          ].whereType<String>().join(', ');
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 18),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset('assets/icons/vehicle_geofence/location.svg'),
                                                const SizedBox(width: 10),
                                                Flexible(
                                                  child: Text(
                                                    [
                                                      viewModel.address['road'],
                                                      viewModel.address['city_district'],
                                                      viewModel.address['state'],
                                                      viewModel.address['country'],
                                                    ].whereType<String>().join(', '),
                                                    softWrap: true,
                                                    maxLines: null,
                                                    overflow: TextOverflow.visible,
                                                    style: const TextStyle(
                                                        fontSize: 14, color: Color.fromRGBO(100, 100, 100, 1)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        empty: () => const Text('No data'),
                                        error: (errorMsg) => Text(errorMsg),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                                    child: ValueListenableBuilder<double>(
                                      valueListenable: _radius,
                                      builder: (context, radius, child) {
                                        return SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Radius',
                                                    style: context.textTheme.bodyMedium?.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        color: const Color.fromRGBO(100, 100, 100, 1)),
                                                  ),
                                                  Text(
                                                    '${_radius.value.toStringAsFixed(0)} m',
                                                    style: context.textTheme.bodyMedium?.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        color: const Color.fromRGBO(8, 128, 234, 1)),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: SliderTheme(
                                                  data: const SliderThemeData(
                                                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                                                    trackHeight: 8,
                                                    activeTrackColor: Color.fromRGBO(8, 128, 234, 1),
                                                    thumbColor: Color.fromRGBO(8, 128, 234, 1),
                                                  ),
                                                  child: Slider(
                                                    value: radius,
                                                    min: 100,
                                                    max: 5000,
                                                    divisions: 100,
                                                    label: radius.round().toString(),
                                                    onChanged: _updateRadius,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(249, 249, 249, 1),
                                      border: Border(
                                        top: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1),
                                        bottom: BorderSide(color: Color.fromRGBO(235, 235, 235, 1), width: 1),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18, left: 18, top: 26, bottom: 40),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          showModalBottomSheet(
                                              showDragHandle: true,
                                              isScrollControlled: true,
                                              useRootNavigator: true,
                                              context: context,
                                              backgroundColor: Colors.transparent,
                                              builder: (context) {
                                                return Container(
                                                  margin: const EdgeInsets.only(top: 16),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(249, 249, 249, 1),
                                                    borderRadius: const BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                    ),
                                                    border: Border.all(
                                                      color: const Color.fromRGBO(241, 241, 241, 1),
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: Form(
                                                    key: _formkey,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(context).viewInsets.bottom,
                                                      ),
                                                      child: SingleChildScrollView(
                                                        // ✅ scrollable
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(bottom: 25),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisSize:
                                                                MainAxisSize.min, // ✅ prevent unbounded height
                                                            children: [
                                                              const SizedBox(height: 10),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    horizontal: 20, vertical: 5),
                                                                child: Text(
                                                                  context.locale.add_geofence_details,
                                                                  style: const TextStyle(
                                                                    color: Color.fromRGBO(24, 24, 24, 1),
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 22,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(height: 6),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    SvgPicture.asset(
                                                                        'assets/icons/vehicle_geofence/location.svg'),
                                                                    const SizedBox(width: 10),
                                                                    Flexible(
                                                                      child: Text(
                                                                        _selectedAddress ?? '',
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: const TextStyle(
                                                                          color: Color.fromRGBO(100, 100, 100, 1),
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 14,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(height: 20),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                                child: GenericTextfieldNew(
                                                                  validator: (value) {
                                                                    if (value == null || value.trim().isEmpty) {
                                                                      return 'Geofence name is required';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  label: context.locale.geofence_name_label,
                                                                  controller: nameController,
                                                                  hintText: '',
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 12,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                                child: GenericTextfieldNew(
                                                                  validator: (value) {
                                                                    if (value == null || value.trim().isEmpty) {
                                                                      return 'Geofence description is required';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  hintText: '',
                                                                  label: 'Geofence Description',
                                                                  controller: descriptionController,
                                                                ),
                                                              ),
                                                              const SizedBox(height: 10),
                                                              // _divider(),
                                                              // AssignVehiclesTile(
                                                              //     onSelectionChanged: (List<String> selectedIds) {
                                                              //   // Handle the selected vehicle IDs
                                                              // }),
                                                              _divider(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(right: 18, left: 18, top: 18),
                                                                child: SizedBox(
                                                                  width: double.infinity,
                                                                  height: 50,
                                                                  child: ElevatedButton(
                                                                    onPressed: () async {
                                                                      if (_formkey.currentState!.validate()) {
                                                                        log('Validated');
                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                        await addGeofenceCubit.addGeofence(
                                                                          context: context,
                                                                          name: nameController.text,
                                                                          description: descriptionController.text,
                                                                          radius: _radius.value,
                                                                          position: _currentPosition!,
                                                                          attributes: {
                                                                            'address': _selectedAddress ?? ''
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          const Color.fromRGBO(8, 128, 234, 1),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(12),
                                                                      ),
                                                                    ),
                                                                    child: const Text(
                                                                      'Create Geofence',
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 24),
                                        ),
                                        child: Text(
                                          context.locale.selectThisArea,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _divider() => Container(
        height: 10,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1),
          border: Border(
            top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1), width: 1),
            bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1), width: 1),
          ),
        ),
      );

  Timer? _debounce;

  Future<void> _updateRadius(double value) async {
    _radius.value = value;
    _updateCircles();

    _debounce = Timer(const Duration(milliseconds: 100), () async {
      final double zoomLevel = _calculateZoomLevel(_radius.value);
      _moveCameraTo(_currentPosition!, zoomLevel);
    });
  }

  void _updateCircles() {
    _circles.value = {
      Circle(
        circleId: const CircleId('geofenceRadius'),
        center: _currentPosition!,
        radius: _radius.value,
        fillColor: AppColors.primaryColor.withOpacity(0.2),
        strokeColor: AppColors.primaryColor,
        strokeWidth: 2,
      ),
    };
  }

  Future<void> _updateCirclePosition() async {
    if (_currentPosition != null) {
      try {
        if (_debounce?.isActive ?? false) _debounce?.cancel();

        _debounce = Timer(const Duration(milliseconds: 300), () {
          _updateCircles();
        });

        context
            .read<ReverseLocationCubit>()
            .reverseLocation(_currentPosition?.latitude as num, _currentPosition?.longitude as num);
      } catch (e) {
        log('Error fetching address: $e');
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    final data = await context.read<AddGeofenceCubit>().getCurrentLocation();

    if (data != null) {
      _moveCameraTo(data, _calculateZoomLevel(_radius.value));
    }
  }

  double _calculateZoomLevel(double radius) {
    if (radius <= 100) return 17;
    if (radius > 5000) return 13.0;

    final List<double> breakpoints = [100, 500, 1000, 2000, 5000];
    final List<double> zoomLevels = [17, 16, 15, 14, 13];

    for (int i = 0; i < breakpoints.length - 1; i++) {
      if (radius <= breakpoints[i + 1]) {
        final double zoomDiff = zoomLevels[i] - zoomLevels[i + 1];
        final double range = breakpoints[i + 1] - breakpoints[i];
        return zoomLevels[i] - ((radius - breakpoints[i]) * (zoomDiff / range)) - 1;
      }
    }

    return 13.0;
  }

  Future<void> _loadMapStyle() async {
    await rootBundle.loadString(Assets.style);
    setState(() {});
  }

  void _moveCameraTo(LatLng target, double zoom) {
    mController.future.then(
      (controller) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: target, zoom: zoom),
          ),
        );
      },
    );
  }
}
