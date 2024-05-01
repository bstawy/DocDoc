import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Omar!',
              textAlign: TextAlign.start,
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How are you today?',
              textAlign: TextAlign.start,
              style: TextStyles.font12GreyRegular,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            //TODO: open notification
          },
          icon: CircleAvatar(
            radius: 24.r,
            backgroundColor: ColorsManager.lighterGrey,
            child: SvgPicture.asset(
              'assets/icons/home_notification_icon.svg',
            ),
          ),
        ),
      ],
    );
  }
}
