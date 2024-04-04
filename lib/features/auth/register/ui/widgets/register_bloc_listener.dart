import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/custom_snackbar.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../logic/register_cubit.dart';
import '../../logic/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) {
        if (previous is Loading && current is Success ||
            previous is Loading && current is Failure) {
          context.pop();
        }
        return true;
      },
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: context.theme.primaryColor,
                  ),
                );
              },
            );
          },
          success: (loginResponse) {
            CustomSnackBar.showSuccessMessage(
                context, "Account created successfully");
            context.pop();
          },
          failure: (errorMsg) {
            CustomSnackBar.showErrorMessage(context, errorMsg);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
