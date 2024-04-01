import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/routing/routes.dart';
import '../../../core/config/theme/texts/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
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
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
