import 'package:flutter/material.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryColor,
    
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      surface: AppColors.secondaryColor,
      onPrimary: AppColors.black,
      onSecondary: AppColors.black,
      onSurface: AppColors.white,
    ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, // Makes app bar blend with the background
        foregroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Bernier',
          fontSize: 28.0,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: CircleBorder(),
      largeSizeConstraints: BoxConstraints(
        maxHeight: 70,
        maxWidth: 70,
        minHeight: 70,
        minWidth: 70,
      )
    )
  );
}