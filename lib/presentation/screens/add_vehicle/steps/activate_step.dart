import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/core/utils/utils.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/util/unorder.dart';
import 'package:restart_app/restart_app.dart';

class ActivateStep extends StatelessWidget {
  final bool isFirstTime;

  const ActivateStep({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: Text(
          context.locale.activate,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color.fromRGBO(24, 24, 24, 1)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Heading(text: context.locale.note),
            const SizedBox(height: 8),
            UnorderedList([
              context.locale.vehicleActivateStepNote1,
              context.locale.vehicleActivateStepNote2,
            ]),
            const SizedBox(height: 24),
            _Heading(text: context.locale.watchInstallationVideos),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _VideoCard(
                  title: context.locale.microInstallation,
                  url: 'https://www.youtube.com/watch?v=d_-pvfsAoWg&t=16s',
                ),
                _VideoCard(
                  title: context.locale.microPlusInstallation,
                  url: 'https://www.youtube.com/watch?v=1a80-wTWHPc&t=3s',
                ),
              ],
            ),
            const SizedBox(height: 40),
            _Heading(text: context.locale.afterInstallation),
            const SizedBox(height: 8),
            UnorderedList([
              context.locale.afterInstallationNote1,
              context.locale.afterInstallationNote2,
              context.locale.afterInstallationNote3,
            ]),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SignalInfo(
                  image: Assets.images.satellite.image(height: context.screenSize.height * 0.06),
                  topColor: Colors.yellow,
                  bottomColor: Colors.blue,
                ),
                _SignalInfo(
                  image: Assets.images.tower.image(height: context.screenSize.height * 0.06),
                  topColor: Colors.red,
                  bottomColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ElevatedButton(
                onPressed: () async {
                  AppToast.showSuccess(context: context, message: 'Vehicle added successfully!');

                  if (isFirstTime) {
                    Restart.restartApp();
                  } else {
                    context.pop();
                    context.pop();

                    context.pop();

                    context.pop();
                  }
                },
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(MediaQuery.of(context).size.width, 52)),
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.grey.shade400;
                      }
                      return const Color.fromRGBO(8, 128, 234, 1);
                    },
                  ),
                  elevation: WidgetStateProperty.all(0),
                  padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 18)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(width: 1, color: Color.fromRGBO(235, 235, 235, 1)),
                    ),
                  ),
                  shadowColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  context.locale.activate,
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
    );
  }
}

class _Heading extends StatelessWidget {
  final String text;
  const _Heading({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'SF Pro',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 1.5,
        letterSpacing: 0,
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
    );
  }
}

class _VideoCard extends StatelessWidget {
  final String title;
  final String url;

  const _VideoCard({
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchURL(url),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Assets.images.youtube.image(
                height: context.screenSize.height * 0.08,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignalInfo extends StatelessWidget {
  final Widget image;
  final Color topColor;
  final Color bottomColor;

  const _SignalInfo({
    required this.image,
    required this.topColor,
    required this.bottomColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        const SizedBox(width: 8),
        Column(
          children: [
            _buildIndicator(topColor),
            Text(
              context.locale.or,
              style: const TextStyle(fontSize: 7),
            ),
            _buildIndicator(bottomColor),
          ],
        )
      ],
    );
  }

  Container _buildIndicator(Color color) {
    return Container(
      width: 30,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
