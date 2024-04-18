import 'package:flutter/material.dart';

import '../colors/light_color_scheme.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: getLightColorScheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
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
