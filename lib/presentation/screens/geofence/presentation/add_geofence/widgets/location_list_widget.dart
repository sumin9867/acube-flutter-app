// ignore_for_file: unused_field, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/presentation/screens/geofence/application/search_location/search_location_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/widgets/shimmer_list.dart';

class LocationSearchWidget extends StatefulWidget {
  final GestureTapCallback getCurrentLocation;
  final Function(LatLng, double) moveCameraTo;
  final double radius;
  final double zoomLevel;

  final ValueNotifier<bool> isSearchingNotifier;
  final ValueNotifier<bool> isSearchingInitialNotifier;

  const LocationSearchWidget({
    super.key,
    required this.getCurrentLocation,
    required this.moveCameraTo,
    required this.radius,
    required this.zoomLevel,
    required this.isSearchingInitialNotifier,
    required this.isSearchingNotifier,
  });

  @override
  State<LocationSearchWidget> createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  late TextEditingController _searchController;
  LatLng? _currentPosition;
  String? _currentAddress;
  Set<Marker> _markers = {};
  Set<Circle> _circles = {};

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  double _getBottomHeight(BuildContext context) {
    final state = context.watch<SearchLocationCubit>().state;
    return state.maybeWhen(
      loading: () => MediaQuery.of(context).size.height * .14,
      idle: (viewModel) {
        final int itemCount = viewModel.length > 4 ? 4 : viewModel.length;
        return viewModel.isEmpty
            ? 0
            : widget.isSearchingInitialNotifier.value
                ? 0
                : (itemCount * MediaQuery.of(context).size.height * .06) + 90;
      },
      empty: () => MediaQuery.of(context).size.height * .11,
      orElse: () => 0,
    );
  }

  Widget _buildCurrentLocationTile(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/icons/vehicle_geofence/current_location.svg',
        height: 26,
        width: 26,
      ),
      title: const Text(
        'Use current location',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Color.fromRGBO(8, 128, 234, 1),
        ),
      ),
      onTap: widget.getCurrentLocation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).size.height * 0.06,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.9),
        ),
        child: BlocBuilder<SearchLocationCubit, SearchLocationState>(
          builder: (context, state) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _getBottomHeight(context),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: state.maybeWhen(
                idle: (viewModel) {
                  log('I am search inia log ${widget.isSearchingInitialNotifier.value}');
                  log('I am search log ${widget.isSearchingNotifier.value}');

                  if (widget.isSearchingNotifier.value && !widget.isSearchingInitialNotifier.value) {
                    return ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * .12,
                      ),
                      shrinkWrap: true,
                      itemCount: viewModel.length >= 4 ? 5 : viewModel.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildCurrentLocationTile(context),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Divider(
                                  thickness: .4,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ],
                          );
                        }

                        final location = viewModel[index - 1];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .07,
                          ),
                          leading: SvgPicture.asset(
                            'assets/icons/vehicle_geofence/location.svg',
                          ),
                          title: Text(
                            location.displayName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),
                          ),
                          onTap: () async {
                            final latLng = LatLng(location.latitude, location.longitude);

                            setState(() {
                              _currentPosition = latLng;
                              _currentAddress = location.displayName;
                              _markers = {};
                              _circles = {
                                Circle(
                                  circleId: const CircleId('geofenceRadius'),
                                  center: _currentPosition!,
                                  radius: widget.radius,
                                  fillColor: Colors.blue.withOpacity(0.2),
                                  strokeColor: Colors.blue,
                                  strokeWidth: 2,
                                ),
                              };
                            });

                            // Move the camera
                            widget.moveCameraTo(_currentPosition!, widget.zoomLevel);

                            widget.isSearchingNotifier.value = false;
                            widget.isSearchingInitialNotifier.value = true;
                          },
                        );
                      },
                    );
                  }
                  return null;
                },
                loading: () {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCurrentLocationTile(context),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          thickness: .4,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      const ShimmerList(
                        itemCount: 1,
                        firstshimmerheight: 20,
                        firstshimmerWidth: 500,
                        secondshimmerheight: 20,
                        secondshimmerwidth: 400,
                        gap: 20,
                      ),
                    ],
                  );
                },
                empty: () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCurrentLocationTile(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        thickness: .4,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    const Text('No Location found for the respective query'),
                  ],
                ),
                error: (errorMsg) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCurrentLocationTile(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        thickness: .4,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            );
          },
        ),
      ),
    );
  }
}
