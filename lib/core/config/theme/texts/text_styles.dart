import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/light_color_scheme.dart';

class TextStyles {
  static TextStyle font32Blue700w = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static TextStyle font24Blue700w = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static TextStyle font16White600w = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );

  static TextStyle font12Grey400w = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.onBackground,
  );
}
/*
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
}*/
