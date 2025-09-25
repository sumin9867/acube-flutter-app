import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/screens/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:gpspro/presentation/screens/add_vehicle/steps/add_vehicle_step.dart';
import 'package:gpspro/presentation/screens/add_vehicle/steps/imei_step.dart';

class AddVehicleScreen extends StatefulWidget {
  final bool isFirstTime;
  const AddVehicleScreen({super.key, required this.isFirstTime});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final TextEditingController uidcontroller = TextEditingController();
  final TextEditingController vehicleNameController = TextEditingController();
  final TextEditingController registrationContoroller = TextEditingController();
  final TextEditingController vehicleSimComtroller = TextEditingController();
  final TextEditingController vehicleModelController = TextEditingController();

  final GlobalKey<FormState> imeiStepformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addStepformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> activateStepformKey = GlobalKey<FormState>();

  int vehicleType = VehicleType.car.index;

  @override
  void dispose() {
    uidcontroller.dispose();
    vehicleNameController.dispose();
    registrationContoroller.dispose();
    vehicleSimComtroller.dispose();
    vehicleModelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<AddVehicleCubit>(),
      child: Scaffold(
        body: BlocConsumer<AddVehicleCubit, AddVehicleState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: (message) {
                showLoadingDialog(context, message, false);
              },
              verified: (_) {
                dismissLoadingDialog(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddStep(
                    imei: uidcontroller.text,
                    registrationController: registrationContoroller,
                    vehicleNameController: vehicleNameController,
                    simNumberController: vehicleSimComtroller,
                    vehicleModelController: vehicleModelController,
                    onVehicleIconChanged: (deviceType) {
                      vehicleType = deviceType;
                    },
                    isFirstTime: widget.isFirstTime,
                  ),
                ));
              },
              success: (msg) {
                dismissLoadingDialog(context);
                AppToast.showSuccess(message: msg, context: context);
              },
              errorState: (msg) {
                dismissLoadingDialog(context);
                AppToast.showError(message: msg, context: context);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
                idle: (viewModel) {
                  return IMEIStep(uidcontroller: uidcontroller);
                },
                orElse: () => IMEIStep(uidcontroller: uidcontroller));
          },
        ),
      ),
    );
  }
}
