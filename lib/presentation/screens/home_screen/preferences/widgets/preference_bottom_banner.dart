// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/core/utils/utils.dart';
import 'package:gpspro/presentation/screens/auth/sign_in/signin_screen.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PreferenceBottomBanner extends StatelessWidget {
  const PreferenceBottomBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TrackonNewLogo(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Version',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              FutureBuilder(
                  initialData: PackageInfo(
                    appName: 'Unknown',
                    packageName: 'Unknown',
                    version: 'N/A',
                    buildNumber: 'N/A',
                    buildSignature: 'Unknown',
                  ),
                  future: PackageInfo.fromPlatform(),
                  builder: (context, ss) {
                    final PackageInfo packageInfo = ss.data!;
                    return Text(
                      '${packageInfo.version}+${packageInfo.buildNumber}',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    );
                  }),
            ],
          ),
          const SizedBox(width: 4.0),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              launchURL('https://trackon-gps.com');
            },
            icon: _buildIcon(LineIcons.globe),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              launchURL('https://www.facebook.com/trackonnepal');
            },
            icon: _buildIcon(LineIcons.facebook),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              launchURL('https://twitter.com/trackonnepal?lang=en');
            },
            icon: _buildIcon(LineIcons.twitter),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              launchURL('https://www.instagram.com/trackonnepal/');
            },
            icon: _buildIcon(LineIcons.instagram),
          ),
        ],
      ),
    );
  }

  Icon _buildIcon(IconData icon) => Icon(icon, size: 30.0);
}
