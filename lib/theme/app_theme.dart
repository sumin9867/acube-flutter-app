import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpspro/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    primaryColor: AppColors.primaryColor,
    splashColor: Colors.white,
    highlightColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
      shadow: Colors.grey.shade400,
    ),
    textTheme: _buildLightTextTheme,
    scaffoldBackgroundColor: Colors.white,
  );
}

TextTheme get _buildLightTextTheme {
  return GoogleFonts.montserratTextTheme().apply(
    fontSizeFactor: 1.0,
    bodyColor: AppColors.textColor,
    displayColor: Colors.black,
    fontFamily: 'SF Pro',
  );
}
