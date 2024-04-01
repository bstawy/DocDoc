import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/theme/texts/text_styles.dart';

class HeaderLogoAndName extends StatelessWidget {
  const HeaderLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/docdoc_logo.svg"),
        SizedBox(width: 8.w),
        Text(
          "Docdoc",
          style: TextStyles.font24Blue700w.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
