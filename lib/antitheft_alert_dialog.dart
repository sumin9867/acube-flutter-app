import 'package:audioplayers/audioplayers.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/presentation/global_widgets/app_button.dart';
import 'package:gpspro/router/router.dart';
import 'package:system_alert_window/system_alert_window.dart';

class AntiTheftAlertDialog extends StatefulWidget {
  const AntiTheftAlertDialog({super.key});

  @override
  State<AntiTheftAlertDialog> createState() => _AntiTheftAlertDialogState();
}

class _AntiTheftAlertDialogState extends State<AntiTheftAlertDialog> {
  bool update = false;
  final AudioPlayer advancedPlayer = AudioPlayer(playerId: 'alert');
  final AudioCache audioCache = AudioCache();
  SystemWindowPrefMode prefMode = SystemWindowPrefMode.OVERLAY;

  String? deviceName;

  @override
  void initState() {
    super.initState();
    SystemAlertWindow.overlayListener.listen((event) {
      AppLogger.debug(event.toString());
      if (event is String) {
        if (event == 'cancel_antitheft_alert') {
          _stopAlertSound();
        } else if (event.contains('show_antitheft_alert')) {
          playAlertSound();
          deviceName = event.replaceFirst('show_antitheft_alert:', '');
        }
      }
    });
  }

  Future<void> playAlertSound() async {
    try {
      final bytes = await (await audioCache
              .loadAsFile(Assets.mp3.beepWarning.replaceFirst('assets/', '')))
          .readAsBytes();
      advancedPlayer.setReleaseMode(ReleaseMode.loop);
      advancedPlayer.play(
        BytesSource(bytes),
      );
    } catch (e) {
      AppLogger.error('error on playing alert sound: $e');
    }
  }

  void _stopAlertSound() async {
    await advancedPlayer.stop();
  }

  @override
  void dispose() {
    SystemAlertWindow.disposeOverlayListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget okButton = SizedBox(
      height: 40,
      width: 110,
      child: AppButton.outlined(
        label: "It's me",
        onPressed: _stopAlertAndExitDialog,
      ),
    );
    final Widget closeButton = SizedBox(
      height: 40,
      width: 110,
      child: AppButton.filled(
        label: 'Secure',
        onPressed: () async {
          _stopAlertAndExitDialog();
          try {
            final result = await LaunchApp.openApp(
              androidPackageName: 'com.acube.gps',
              iosUrlScheme: 'pulsesecure://',
              openStore: false,
            );
            if (result == 1) {
              RouteHelper.pushAddVehiclePage();
            }
          } catch (e) {
            AppLogger.error('Error launching app: $e');
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: context.screenSize.height,
        width: context.screenSize.width,
        child: AlertDialog(
          elevation: 12,
          shadowColor: Colors.black,
          title: const Text('Anti-theft Alert!'),
          content: Text(
              'The device named $deviceName\nhas detected some suspicious activities of theft.'),
          actions: [
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: [okButton, closeButton],
            ),
          ],
        ),
      ),
    );
  }

  void _stopAlertAndExitDialog() {
    _stopAlertSound();
    SystemAlertWindow.closeSystemWindow(prefMode: prefMode);
  }
}
