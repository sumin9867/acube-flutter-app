// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = createMaterialColor(const Color(0xff126cc0));
  static Color newPrimaryColor = createMaterialColor(const Color.fromRGBO(8, 128, 234, 1));
  static Color newDangerColor = createMaterialColor(const Color.fromRGBO(217, 61, 66, 1));
  static Color newTextColor = createMaterialColor(const Color.fromRGBO(24, 24, 24, 1));

  static const texnewButtonColor = Color(0xFF242424);

  static const textColor = Color(0xFF242424);

  static const neutral3 = Color(0xFFBBBBBB);
  static const lightGreyText = Color(0xFF666666);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0x00000000);

  static const red = Color(0xFFE53935);
  static const green = Color(0xFF13CF13);
  static const yellow = Color(0xFFFFEB3B);
  static const warning = Color(0xFFffcc00);
  static const customGray = Color(0xFF787680);
  static const softOffWhite = Color(0xFFFAF9FB);
  static const dangerBg = Color(0xFFE5484D);

  static const warningbg = Color(0xFFE5484D);

  static const filterbg = Color(0xFFF6F2FA);
  static const newUIprimaryColor = Color(0xFF126CC0);
  static const deviceListBg = Color(0xFFFAF9FB);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFF1F1F1);
  static const Color iconColor = Color(0xFF808080);
  static const Color valueTextColor = Color(0xFF181818);
  static const Color labelTextColor = Color(0xFF646464);
  static const Color background = Color(0xFFFAF9FB);
  static const Color sectionTitle = Color.fromRGBO(100, 100, 100, 1);
  static const Color headerTitle = Color.fromRGBO(82, 81, 81, 1);
  static const newbackground = Color(0xFFF9F9F9);
  static const success = Color(0xFF029A3A);
  static const successLight = Color(0x1A02BA3C);
  static const error = Color(0xFFD93D42);
  static const errorLight = Color(0x0FFF0101);
  static const newwarning = Color(0xFFF76808);
  static const warningLight = Color(0x2BFF9101);
  static const darkText = Color(0xFF181818);
  static const greyText = Color(0xFF646464);
  static const mutedText = Color(0xFF8D8D8D);

  static const Color handleBar = Color.fromRGBO(28, 0, 55, 0.11);
  static const Color titleText = Color.fromRGBO(24, 24, 24, 1);
  static const Color leadingIconBg = Color.fromRGBO(2, 128, 255, 0.07);
  static const Color subtitleText = Color.fromRGBO(100, 100, 100, 0.8);

  static const Color selectedTileBackground = Color.fromRGBO(249, 249, 249, 1);
  static const Color selectedIconBackground = Color.fromRGBO(8, 128, 234, 1);
  // Divider
  static const Color dividerBg = Color(0xFFF9F9F9);
  static const Color dividerLight = Color(0xFFF1F1F1);

  // Remove geofence button
  static const Color removeBtnBg = Color.fromARGB(255, 253, 242, 242); // Light pink
  static const Color removeBtnText = Color(0xFFD93D42); // Red text
  static const Color deleteIconBg = Color(0xFFFFEFEF); // Light red circle behind trash icon
}

MaterialColor createMaterialColor(Color color) {
  final List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
