import 'package:docdoc/core/config/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/custom_snackbar.dart';
import '../../../../../core/helpers/extensions/extensions.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
            // TODO: login response doesn't have a message & snackbar is not showed
            CustomSnackBar.showSuccessMessage(context, "Welcome Back");
            context.pushNamedAndRemoveUntil(Routes.layoutScreen,
                predicate: ModalRoute.withName(Routes.splashScreen));
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
