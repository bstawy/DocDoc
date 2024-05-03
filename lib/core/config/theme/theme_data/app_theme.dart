import 'package:flutter/material.dart';

import '../colors/light_color_scheme.dart';
import '../texts/font_weight_helper.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: getLightColorScheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0.0,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeightHelper.bold,
        color: ColorsManager.darkBlue,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: ColorsManager.mainBlue,
      unselectedItemColor: ColorsManager.darkBlue,
    ),
  );
}
