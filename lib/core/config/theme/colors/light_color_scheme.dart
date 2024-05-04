import 'package:flutter/material.dart';

import 'colors_manager.dart';

ColorScheme getLightColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: ColorsManager.mainBlue,
    primary: ColorsManager.mainBlue,
    onPrimary: ColorsManager.white,
    primaryContainer: ColorsManager.mainBlue.withOpacity(0.05),
    secondary: ColorsManager.secondary,
    secondaryContainer: ColorsManager.secondaryContainer,
    background: ColorsManager.white,
    onBackground: ColorsManager.lighterGrey,
    surface: ColorsManager.surface,
    onSurface: ColorsManager.onSurface,
    tertiary: ColorsManager.green,
    error: ColorsManager.red,
  );
}
