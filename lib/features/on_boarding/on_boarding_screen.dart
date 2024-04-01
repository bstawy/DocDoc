import 'package:docdoc/core/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/config/routing/routes.dart';
import '../../core/config/theme/texts/text_styles.dart';
import 'widgets/doctor_image_and_text.dart';
import 'widgets/header_logo_and_name.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              children: [
                const HeaderLogoAndName(),
                SizedBox(height: 40.h),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Text(
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                    textAlign: TextAlign.center,
                    style: TextStyles.font12Grey400w,
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: MaterialButton(
                    onPressed: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    color: context.colorScheme.primary,
                    height: 56.h,
                    minWidth: double.maxFinite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyles.font16White600w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
