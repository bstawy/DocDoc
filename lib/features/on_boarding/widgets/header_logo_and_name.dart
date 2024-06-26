import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/config/theme/texts/text_styles.dart';

class HeaderLogoAndName extends StatelessWidget {
  const HeaderLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/docdoc_logo.svg"),
        Gap(8.w),
        Text(
          "Docdoc",
          style: TextStyles.font24BlueBold.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
