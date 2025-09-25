import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/vehicle_stop.dart';
import 'package:gpspro/domain/models/vehicle_trip.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/cubit/vehicle_playback_cubit.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/summary_list.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/summary_tab.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/vehicle_playspeed.dart';
import 'package:gpspro/presentation/screens/vehicle_playback/widgets/vehicle_slider.dart';
import 'package:jiffy/jiffy.dart';

class VehiclePlaybackBottomSheet extends StatelessWidget {
  final ValueChanged<bool> onPlaybackStateChanged;
  final void Function(VehicleStop stop) onStopTap;

  final List<VehicleStop> stop;
  final List<VehicleTrip> trip;
  final DraggableScrollableController _draggableController = DraggableScrollableController();

  VehiclePlaybackBottomSheet({
    super.key,
    required this.onPlaybackStateChanged,
    required this.stop,
    required this.trip,
    required this.onStopTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocBuilder<VehiclePlaybackCubit, VehiclePlaybackState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          empty: (viewModel) => Container(
            color: context.colorScheme.primaryContainer.withOpacity(0.4),
            height: height * .3,
          ),
          idle: (state) {
            // Determine which data to show
            final bool showTripFirstData = !state.isPlaying && (state.currentPlaybackIndex == 0);

            final displayAddress = showTripFirstData
                ? (stop.isNotEmpty ? stop.first.address ?? '' : '')
                : (state.vehicle.position?.address ?? '');

            final displayTime = showTripFirstData
                ? (stop.isNotEmpty
                    ? Jiffy.parseFromDateTime(stop.first.endTime)
                        .add(hours: 5, minutes: 45)
                        .format(pattern: 'yyyy-MM-dd hh:mm a')
                    : '-')
                : (state.vehicle.position?.deviceTime != null
                    ? '${Jiffy.parseFromDateTime(DateTime.parse(state.selectedDate.toIso8601String())).format(pattern: 'yyyy-MM-dd')} '
                        '${Jiffy.parseFromDateTime(DateTime.parse(state.vehicle.position!.deviceTime)).add(hours: 5, minutes: 45).format(pattern: 'hh:mm a')}'
                    : '-');

            return _buildDraggableSheetWrapper(
              context: context,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                state.vehicle.name.capitalizeFirstLetter(),
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontSize: height * 0.022,
                                  color: const Color.fromRGBO(24, 24, 24, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.02),
                              child: Text.rich(
                                TextSpan(
                                  text: AppHelper.formatSpeed(state.vehicle.position?.speed ?? 0),
                                  style: TextStyle(
                                    fontSize: height * 0.024,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(24, 24, 24, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' km/h',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.017,
                                        color: const Color.fromRGBO(141, 141, 141, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.010),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 11),
                              child: SvgPicture.asset(
                                'assets/icons/playback/location.svg',
                                height: height * 0.020,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.6,
                              child: AppText(
                                displayAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                color: const Color.fromRGBO(100, 100, 100, 1),
                                style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: height * 0.017,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.010),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 11),
                              child: SvgPicture.asset(
                                'assets/icons/playback/time.svg',
                                height: height * 0.018,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.6,
                              child: AppText(
                                displayTime,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                color: const Color.fromRGBO(100, 100, 100, 1),
                                style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: height * 0.017,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.020),
                    PlaybackSlider(
                      onPlaybackStateChanged: onPlaybackStateChanged,
                      currentPlaybackIndex: state.currentPlaybackIndex,
                      playbackSize: state.playbackSize,
                    ),
                    SizedBox(height: height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(8, 128, 234, 1),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              context.read<VehiclePlaybackCubit>().togglePlayback();
                              onPlaybackStateChanged(!state.isPlaying);
                            },
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.pause_play,
                              color: Colors.white,
                              progress: AlwaysStoppedAnimation(state.isPlaying ? 0 : 1),
                              size: height * 0.027,
                            ),
                            label: Text(
                              state.isPlaying ? 'Pause' : 'Play',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.020,
                              ),
                            ),
                          ),
                        ),
                        const PlaybackSpeedControl(),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(247, 247, 247, 1), // Background color
                        border: Border(
                          top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                          bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * .018, bottom: height * .025),
                      child: GestureDetector(
                        onTap: () => toggleSheet(),
                        child: Row(
                          children: [
                            Text(
                              context.locale.summary,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(24, 24, 24, 1),
                                fontSize: height * 0.018,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                size: 26,
                                Icons.keyboard_arrow_down_rounded,
                                color: Color.fromRGBO(128, 128, 128, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .57,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SummaryTab(trip: trip),
                            SummaryList(
                              stop: stop,
                              trip: trip,
                              onStopTap: onStopTap,
                            ),
                            const SizedBox(
                              height: 70,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void toggleSheet() {
    final currentSize = _draggableController.size;

    const collapsedSize = 0.35;

    if ((currentSize - 0.98).abs() < 0.01) {
      _draggableController.animateTo(
        collapsedSize,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _draggableController.animateTo(
        0.98,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildDraggableSheetWrapper({
    required BuildContext context,
    required Widget child,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    log('i am screen height $screenHeight');

    double initialHeight;

    if (screenHeight >= 700 && screenHeight <= 850) {
      initialHeight = screenHeight * 0.35;
    } else if (screenHeight < 641) {
      initialHeight = screenHeight * 0.40;
    } else {
      initialHeight = screenHeight * 0.35;
    }

    if (Platform.isIOS) {
      initialHeight += screenHeight * 0.015;
    }

    return DraggableScrollableSheet(
      controller: _draggableController,
      initialChildSize: initialHeight / screenHeight,
      minChildSize: initialHeight / screenHeight,
      maxChildSize: 0.98,
      expand: false,
      snap: true,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(249, 249, 249, 1),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                _draggableController.animateTo(
                  1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              } else if (details.primaryVelocity! > 0) {
                _draggableController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            },
            child: ListView(
              controller: scrollController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 6,
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: context.theme.dividerColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
