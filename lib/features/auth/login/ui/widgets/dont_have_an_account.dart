import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account yet? ",
          style: TextStyles.font12DarkBlueMedium.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        CustomTextButton(
          onPressed: () {
            context.pushNamed(Routes.registerScreen);
          },
          text: "Sign Up",
        ),
      ],
    ).setHorizontalPadding(40.w);
  }
}
