import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/light_color_scheme.dart';

TextTheme getTextTheme() {
  return TextTheme(
    displayLarge: TextStyle(
      color: AppColors.primary,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: AppColors.secondary,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: AppColors.background,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: AppColors.onBackground,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.secondary,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}