import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/specialities_repo.dart';
import 'specialities_state.dart';

class SpecialitiesCubit extends Cubit<SpecialitiesState> {
  final SpecialitiesRepo _specialitiesRepo;

  SpecialitiesCubit(this._specialitiesRepo)
      : super(const SpecialitiesState.initial());

  Future<void> getSpecialities() async {
    emit(const SpecialitiesState.loading());

    final response = await _specialitiesRepo.getAllSpecialities();

    response.when(
      success: (response) {
        emit(SpecialitiesState.success(response));
      },
      failure: (error) {
        emit(
          SpecialitiesState.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
