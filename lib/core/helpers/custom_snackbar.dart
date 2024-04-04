import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/texts/text_styles.dart';

class CustomSnackBar {
  static void showSuccessMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: true,
      crossPage: true,
      dismissDirections: [DismissDirection.endToStart],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, "success", msg);
      },
    );
  }

  static void showErrorMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: true,
      crossPage: true,
      dismissDirections: [DismissDirection.endToStart],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, "error", msg);
      },
    );
  }

  static Widget _buildNotificationWidget(
    BuildContext context,
    String state,
    String msg,
  ) {
    final theme = Theme.of(context);

    Color msgColor = (state == "success")
        ? theme.colorScheme.primary
        : theme.colorScheme.error;

    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          msg,
          textAlign: TextAlign.center,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font14DarkBlueMedium.copyWith(
            color: msgColor,
          ),
        ),
      ),
    );
  }
}
