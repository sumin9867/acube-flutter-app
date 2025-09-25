import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/core/utils/validators/form_validator.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/screens/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:gpspro/presentation/screens/add_vehicle/steps/activate_step.dart';
import 'package:gpspro/theme/app_colors.dart';

class AddStep extends StatefulWidget {
  final bool isFirstTime;

  AddStep({
    super.key,
    required this.vehicleNameController,
    required this.simNumberController,
    required this.vehicleModelController,
    required this.onVehicleIconChanged,
    required this.registrationController,
    required this.imei,
    required this.isFirstTime,
  });

  final TextEditingController vehicleNameController;
  final TextEditingController registrationController;
  final TextEditingController simNumberController;
  final TextEditingController vehicleModelController;
  final ValueChanged<int> onVehicleIconChanged;
  final String imei;
  int vehicleType = VehicleType.car.index;

  @override
  State<AddStep> createState() => _AddStepState();
}

class _AddStepState extends State<AddStep> {
  int deviceType = VehicleType.car.index;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onSelectVehicleIcon(int type) {
    setState(() => deviceType = type);
    widget.onVehicleIconChanged(deviceType);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddVehicleCubit, AddVehicleState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: (message) {
            showLoadingDialog(context, message, false);
          },
          success: (msg) {
            dismissLoadingDialog(context);

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ActivateStep(isFirstTime: widget.isFirstTime),
            ));
          },
          errorState: (msg) {
            dismissLoadingDialog(context);
            AppToast.showError(message: msg, context: context);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF), Color(0xFFF9F9F9)],
                ),
                border: Border(
                  top: BorderSide(
                    color: Color.fromRGBO(241, 241, 241, 1),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    log('I am pressed');

                    context.read<AddVehicleCubit>().addVehicle(
                          widget.vehicleNameController.text.trim(),
                          widget.simNumberController.text.trim(),
                          widget.registrationController.text.trim(),
                          widget.vehicleModelController.text.trim(),
                          widget.imei,
                          deviceType,
                          context,
                        );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      width: 1,
                      color: Color.fromRGBO(235, 235, 235, 1),
                    ),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  context.locale.continue_btn,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            context.locale.add_vehicle_information,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              height: 24 / 18,
              letterSpacing: -0.3,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    context.locale.basicInfo,
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 24 / 16,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                GenericTextfieldNew(
                  // autoValidate: AutovalidateMode.disabled,
                  label: context.locale.registrationNumber,
                  hintText: context.locale.enterRegistrationNumber,
                  controller: widget.registrationController,
                  validator: FormValidator.requiredField,
                ),
                const SizedBox(height: 24),
                GenericTextfieldNew(
                  // autoValidate: AutovalidateMode.disabled,
                  label: context.locale.vehicleName,
                  hintText: context.locale.enterVehicleName,
                  controller: widget.vehicleNameController,
                  validator: FormValidator.requiredField,
                ),
                const SizedBox(height: 24),
                GenericTextfieldNew(
                  // autoValidate: AutovalidateMode.disabled,
                  label: context.locale.simNumber,
                  hintText: context.locale.enterSimNumber,
                  controller: widget.simNumberController,
                  validator: FormValidator.requiredField,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),
                GenericTextfieldNew(
                  // autoValidate: AutovalidateMode.disabled,
                  label: context.locale.vehicleModel,
                  hintText: context.locale.enterVehicleModel,
                  controller: widget.vehicleModelController,
                  validator: FormValidator.requiredField,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppText(
                    context.locale.chooseVehicleIcon,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GridView.builder(
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
                    final vehicle = VehicleType.values[index];
                    final isSelected = deviceType == vehicle.index;

                    return GestureDetector(
                      onTap: () => onSelectVehicleIcon(vehicle.index),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1.5,
                            color: isSelected ? AppColors.newUIprimaryColor : Colors.transparent,
                          ),
                          color: isSelected
                              ? const Color.fromRGBO(2, 128, 255, 0.07)
                              : const Color.fromRGBO(241, 241, 241, 1),
                        ),
                        child: getVehicleImage(vehicle),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getVehicleImage(VehicleType vehicle) {
    switch (vehicle) {
      case VehicleType.motorcycle:
        return Assets.images.devices.bike.bikeSide.image();
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
        return Assets.images.devices.bus.busSide.image(height: 70, width: 70);
      case VehicleType.tempo:
        return Assets.images.devices.tempo.tempoSide.image(height: 50, width: 50);
      case VehicleType.tractor:
        return Assets.images.devices.trpp.trppSide.image(height: 50, width: 50);
      case VehicleType.rmc:
        return Assets.images.devices.rmc.rmcSide.image(height: 50, width: 50);
    }
  }
}
