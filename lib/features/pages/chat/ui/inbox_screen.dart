import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../home/ui/pages/doctors/ui/widgets/search_bar_widget.dart';
import 'widgets/custom_app_bar_widget.dart';
import 'widgets/message_widget.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: ListView(
            children: [
              const SearchBarWidget(doctors: [])
                  .setHorizontalAndVerticalPadding(16.w, 32.h),
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
    );
  }
}
