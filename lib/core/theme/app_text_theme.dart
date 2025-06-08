import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: AppTypography.headline1.copyWith(
      color: AppColors.lightTextPrimary,
    ),
    headlineMedium: AppTypography.headline2.copyWith(
      color: AppColors.lightTextPrimary,
    ),
    headlineSmall: AppTypography.headline3.copyWith(
      color: AppColors.lightTextPrimary,
    ),
    bodyLarge: AppTypography.bodyText1.copyWith(
      color: AppColors.lightTextPrimary,
    ),
    bodyMedium: AppTypography.bodyText2.copyWith(
      color: AppColors.lightTextSecondary,
    ),
    labelSmall: AppTypography.caption.copyWith(
      color: AppColors.lightTextSecondary,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: AppTypography.headline1.copyWith(
      color: AppColors.darkTextPrimary,
    ),
    headlineMedium: AppTypography.headline2.copyWith(
      color: AppColors.darkTextPrimary,
    ),
    headlineSmall: AppTypography.headline3.copyWith(
      color: AppColors.darkTextPrimary,
    ),
    bodyLarge: AppTypography.bodyText1.copyWith(
      color: AppColors.darkTextPrimary,
    ),
    bodyMedium: AppTypography.bodyText2.copyWith(
      color: AppColors.darkTextSecondary,
    ),
    labelSmall: AppTypography.caption.copyWith(
      color: AppColors.darkTextSecondary,
    ),
  );
}
