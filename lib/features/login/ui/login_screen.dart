import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/extensions/extensions.dart';
import '../logic/cubit/login_cubit.dart';
import 'widgets/already_have_an_account.dart';
import 'widgets/login_form.dart';
import 'widgets/terms_and_conditions_text.dart';
import 'widgets/welcome_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(32.h),
              const WelcomeHeader(),
              verticalSpace(32.h),
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginForm(),
              ),
              verticalSpace(32.h),
              const TermsAndConditionsText(),
              verticalSpace(24.h),
              const AlreadyHaveAnAccount(),
            ],
          ).setVerticalPadding(32.h),
        ),
      ),
    );
  }
}
