import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/caching/secure_storage_factory.dart';
import '../data/models/login_request_body_model.dart';
import '../data/repos/login_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginStates.initial());

  void login(LoginRequestBodyModel loginRequestBody) async {
    emit(const LoginStates.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(
      success: (loginResponse) {
        SecureStorage.getInstance()
            .write(key: "mytoken", value: loginResponse.userData.token ?? "");
        emit(LoginStates.success(loginResponse));
      },
      failure: (error) {
        emit(
          LoginStates.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
