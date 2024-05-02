import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/doctors_repo.dart';
import 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorsRepo _doctorsRepo;

  DoctorsCubit(this._doctorsRepo) : super(const DoctorsState.initial());

  Future<void> getAllDoctors() async {
    emit(const DoctorsState.doctorsListLoading());

    final result = await _doctorsRepo.getAllDoctors();

    result.when(
      success: (data) {
        emit(DoctorsState.doctorsListSuccess(data));
      },
      failure: (error) {
        emit(DoctorsState.failure(
            error.apiErrorModel.message ?? "Error Occurred"));
      },
    );
  }

  Future<void> searchDoctor(String doctorName) async {
    emit(const DoctorsState.doctorsListLoading());

    final result = await _doctorsRepo.searchDoctor(doctorName);

    result.when(
      success: (data) {
        emit(DoctorsState.doctorsListSuccess(data));
      },
      failure: (error) {
        emit(DoctorsState.failure(
            error.apiErrorModel.message ?? "Error Occurred"));
      },
    );
  }
}
