import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/extensions.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormField(hint: "Email"),
          verticalSpace(16.h),
          const CustomTextFormField(
            hint: "Password",
            isPassword: true,
            action: TextInputAction.done,
          ),
          verticalSpace(16.h),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              onPressed: () {
                // TODO: navigate to forgot password screen
              },
              horizontalPadding: 4.w,
              verticalPadding: 4.h,
              text: "Forgot password?",
            ),
          ),
          verticalSpace(24.h),
          CustomMaterialButton(
            onClicked: () {
              // TODO: call login end point
            },
            title: "Login",
          ),
        ],
      ).setHorizontalPadding(24.w),
    );
  }
}
