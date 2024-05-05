import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/search_bar_widget.dart';
import 'widgets/message_widget.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<LayoutCubit>().changePage(0);
      },
      child: Column(
        children: [
          CustomAppBar(
            title: "Inbox",
            actionIcon: SvgPicture.asset(
              'assets/icons/inbox_new_message_icon.svg',
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SearchBarWidget(
                  onFilterTap: () {},
                ).setHorizontalAndVerticalPadding(16.w, 32.h),
                Column(
                  children: List.generate(
                    10,
                    (index) => const MessageWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
