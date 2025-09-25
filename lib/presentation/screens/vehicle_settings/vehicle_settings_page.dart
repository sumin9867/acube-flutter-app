import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/core/utils/validators/form_validator.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/gen/l10n/l10n.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/repository/i_device_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:gpspro/presentation/screens/vehicle_settings/widget/editable_widget.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:intl/intl.dart';

class VehicleSettingsPage extends StatefulWidget {
  const VehicleSettingsPage({super.key, required this.vehicle});

  final Device vehicle;

  @override
  State<VehicleSettingsPage> createState() => _VehicleSettingsPageState();
}

class _VehicleSettingsPageState extends State<VehicleSettingsPage> {
  late final TextEditingController nameController;
  late final TextEditingController speedController;
  final TextEditingController mileageController = TextEditingController();

  final webSocketCubit = locator.get<WebsocketCubit>();
  late Device vehicle;

  bool isNameEditable = false;
  bool isSpeedEditable = false;
  bool isMileageEditable = false;

  @override
  void initState() {
    super.initState();

    webSocketCubit.disconnect();
    vehicle = widget.vehicle;
    nameController = TextEditingController(text: vehicle.name);
    speedController = TextEditingController();
    fetchMileage();
  }

  @override
  void dispose() {
    webSocketCubit.reconnect();
    nameController.dispose();
    speedController.dispose();
    mileageController.dispose();
    super.dispose();
  }

  Future<void> fetchMileage() async {
    try {
      final mileage = await locator.get<DeviceRepo>().getMileage(vehicle.id.toString());
      setState(() {
        mileageController.text = mileage;
      });
    } catch (e) {
      log('Error fetching mileage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.vehicle;
    log('I am data ${data.position?.attributes?.totalDistance}');
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          authenticated: (user) {
            return Scaffold(
              backgroundColor: const Color(0xFFFAF9FB),
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                title: Text(
                  context.locale.vehicleSetting,
                  style:
                      const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color.fromRGBO(24, 24, 24, 1)),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: vehicleImageSection(context, user)),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10),
                      child: Text(
                        context.locale.basicInformation,
                        style: const TextStyle(
                            color: Color.fromRGBO(101, 99, 109, 1), fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    EditableField(
                      canedit: !user.readonly!,
                      controller: nameController,
                      validator: FormValidator.vehicleNameValidator,
                      shapeBorder: const Border(
                        top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                      ),
                      label: context.locale.vehicleName,
                      value: vehicle.name,
                      leadingIcon: 'vehicle_name.svg',
                      onSave: (newValue) {
                        updateVehicleName();
                      },
                    ),
                    EditableField(
                      canedit: false,
                      shapeBorder: const Border(
                        top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                        bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                      ),
                      label: context.locale.expirationDate,
                      value: data.expirationTime != null
                          ? DateFormat('d MMM, yyyy').format(data.expirationTime!)
                          : context.locale.nA,
                      leadingIcon: 'expiration_date.svg',
                      onSave: (newValue) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 10, top: 20),
                      child: Text(
                        // Replace with localized string
                        context.locale.usageParameters,
                        style: const TextStyle(
                          color: Color.fromRGBO(101, 99, 109, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    EditableField(
                      canedit: false,
                      shapeBorder: const Border(
                        top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                      ),
                      label: context.locale.vehicleOdometerReading,
                      value: '${((data.position?.attributes?.totalDistance ?? 0) / 1000).toStringAsFixed(1)} Km',
                      leadingIcon: 'odometer.svg',
                      onSave: (newValue) {},
                    ),
                    EditableField(
                      canedit: !user.readonly!,
                      controller: mileageController,
                      shapeBorder: const Border(
                        top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                      ),
                      label: context.locale.expectedMileage,
                      value: mileageController.text.isEmpty ? context.locale.nA : mileageController.text,
                      leadingIcon: 'milage.svg',
                      onSave: (newValue) {
                        updateMileage();
                      },
                    ),
                    EditableField(
                      canedit: !user.readonly!,
                      controller: speedController,
                      shapeBorder: const Border(
                        top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                        bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                      ),
                      label: context.locale.speedLimit,
                      value: speedLimitDisplay(),
                      leadingIcon: 'speed.svg',
                      onSave: (newValue) {
                        updateSpeedLimit();
                      },
                    ),
                    SizedBox(
                      height: Platform.isIOS ? 40 : 30,
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget vehicleImageSection(BuildContext context, User user) {
    final imageSize = MediaQuery.of(context).size.height * 0.12;

    return SizedBox(
      height: imageSize * 1.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: imageSize,
            width: imageSize,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromRGBO(241, 241, 241, 1),
                width: 1,
              ),
            ),
            child: ClipOval(
              child: AppHelper.getVehicleImage(vehicle).image(
                fit: BoxFit.contain,
                height: imageSize,
                width: imageSize,
              ),
            ),
          ),
          if (!user.readonly!)
            PositionedDirectional(
              bottom: 5,
              child: GestureDetector(
                onTap: () {
                  VehicleType? vehicleTypeFromString(String category) {
                    try {
                      return VehicleType.values.firstWhere(
                        (v) => v.name.toLowerCase() == category.toLowerCase(),
                      );
                    } catch (_) {
                      return null;
                    }
                  }

                  VehicleType? selectedVehicle = vehicleTypeFromString(vehicle.category ?? 'car') ?? VehicleType.car;

                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setModalState) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      context.locale.change,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(24, 24, 24, 1),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: SvgPicture.asset('assets/icons/vehicle_setting/close_button.svg'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: VehicleType.values.length,
                                  itemBuilder: (context, index) {
                                    final vehicleType = VehicleType.values[index];
                                    final isSelected = selectedVehicle == vehicleType;

                                    return GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          selectedVehicle = vehicleType;
                                        });
                                      },
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          side: isSelected
                                              ? const BorderSide(color: Color.fromRGBO(0, 145, 255, 1), width: 2)
                                              : BorderSide.none,
                                        ),
                                        color: isSelected
                                            ? const Color.fromRGBO(2, 128, 255, 0.07)
                                            : const Color.fromRGBO(241, 241, 241, 1),
                                        child: getVehicleImage(vehicleType),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 16),
                                height: 10,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 1, color: Color.fromRGBO(241, 241, 241, 1)),
                                    top: BorderSide(width: 1, color: Color.fromRGBO(241, 241, 241, 1)),
                                  ),
                                  color: Color.fromRGBO(249, 249, 249, 1),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: Platform.isIOS ? 30 : 20),
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final String vehicleCategoryString = selectedVehicle.toString().split('.').last;

                                    await updateVehicleAttributes(
                                      category: vehicleCategoryString,
                                      changeType: 'image',
                                      speedLimit: double.tryParse(vehicle.attributes!.speedLimit ?? ''),
                                    );

                                    setState(() {
                                      vehicle = vehicle.copyWith(category: vehicleCategoryString);
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                  child: Text(
                                    context.locale.updateIcon,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color.fromRGBO(235, 235, 235, 1),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(31, 128, 127, 127),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, size: 16, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 6),
                      Text(
                        context.locale.change,
                        style: const TextStyle(
                          color: Color.fromRGBO(24, 24, 24, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget getVehicleImage(VehicleType vehicle) {
    log('Selected vehicle type: $vehicle');
    switch (vehicle) {
      case VehicleType.motorcycle:
        return Assets.images.devices.bike.bikeSide.image(height: 50, width: 50);
      case VehicleType.car:
        return Assets.images.devices.car.carSide.image(height: 50, width: 50);
      case VehicleType.scooter:
        return Assets.images.devices.scooter.scSide.image(height: 50, width: 50);
      case VehicleType.van:
        return Assets.images.devices.van.vanSide.image(height: 50, width: 50);
      case VehicleType.ambulance:
        return Assets.images.devices.ambulance.ambulanceSide.image(height: 50, width: 50);
      case VehicleType.cycle:
        return Assets.images.devices.bicycle.cycleSide.image(height: 50, width: 50);
      case VehicleType.fire:
        return Assets.images.devices.fire.fireSide.image(height: 50, width: 50);
      case VehicleType.schoolBus:
        return Assets.images.devices.schoolBus.schoolSide.image(height: 50, width: 50);
      case VehicleType.truck:
        return Assets.images.devices.truck.truckSide.image(height: 50, width: 50);
      case VehicleType.pickup:
        return Assets.images.devices.pickupVan.pickupSide.image(height: 50, width: 50);
      case VehicleType.safari:
        return Assets.images.devices.safari.safariSide.image(height: 50, width: 50);
      case VehicleType.jcb:
        return Assets.images.devices.jcb.jcbSide.image(height: 50, width: 50);
      case VehicleType.bus:
        return Assets.images.devices.bus.busSide.image(height: 50, width: 50);

      case VehicleType.tempo:
        return Assets.images.devices.tempo.tempoSide.image(height: 50, width: 50);
      case VehicleType.tractor:
        return Assets.images.devices.trpp.trppSide.image(height: 50, width: 50);
      case VehicleType.rmc:
        return Assets.images.devices.rmc.rmcSide.image(height: 50, width: 50);
    }
  }

  Widget buildEditableField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required bool isEditable,
    required String value,
    required FormFieldValidator<String> validator,
    required TextInputType keyboardType,
    required VoidCallback onEditToggle,
    required VoidCallback onConfirm,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: isEditable
                ? GenericTextfield(
                    controller: controller,
                    label: label,
                    hintText: hintText,
                    textInputAction: TextInputAction.done,
                    validator: validator,
                    keyboardType: keyboardType,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppText(
                        label,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                      const SizedBox(height: 12),
                      AppText(value, style: context.textTheme.bodyLarge),
                    ],
                  ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              IconButton.filledTonal(
                onPressed: onEditToggle,
                color: isEditable ? AppColors.red : AppColors.primaryColor,
                icon: Icon(isEditable ? Icons.close : Icons.edit),
              ),
              if (isEditable)
                IconButton.filledTonal(
                  onPressed: onConfirm,
                  color: AppColors.green,
                  icon: const Icon(Icons.check),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String speedLimitDisplay() {
    final speedLimitStr = vehicle.attributes?.speedLimit ?? '';
    log('I am speed $speedLimitStr');
    final speedKnots = double.tryParse(speedLimitStr);
    if (speedKnots == null || speedKnots == 0.0) return 'N/A';
    return '${(speedKnots * 1.852).round()} km/h';
  }

  void prepareSpeedEdit() {
    setState(() {
      isSpeedEditable = !isSpeedEditable;
      if (isSpeedEditable) {
        final speedKnots = double.tryParse(vehicle.attributes?.speedLimit ?? '') ?? 0;
        final speedKmh = speedKnots * 1.852;
        speedController.text = speedKmh.toStringAsFixed(2);
      }
    });
  }

  Future<void> updateVehicleName() async {
    final newName = nameController.text.trim();
    if (newName.isEmpty) return AppToast.showError(message: context.locale.vehicleNameEmpty, context: context);
    if (newName == vehicle.name) {
      return AppToast.showError(message: context.locale.vehicleNameUnchanged, context: context);
    }
    await updateVehicleAttributes(
        name: newName, speedLimit: double.tryParse(vehicle.attributes!.speedLimit ?? ''), changeType: 'name');
    setState(() => isNameEditable = false);
  }

  Future<void> updateSpeedLimit() async {
    final speedKmh = double.tryParse(speedController.text.trim());
    const minSpeedKnots = 10.8;

    if (speedKmh == null) {
      await updateVehicleAttributes(speedLimit: 0.0, changeType: 'speed');
    } else {
      final speedKnots = speedKmh / 1.852;
      if (speedKnots <= minSpeedKnots) {
        return AppToast.showError(message: context.locale.speedMustBeGreaterThan, context: context);
      }
      final currentKnots = double.tryParse(vehicle.attributes?.speedLimit ?? '') ?? 0;
      if (speedKnots != currentKnots) await updateVehicleAttributes(speedLimit: speedKnots, changeType: 'speed');
    }
    setState(() => isSpeedEditable = false);
  }

  Future<void> updateMileage() async {
    final mileageText = mileageController.text.trim();
    try {
      final mileage = int.tryParse(mileageText);
      if (mileage == null || mileage == 0) {
        await setVehicleMileage(vehicle.id.toString(), '');
      } else {
        await setVehicleMileage(vehicle.id.toString(), mileage.toString());
      }
      setState(() => isMileageEditable = false);
    } catch (e) {
      log('Invalid mileage value: $e');
    }
  }

  Future<void> setVehicleMileage(String deviceId, String mileage) async {
    try {
      showLoadingDialog(context, 'Setting Mileage', false);
      final success = await locator.get<DeviceRepo>().updateMileage(deviceId, mileage);
      dismissLoadingDialog(context);

      success
          ? AppToast.showSuccess(message: context.locale.mileageSetSuccess, context: context)
          : AppToast.showError(message: context.locale.mileageSetFailed, context: context);
    } catch (e, stack) {
      dismissLoadingDialog(context);

      debugPrint('Error setting mileage: $e');
      debugPrintStack(stackTrace: stack);
      AppToast.showError(message: S.current.somethingWentWrong, context: context);
    } finally {
      dismissLoadingDialog(context);
    }
  }

  Future<void> updateVehicleAttributes({
    String? name,
    double? speedLimit,
    String? category,
    required String changeType,
  }) async {
    try {
      showLoadingDialog(context, 'Updating..', false);

      final updatedAttributes = {
        if (speedLimit != null && speedLimit != 0.0) 'speedLimit': '$speedLimit',
      };

      final updatedDevice = DeviceCustomName(
        contact: vehicle.contact,
        expirationTime: vehicle.expirationTime,
        groupId: vehicle.groupId,
        lastUpdate: DateTime.now(),
        model: vehicle.model,
        phone: vehicle.phone,
        positionId: vehicle.positionId,
        id: vehicle.id,
        name: name ?? vehicle.name,
        uniqueId: vehicle.uniqueId,
        category: category ?? vehicle.category,
        attributes: updatedAttributes,
      );

      final response = await locator.get<DeviceRepo>().updateDevice(updatedDevice);

      if (response.statusCode == 200) {
        // Update local copy
        vehicle = vehicle.copyWith(
          name: name ?? vehicle.name,
          category: category ?? vehicle.category,
          attributes: vehicle.attributes?.copyWith(
            speedLimit: speedLimit?.toString() ?? vehicle.attributes?.speedLimit,
          ),
        );
        locator.get<MyDevicesCubit>().updateDevice(vehicle);

        // 🟢 Show specific success message
        switch (changeType) {
          case 'name':
            dismissLoadingDialog(context);

            AppToast.showSuccess(message: context.locale.vehicleNameUpdateSuccess, context: context);
            break;
          case 'speed':
            dismissLoadingDialog(context);

            AppToast.showSuccess(
              message: context.locale.speedLimitUpdated,
              context: context,
            );
            break;
          case 'image':
            dismissLoadingDialog(context);

            AppToast.showSuccess(message: context.locale.vehicleIconUpdated, context: context);
            break;
          case 'category':
            dismissLoadingDialog(context);

            AppToast.showSuccess(message: context.locale.vehicleCategoryUpdated, context: context);
            break;
          default:
            dismissLoadingDialog(context);

            AppToast.showSuccess(message: context.locale.vehicleAttributesUpdated, context: context);
        }
      } else {
        AppToast.showError(message: context.locale.updateVehicleAttributesFailed, context: context);
      }
    } catch (e, stack) {
      dismissLoadingDialog(context);
      debugPrint('Error updating vehicle attributes: $e');
      debugPrintStack(stackTrace: stack);
      AppToast.showError(message: S.current.somethingWentWrong, context: context);
    } finally {
      dismissLoadingDialog(context);
    }
  }
}
