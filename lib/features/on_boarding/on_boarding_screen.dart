import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../core/config/routing/routes.dart';
import '../../core/config/theme/texts/text_styles.dart';
import '../../core/helpers/extensions/extensions.dart';
import '../../core/widgets/custom_material_button.dart';
import 'widgets/doctor_image_and_text.dart';
import 'widgets/header_logo_and_name.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderLogoAndName(),
              Gap(40.h),
              const DoctorImageAndText(),
              Column(
                children: [
                  Text(
                    "Manage and schedule all of your medical appointments easily with DocDoc to get a new experience.",
                    textAlign: TextAlign.center,
                    style: TextStyles.font12GreyRegular,
                  ),
                  Gap(32.h),
                  CustomMaterialButton(
                    onClicked: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    title: "Get Started",
                  ),
                ],
              ).setHorizontalPadding(32.w),
            ],
          ).setVerticalPadding(24.h),
        ),
      ),
    );
  }
}
