import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../widgets/header.dart';
import '../../widgets/terms_and_conditions_text.dart';
import '../logic/login_cubit.dart';
import 'widgets/dont_have_an_account.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(32.h),
              const WelcomeHeader(
                title: "Welcome Back",
                description:
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              ),
              Gap(32.h),
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginForm(),
              ),
              Gap(32.h),
              const TermsAndConditionsText(),
              Gap(24.h),
              const DontHaveAnAccount(),
            ],
          ).setVerticalPadding(32.h),
        ),
      ),
    );
  }
}
