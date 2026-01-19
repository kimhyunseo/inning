import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.white,

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
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
      titleTextStyle: AppTextStyles.titlePrimary20w600,
      centerTitle: true,
    ),

    // --- Button Theme (ElevatedButton) ---
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // 배경을 브랜드 메인 컬러(#4F76A8)로 설정
        backgroundColor: AppColors.brandMain,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.grey2,
        disabledForegroundColor: AppColors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 52), // 기본 버튼 높이
        textStyle: AppTextStyles.bodyPrimary16w600,
        // 보더 레디우스 서큘러를 4로 설정
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
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
