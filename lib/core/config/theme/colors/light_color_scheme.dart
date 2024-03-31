import 'package:flutter/material.dart';

part 'app_colors.dart';

ColorScheme getLightColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    onPrimary: AppColors.background,
    primaryContainer: AppColors.primaryContainer,
    secondary: AppColors.secondary,
    secondaryContainer: AppColors.secondaryContainer,
    background: AppColors.background,
    onBackground: AppColors.onBackground,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    tertiary: AppColors.tertiary,
    error: AppColors.error,
  );
}
