import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.grey4,

    // --- Color Scheme ---
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.brandMain,
      onPrimary: AppColors.white,
      secondary: AppColors.brandPoint,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.error,
      onError: AppColors.white,
      outline: AppColors.grey2,
    ),

    // --- AppBar Theme ---
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
      titleTextStyle: AppTextStyles.titlePrimary20w600.copyWith(
        color: AppColors.black,
      ),
      iconTheme: IconThemeData(color: AppColors.grey1),
      centerTitle: true,
    ),

    // --- Button Theme (ElevatedButton) ---
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brandMain,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.grey2,
        disabledForegroundColor: AppColors.white,
        minimumSize: const Size(double.infinity, 52),
        textStyle: AppTextStyles.bodyPrimary16w600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ).copyWith(elevation: WidgetStateProperty.all(0)),
    ),

    // --- Input Decoration ---
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: AppTextStyles.bodySecondary14w500,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey2),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.brandMain, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );
}
