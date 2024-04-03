import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/register_request_body.dart';
import '../data/repos/register_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  void register(RegisterRequestBody registerRequestBody) async {
    emit(const RegisterState.loading());
    final response = await _registerRepo.register(registerRequestBody);

    response.when(
      success: (loginResponse) {
        emit(RegisterState.success(loginResponse));
      },
      failure: (error) {
        emit(
          RegisterState.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
