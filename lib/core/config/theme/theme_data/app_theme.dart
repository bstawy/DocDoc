import 'package:flutter/material.dart';

import '../colors/light_color_scheme.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: getLightColorScheme(),
  );
}
