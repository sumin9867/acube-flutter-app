import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/no_data_widget.dart';
import 'package:gpspro/presentation/screens/geofence/application/view_geofence/geofence_cubit.dart';
import 'package:gpspro/presentation/screens/geofence/domain/geofence_model.dart';
import 'package:gpspro/presentation/screens/geofence/presentation/add_geofence/widgets/edt_name.dart';
import 'package:gpspro/router/app_router.dart';
import 'package:gpspro/router/route_helper.dart';
import 'package:gpspro/router/route_params.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class GeofenceBottomSheet extends StatefulWidget {
  const GeofenceBottomSheet({
    super.key,
    required this.controller,
    required this.onSelectGeofence,
    required this.vehicleId,
  });

  final DraggableScrollableController controller;
  final String vehicleId;
  final void Function(GeofenceModel) onSelectGeofence;

  @override
  State<GeofenceBottomSheet> createState() => _GeofenceBottomSheetState();
}

class _GeofenceBottomSheetState extends State<GeofenceBottomSheet> {
  String? _selectedGeofenceId;
  final TextEditingController editNameController = TextEditingController();

  void _handleSelection(GeofenceModel model) {
    setState(() {
      _selectedGeofenceId = model.id.toString();
    });
    widget.onSelectGeofence(model);
  }

  void _showDeleteConfirmation(BuildContext context, GeofenceModel model) {
    final screenWidth = MediaQuery.of(context).size.width;
    log('i am screensize $screenWidth');

    // scale values based on screen width
    final double padding = screenWidth < 400 ? 16 : 26;
    final double iconSize = screenWidth < 400 ? 28 : 32;
    final double titleFontSize = screenWidth < 400 ? 16 : 18;
    final double messageFontSize = screenWidth < 400 ? 14 : 16;
    final double buttonFontSize = screenWidth < 400 ? 14 : 16;
    final double buttonHeight = screenWidth < 400 ? 44 : 50;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.deleteIconBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/vehicle_geofence/remove.svg',
                    height: iconSize,
                    width: iconSize,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  context.locale.remove_geofence_title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(24, 24, 24, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.locale.remove_geofence_message(model.name ?? 'geofence'),
                  style: TextStyle(
                    fontSize: messageFontSize,
                    color: const Color.fromRGBO(100, 100, 100, 1),
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: buttonHeight,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(width: 1, color: Color.fromRGBO(235, 235, 235, 1)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            context.locale.cancel,
                            style: TextStyle(
                              color: const Color.fromRGBO(24, 24, 24, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: buttonFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () async {
                            await context.read<GeofenceCubit>().deleteGeofence(model, context);
                            locator.get<AppRouter>().pop();
                            locator.get<AppRouter>().pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(217, 61, 66, 1),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            context.locale.yes_remove,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: buttonFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showGeofenceOptions(BuildContext context, GeofenceModel model, String address) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  context.locale.geofences_detail,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              EditName(
                label: address,
                value: model.name ?? '',
                leadingIcon: 'pin_select.svg',
                shapeBorder: Border.all(color: const Color.fromRGBO(224, 224, 224, 1)),
                controller: editNameController,
                onSave: (newName) {
                  final updatedModel = model.copyWith(name: newName);
                  context.read<GeofenceCubit>().editGeofence(updatedModel, context);
                  Navigator.pop(context);
                },
                editlabel: context.locale.geofence_name_label,
              ),
              _dividerBlock(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _sectionWithText(
                  title: context.locale.geofence_description_title,
                  subtitle: model.description ?? context.locale.geofence_description_subtitle,
                ),
              ),
              _dividerBlock(),
              // AssignVehiclesTile(
              //   onSelectionChanged: (List<String> selectedIds) {},
              // ),
              // _dividerBlock(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ElevatedButton(
                  onPressed: () => _showDeleteConfirmation(context, model),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.removeBtnBg,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/vehicle_geofence/remove.svg'),
                      const SizedBox(width: 7),
                      Text(
                        context.locale.remove_geofence_button,
                        style:
                            const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.removeBtnText),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  Future<void> updateMileage(GeofenceModel model) async {
    final name = editNameController.text.trim();
    context.read<GeofenceCubit>().editGeofence(GeofenceModel(name: name), context);
  }

  Widget _dividerBlock() {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.dividerBg,
        border: Border(
          top: BorderSide(width: 1, color: AppColors.dividerLight),
          bottom: BorderSide(width: 1, color: AppColors.dividerLight),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: widget.controller,
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.handleBar,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Row(
                    children: [
                      Text(
                        context.locale.geofences,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.titleText,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          await RouteHelper.pushAddGeofenceRoute(
                            GeofenceRouteParams(vehicleId: widget.vehicleId),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/vehicle_geofence/add.svg',
                          height: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      )
                    ],
                  ),
                ),
                BlocBuilder<GeofenceCubit, GeofenceState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: (message) => SizedBox(
                        height: MediaQuery.of(context).size.height * .4,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return const ShimmerListTile();
                          },
                        ),
                      ),
                      idle: (list) {
                        log('geofence list length: ${list.length}');

                        if (list.isEmpty) {
                          return const NoDataWidget(
                            subtitle: 'No geofences available. Tap the + icon to add one.',
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final model = list[index];
                            final isSelected = model.id.toString() == _selectedGeofenceId;

                            return _buildGeofenceTile(
                              context,
                              model,
                              isSelected,
                            );
                          },
                        );
                      },
                      error: (msg) => ErrorWidget(msg),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sectionWithText({
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.titleText)),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(subtitle,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.subtitleText)),
      ),
      trailing: trailing != null ? GestureDetector(onTap: onTap, child: trailing) : null,
      onTap: onTap,
    );
  }

  Widget _buildGeofenceTile(
    BuildContext context,
    GeofenceModel model,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? AppColors.selectedTileBackground : null,
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.selectedIconBackground : AppColors.leadingIconBg,
          ),
          child: SvgPicture.asset(
            'assets/icons/vehicle_geofence/pin.svg',
            color: isSelected ? Colors.white : null,
            height: isSelected ? 22 : 18,
          ),
        ),
        title: Text(
          model.name ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: AppColors.titleText,
          ),
        ),
        subtitle: Text(
          model.attributes != null &&
                  model.attributes!['address'] != null &&
                  model.attributes!['address'].toString().isNotEmpty
              ? model.attributes!['address'].toString()
              : 'No address',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.subtitleText),
        ),
        trailing: SizedBox(
          width: 75,
          child: Row(
            children: [
              Checkbox.adaptive(
                value: model.isSelected,
                onChanged: (value) {
                  if (value != null) {
                    context.read<GeofenceCubit>().toggleFenceSelection(model, context);
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  _showGeofenceOptions(
                    context,
                    model,
                    model.attributes != null &&
                            model.attributes!['address'] != null &&
                            model.attributes!['address'].toString().isNotEmpty
                        ? model.attributes!['address'].toString()
                        : 'No address',
                  );
                },
                child: SvgPicture.asset('assets/icons/geofence_info.svg'),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onTap: () => _handleSelection(model),
      ),
    );
  }
}

class ShimmerListTile extends StatelessWidget {
  final double heightFactor; // fraction of screen width for title
  final double subtitleFactor; // fraction of screen width for subtitle
  final double leadingSize; // size of the leading circle
  final double borderWidth; // circle border width

  const ShimmerListTile({
    super.key,
    this.heightFactor = 0.5,
    this.subtitleFactor = 0.3,
    this.leadingSize = 40,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leading circle with border
            Container(
              width: leadingSize,
              height: leadingSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade400, // subtle border color
                  width: borderWidth,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Title & subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Container(
                    width: screenWidth * heightFactor,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Subtitle
                  Container(
                    width: screenWidth * subtitleFactor,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
