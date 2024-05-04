import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../logic/layout_cubit.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: FloatingActionButton(
        onPressed: () {
          context.read<LayoutCubit>().changePage(2);
        },
        backgroundColor: ColorsManager.mainBlue,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: SvgPicture.asset(
          'assets/icons/nav_bar_search_icon.svg',
          colorFilter:
              const ColorFilter.mode(ColorsManager.white, BlendMode.srcIn),
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
