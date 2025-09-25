import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/core/utils/validators/form_validator.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';
import 'package:gpspro/presentation/screens/add_vehicle/cubit/add_vehicle_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class IMEIStep extends StatefulWidget {
  const IMEIStep({
    super.key,
    required this.uidcontroller,
  });

  final TextEditingController uidcontroller;

  @override
  State<IMEIStep> createState() => _IMEIStepState();
}

class _IMEIStepState extends State<IMEIStep> {
  String _scanBarcode = 'Unknown';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final GlobalKey<FormState> imeiStepformKey = GlobalKey<FormState>();
  bool hasScanned = false;
  bool _cameraPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    try {
      final status = await Permission.camera.status;
      if (status.isGranted) {
        setState(() {
          _cameraPermissionGranted = true;
        });
        return;
      }

      final result = await Permission.camera.request();
      if (result.isGranted && mounted) {
        setState(() {
          _cameraPermissionGranted = true;
        });
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.locale.cameraPermissionRequired),
            action: SnackBarAction(
              label: context.locale.openSettings,
              onPressed: () async {
                await openAppSettings();
              },
            ),
          ),
        );
      }
    } catch (e) {
      log('Camera permission error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.locale.cameraPermissionRequired),
          ),
        );
      }
    }
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    if (!mounted) return;

    controller!.scannedDataStream.listen((scanData) {
      if (!mounted || hasScanned) return;

      if (scanData.code == null || scanData.code!.isEmpty) {
        return;
      }

      // Validate if it looks like an IMEI (numeric and proper length)
      final code = scanData.code!;

      if (mounted) {
        AppToast.showError(context: context, message: 'No valid QR code found');
      }

      setState(() {
        _scanBarcode = code;
        widget.uidcontroller.text = _scanBarcode;
        hasScanned = true;
      });

      // Pause camera after successful scan
      controller?.pauseCamera();

      // Show success message
      if (mounted) {
        AppToast.showSuccess(context: context, message: 'Scan successful: $_scanBarcode');
      }
    }, onError: (error) {
      log('Error scanning: $error');
      if (mounted) {
        AppToast.showError(context: context, message: 'Scan error: $error');
      }
    });
  }

  void _resumeCamera() {
    if (controller != null) {
      controller?.resumeCamera();
      setState(() {
        hasScanned = false;
      });
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: _cameraPermissionGranted
                              ? Stack(
                                  children: [
                                    QRView(
                                      key: qrKey,
                                      onQRViewCreated: _onQRViewCreated,
                                      overlay: QrScannerOverlayShape(
                                        borderColor: Colors.white,
                                        borderRadius: 12,
                                        borderLength: 30,
                                        borderWidth: 6,
                                        cutOutSize: MediaQuery.of(context).size.width * 0.7,
                                      ),
                                    ),
                                    // Center(
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(top: 170),
                                    //     child: CustomPaint(
                                    //       size: const Size(300, 200),
                                    //       painter: RoundedCornerPainter(),
                                    //     ),
                                    //   ),
                                    // ),
                                    if (hasScanned)
                                      Positioned.fill(
                                        child: Container(
                                          color: Colors.black54,
                                          child: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                  size: 64,
                                                ),
                                                const SizedBox(height: 16),
                                                Text(
                                                  'Scan successful: $_scanBarcode',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 16),
                                                ElevatedButton(
                                                  onPressed: _resumeCamera,
                                                  child: const Text('Scan Again'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                )
                              : Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.camera_alt,
                                        size: 64,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        context.locale.cameraPermissionRequired,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: _requestPermission,
                                        child: const Text('Grant Permission'),
                                      ),
                                    ],
                                  ),
                                ),
                        )
                      ],
                    ),
                    Positioned(
                      top: kToolbarHeight - 10,
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: context.colorScheme.onPrimary,
                          size: 24,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: kToolbarHeight + 120,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          context.locale.scanDeviceIMEI,
                          style: const TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    context.locale.enterDeviceIMEI,
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Text(
                    context.locale.imeiInstructions,
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Form(
                    key: imeiStepformKey,
                    child: GenericTextfieldNew(
                      controller: widget.uidcontroller,
                      label: context.locale.imeiHint,
                      hintText: context.locale.imeiHint,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null && value.length > 16) {
                          return context.locale.imeiTooLong;
                        }
                        return FormValidator.vehicleIMEISNValidator(value);
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 12,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(241, 241, 241, 1),
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(241, 241, 241, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (imeiStepformKey.currentState!.validate()) {
                        context.read<AddVehicleCubit>().verifyImei(
                              widget.uidcontroller.text,
                              context,
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 52),
                      backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cornerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const bracketLength = 40.0;

    // top-left
    canvas.drawLine(const Offset(0, 0), const Offset(bracketLength, 0), cornerPaint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, bracketLength), cornerPaint);

    // top-right
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - bracketLength, 0), cornerPaint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, bracketLength), cornerPaint);

    // bottom-left
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - bracketLength), cornerPaint);
    canvas.drawLine(Offset(0, size.height), Offset(bracketLength, size.height), cornerPaint);

    // bottom-right
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - bracketLength), cornerPaint);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - bracketLength, size.height), cornerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
