import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/routing/routes.dart';
import '../../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../../core/config/theme/texts/text_styles.dart';
import '../../../../../core/helpers/custom_snackbar.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../widgets/password_validations.dart';
import '../../data/models/login_request_body_model.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_states.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  bool logging = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowerCase = Validators.hasLowerCase(_passwordController.text);
        hasUpperCase = Validators.hasUpperCase(_passwordController.text);
        hasSpecialCharacter =
            Validators.hasSpecialCharacter(_passwordController.text);
        hasNumber = Validators.hasNumber(_passwordController.text);
        hasMinLength = Validators.hasMinLength(_passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _emailController,
            validator: (value) {
              return Validators.validateEmail(value);
            },
            hint: "Email",
          ),
          Gap(16.h),
          CustomTextFormField(
            controller: _passwordController,
            hint: "Password",
            scrollPaddingValue: 300.h,
            isPassword: true,
            action: TextInputAction.done,
            validator: (value) {
              return Validators.validatePassword(value);
            },
          ),
          Gap(16.h),
          PasswordValidations(
            isPasswordEmpty: _passwordController.text.isEmpty,
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          Gap(8.h),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              onPressed: () {
                CustomSnackBar.showErrorMessage(
                  context,
                  "Reset password is not available yet.",
                );
              },
              horizontalPadding: 4.w,
              verticalPadding: 4.h,
              text: "Forgot password?",
            ),
          ),
          Gap(24.h),
          BlocConsumer<LoginCubit, LoginStates>(
            bloc: context.read<LoginCubit>(),
            buildWhen: (previous, current) {
              if (current is Success) return false;

              return true;
            },
            listenWhen: (previous, current) {
              if (current is Success || current is Failure) return true;

              return false;
            },
            listener: (context, state) {
              state.whenOrNull(
                success: (loginResponse) {
                  logging = false;
                  context.pushNamedAndRemoveUntil(
                    Routes.layoutScreen,
                    predicate: ModalRoute.withName(Routes.splashScreen),
                  );
                },
                failure: (errorMsg) {
                  logging = false;
                  CustomSnackBar.showErrorMessage(context, errorMsg);
                },
              );
            },
            builder: (context, state) {
              state.whenOrNull(
                loading: () {
                  logging = true;
                },
              );
              return CustomMaterialButton(
                onClicked: () {
                  validateAndLogin(context);
                },
                loading: logging,
                enabled: !logging,
                title: "Login",
              );
            },
          ),
        ],
      ).setHorizontalPadding(24.w),
    );
  }

  Future<dynamic> buildErrorWidget(BuildContext context, String errorMsg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error_rounded,
            color: ColorsManager.red,
            size: 35,
          ),
          content: Text(
            errorMsg,
            textAlign: TextAlign.center,
            style: TextStyles.font14DarkBlueMedium,
          ),
          backgroundColor: ColorsManager.white,
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            CustomMaterialButton(
              onClicked: () {
                context.pop();
              },
              title: "Got it",
              titleStyle: TextStyles.font12DarkBlueMedium.copyWith(
                color: ColorsManager.white,
              ),
              height: 35.h,
              width: 100.w,
              padding: EdgeInsets.all(4.r),
            ),
          ],
        );
      },
    );
  }

  void validateAndLogin(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
            LoginRequestBodyModel(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
