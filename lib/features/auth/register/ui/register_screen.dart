import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions/extensions.dart';
import '../../widgets/header.dart';
import '../../widgets/terms_and_conditions_text.dart';
import '../logic/register_cubit.dart';
import 'widgets/already_have_an_account.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(32.h),
              const WelcomeHeader(
                title: "Create Account",
                description:
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
              ),
              verticalSpace(32.h),
              BlocProvider(
                create: (context) => getIt<RegisterCubit>(),
                child: const RegisterForm(),
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
