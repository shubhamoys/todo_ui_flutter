import 'package:flutter/material.dart';
import 'package:todo_ui_flutter/core/theme/typography/app_text_theme.dart';
import 'colors/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.darkTextPrimary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: 'Poppins',
      ),
      iconTheme: IconThemeData(
        color: AppColors.darkTextPrimary,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.lightSurface, // Default background color
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
      actionTextColor: AppColors.primary, // Action button color
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.lightTextPrimary,
      ),
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.lightTextSecondary,
      ),
      // Style for the input text itself
      floatingLabelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextPrimary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightSurface,
      onPrimary: AppColors.darkTextPrimary,
      onSecondary: AppColors.darkTextPrimary,
      onSurface: AppColors.lightTextPrimary,
      error: AppColors.error,
      onError: AppColors.darkTextPrimary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.darkTextPrimary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: 'Poppins',
      ),
      iconTheme: IconThemeData(
        color: AppColors.darkTextPrimary,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkSurface, // Default background color
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
      actionTextColor: AppColors.primary, // Action button color
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.darkTextPrimary,
      ),
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.darkTextSecondary,
      ),
      floatingLabelStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkSurface,
      onPrimary: AppColors.darkTextPrimary,
      onSecondary: AppColors.darkTextPrimary,
      onSurface: AppColors.darkTextPrimary,
      error: AppColors.error,
      onError: AppColors.darkTextPrimary,
    ),
  );
}
