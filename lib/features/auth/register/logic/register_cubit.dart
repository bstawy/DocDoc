import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/register_request_body_model.dart';
import '../data/repos/register_repo.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterStates.initial());

  void register(RegisterRequestBodyModel registerRequestBody) async {
    emit(const RegisterStates.loading());

    final response = await _registerRepo.register(registerRequestBody);

    response.when(
      success: (loginResponse) {
        emit(RegisterStates.success(loginResponse));
      },
      failure: (error) {
        emit(
          RegisterStates.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
