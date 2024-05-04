import 'package:flutter/material.dart';

import '../../../../../core/config/theme/texts/text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final Function() onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18DarkBlueBold,
        ),
        const Spacer(),
        TextButton(
          onPressed: onActionTap,
          child: Text(
            actionText,
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
