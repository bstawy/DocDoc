import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/specialities_repo.dart';
import 'specialities_states.dart';

class SpecialitiesCubit extends Cubit<SpecialitiesStates> {
  final SpecialitiesRepo _specialitiesRepo;

  SpecialitiesCubit(this._specialitiesRepo)
      : super(const SpecialitiesStates.initial());

  Future<void> getSpecialities() async {
    emit(const SpecialitiesStates.loading());

    final response = await _specialitiesRepo.getAllSpecialities();

    response.when(
      success: (response) {
        emit(SpecialitiesStates.success(response));
      },
      failure: (error) {
        emit(
          SpecialitiesStates.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
