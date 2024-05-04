import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../layout/logic/layout_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.read<LayoutCubit>().changePage(0);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        const Spacer(),
        Text(
          "Message",
          style: TextStyles.font18DarkBlueBold,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            // TODO: open new message bottom sheet
          },
          icon: SvgPicture.asset(
            'assets/icons/inbox_new_message_icon.svg',
          ),
        ),
      ],
    ).setHorizontalPadding(16.w);
  }
}
