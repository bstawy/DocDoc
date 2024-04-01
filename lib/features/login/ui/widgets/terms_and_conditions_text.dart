import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/texts/text_styles.dart';
import '../../../../core/helpers/extensions/extensions.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By logging, you agree to our ",
            style: TextStyles.font12GreyRegular,
          ),
          TextSpan(
            text: "Terms & Conditions ",
            style: TextStyles.font12DarkBlueMedium,
          ),
          TextSpan(
            text: "and ",
            style: TextStyles.font12GreyRegular,
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyles.font12DarkBlueMedium.copyWith(height: 1.5),
          ),
        ],
      ),
    ).setHorizontalPadding(40.w);
  }
}
