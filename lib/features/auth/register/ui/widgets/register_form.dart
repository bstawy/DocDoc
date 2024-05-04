import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/custom_snackbar.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../widgets/password_validations.dart';
import '../../data/models/register_request_body.dart';
import '../../logic/register_cubit.dart';
import '../../logic/register_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmationController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool enablePasswordConfirmation = false;

  bool registering = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();
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
        enablePasswordConfirmation = hasLowerCase &&
            hasUpperCase &&
            hasSpecialCharacter &&
            hasNumber &&
            hasMinLength;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          //const RegisterBlocListener(),
          CustomTextFormField(
            controller: _usernameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Username is required";
              }
              return null;
            },
            hint: "username",
          ),
          verticalSpace(16.h),
          CustomTextFormField(
            controller: _emailController,
            validator: (value) {
              return Validators.validateEmail(value);
            },
            hint: "Email",
          ),
          verticalSpace(16.h),
          CustomTextFormField(
            controller: _phoneController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Phone Number is required";
              }
              return null;
              //return Validators.validatePhoneNumber(value);
            },
            hint: "Phone Number",
          ),
          verticalSpace(16.h),
          CustomTextFormField(
            controller: _passwordController,
            hint: "Password",
            scrollPaddingValue: 300.h,
            isPassword: true,
            validator: (value) {
              return Validators.validatePassword(value);
            },
          ),
          verticalSpace(16.h),
          CustomTextFormField(
            controller: _passwordConfirmationController,
            hint: "Password Confirmation",
            isPassword: true,
            enabled: enablePasswordConfirmation,
            action: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value != _passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
          verticalSpace(16.h),
          PasswordValidations(
            isPasswordEmpty: _passwordController.text.isEmpty,
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(24.h),
          BlocConsumer<RegisterCubit, RegisterState>(
            bloc: context.read<RegisterCubit>(),
            buildWhen: (previous, current) {
              if (current is Success || current is Failure) return false;

              return true;
            },
            listenWhen: (previous, current) {
              if (current is Success || current is Failure) return true;

              return false;
            },
            listener: (context, state) {
              state.whenOrNull(
                success: (loginResponse) {
                  registering = false;
                  CustomSnackBar.showSuccessMessage(
                      context, "Account created successfully");
                  context.pop();
                },
                failure: (errorMsg) {
                  registering = false;
                  CustomSnackBar.showErrorMessage(context, errorMsg);
                },
              );
            },
            builder: (context, state) {
              state.whenOrNull(
                loading: () {
                  registering = true;
                },
              );
              return CustomMaterialButton(
                onClicked: () {
                  validateAndRegister(context);
                },
                loading: registering,
                enabled: !registering,
                title: "Register",
                child: registering
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : null,
              );
            },
          ),
        ],
      ).setHorizontalPadding(24.w),
    );
  }

  void validateAndRegister(BuildContext context) {
    if (registerFormKey.currentState!.validate()) {
      context.read<RegisterCubit>().register(
            RegisterRequestBody(
              name: _usernameController.text,
              phone: _phoneController.text,
              email: _emailController.text,
              password: _passwordController.text,
              passwordConfirmation: _passwordConfirmationController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }
}
