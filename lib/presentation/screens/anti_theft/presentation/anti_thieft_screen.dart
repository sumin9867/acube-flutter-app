import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/screens/anti_theft/cubit/vehicle_anti_theft_cubit.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AntiTheftScreen extends StatefulWidget {
  final Device device;

  const AntiTheftScreen({super.key, required this.device});

  @override
  State<AntiTheftScreen> createState() => _AntiTheftScreenState();
}

class _AntiTheftScreenState extends State<AntiTheftScreen> {
  int currentStep = 0;
  final List<TextEditingController> _phoneControllers = [TextEditingController()];
  bool isSosSetupComplete = false;

  final List<Map<String, dynamic>> steps = [
    {
      'title': 'Set Your SOS Numbers',
      'subtitle': 'Add at least 1 phone number to receive anti-theft alerts.',
      'buttonText': 'Next',
    },
    {
      'title': 'Activate Anti-Theft',
      'subtitle': 'Your vehicle will now be monitored for unauthorized use.',
      'buttonText': 'Activate Anti-Theft',
    },
  ];

  Future<void> _bootstrapFlow() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNumbers = prefs.getString('sos-${widget.device.id}');
    if (savedNumbers != null && savedNumbers.trim().isNotEmpty) {
      final parts = savedNumbers.split(',').where((e) => e.trim().isNotEmpty).toList();
      if (parts.isNotEmpty) {
        while (_phoneControllers.length < parts.length && _phoneControllers.length < 3) {
          _phoneControllers.add(TextEditingController());
        }
        for (var i = 0; i < parts.length && i < _phoneControllers.length; i++) {
          _phoneControllers[i].text = parts[i];
        }
      }

      return;
    }

    final deviceId = widget.device.id.toString();

    showSosNumbersDialog(context, deviceId);
  }

  void _nextStep(VehicleAntiTheftCubit cubit) {
    if (currentStep == 0) {
      final numbers = _phoneControllers.map((e) => e.text).where((e) => e.isNotEmpty).toList();
      if (numbers.isEmpty) {
        AppToast.showError(context: context, message: 'Please enter at least 1 phone number');
        return;
      }
      cubit.setSosNumbers(numbers, widget.device.id.toString());
    } else if (currentStep == 1) {
      cubit.activateAntiTheft(widget.device.id.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<VehicleAntiTheftCubit>().initialize(widget.device);
    // _bootstrapFlow();
  }

  @override
  void dispose() {
    for (var ctrl in _phoneControllers) {
      ctrl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleAntiTheftCubit, VehicleAntiTheftState>(
      listener: (context, state) {
        log('Anti-Theft State: $state');
        state.maybeWhen(
          activateVehicle: (msg) {
            setState(() {
              isSosSetupComplete = true;
              currentStep = 1;
            });
            AppToast.showSuccess(context: context, message: msg);
          },
          deactivateVehicle: (msg) {
            AppToast.showSuccess(context: context, message: msg);
          },
          error: (msg) {
            AppToast.showError(context: context, message: msg);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Anti-Theft Setup',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.customGray,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF1F1F1),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    steps[currentStep]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF181818),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    steps[currentStep]['subtitle'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  ),
                  const SizedBox(height: 14),
                  if (!isSosSetupComplete && currentStep == 0)
                    Column(
                      children: [
                        ..._phoneControllers.map(
                          (ctrl) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: GenericTextfieldNew(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter SOS number';
                                }
                                if (value.trim().length != 10) {
                                  return 'SOS number must be 10 digits';
                                }
                                if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
                                  return 'Enter a valid phone number';
                                }
                                return null;
                              },
                              label: 'SOS Number',
                              hintText: '',
                              controller: ctrl,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Color.fromRGBO(241, 241, 241, 1)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            icon: const Icon(Icons.add_circle_outline, color: Color.fromRGBO(24, 24, 24, 1)),
                            label: const Text(
                              'Add more SOS number',
                              style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1)),
                            ),
                            onPressed: () {
                              if (_phoneControllers.length < 3) {
                                setState(() => _phoneControllers.add(TextEditingController()));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Color.fromRGBO(241, 241, 241, 1)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            icon: const Icon(Icons.add_circle_outline, color: Color.fromRGBO(24, 24, 24, 1)),
                            label: const Text(
                              'Check Number',
                              style: TextStyle(color: Color.fromRGBO(24, 24, 24, 1)),
                            ),
                            onPressed: () {
                              final deviceId = widget.device.id.toString();

                              showSosNumbersDialog(context, deviceId);
                            },
                          ),
                        )
                      ],
                    ),
                  if (isSosSetupComplete || currentStep == 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              return showDialogAntiTheft(context, false, widget.device.id.toString());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(41, 151, 100, 1),
                              shadowColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/engine_unlock.svg',
                                  height: 20,
                                  width: 20,
                                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Activate',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SF Pro',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              return showDialogAntiTheft(context, true, widget.device.id.toString());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(217, 61, 66, 1),
                              shadowColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/engine_lock.svg',
                                  height: 20,
                                  width: 20,
                                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Deactivate',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SF Pro',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  if (!isSosSetupComplete && currentStep == 0)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _nextStep(context.read<VehicleAntiTheftCubit>()),
                        child: Text(
                          steps[currentStep]['buttonText'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void showDialogAntiTheft(BuildContext context, bool isActivated, String deviceID) {
  showDialog(
    context: context,
    builder: (context) {
      final title = isActivated ? 'Deactivate Anti-Theft?' : 'Activate Anti-Theft?';
      final description = isActivated
          ? 'Are you sure you want to deactivate Anti-Theft mode for this device?'
          : 'Are you sure you want to activate Anti-Theft mode for this device?';
      final confirmText = isActivated ? 'Deactivate' : 'Activate';

      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isActivated ? const Color.fromRGBO(255, 1, 1, 0.06) : const Color.fromARGB(15, 60, 255, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: SvgPicture.asset(
                  'assets/icons/logout.svg',
                  height: 24,
                  color: isActivated ? const Color.fromRGBO(229, 72, 77, 1) : const Color.fromRGBO(41, 151, 100, 1),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 24 / 18,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(24, 24, 24, 1),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  height: 24 / 16,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(100, 100, 100, 1),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        context.locale.cancel,
                        style: const TextStyle(
                          color: Color.fromRGBO(24, 24, 24, 1),
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (isActivated) {
                          context.read<VehicleAntiTheftCubit>().deactivateAntiTheft(deviceID);
                        } else {
                          context.read<VehicleAntiTheftCubit>().activateAntiTheft(deviceID);
                        }
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isActivated ? const Color.fromRGBO(229, 72, 77, 1) : const Color.fromRGBO(41, 151, 100, 1),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        confirmText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showSosNumbersDialog(BuildContext context, String deviceId) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return BlocBuilder<VehicleAntiTheftCubit, VehicleAntiTheftState>(
        builder: (context, state) {
          final String title = 'Checking SOS Numbers';
          final Widget content = const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                CircularProgressIndicator(strokeWidth: 2),
                SizedBox(width: 12),
                Expanded(child: Text('Please wait up to 2 minutes...')),
              ],
            ),
          );

          state.maybeWhen(
            // sosNumbersLoaded: (deviceId, numbers) {
            //   title = 'SOS Numbers';
            //   content = Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const SizedBox(height: 8),
            //       ...numbers.map((n) => Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 4),
            //             child: Text(n),
            //           )),
            //     ],
            //   );
            // },
            // sosNumbersEmpty: (deviceId) {
            //   title = 'No SOS Numbers';
            //   content = const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 8),
            //     child: Text('No SOS numbers were found for this device.'),
            //   );
            // },
            orElse: () {},
          );

          return AlertDialog(
            title: Text(title),
            content: content,
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    },
  );
}
