import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/config/Constants/app_constants.dart';
import '../../../../data/models/doctor_model.dart';
import '../data/repos/doctors_repo.dart';
import 'doctors_states.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  final DoctorsRepo _doctorsRepo;

  DoctorsCubit(this._doctorsRepo) : super(const DoctorsStates.initial());

  SortBySpecialization? sortBySpecialization;
  SortByDegree? sortByDegree;

  Future<void> getAllDoctors() async {
    emit(const DoctorsStates.doctorsListLoading());

    final result = await _doctorsRepo.getAllDoctors();

    result.when(
      success: (data) {
        emit(DoctorsStates.doctorsListSuccess(data));
      },
      failure: (error) {
        emit(DoctorsStates.failure(
            error.apiErrorModel.message ?? "Error Occurred"));
      },
    );
  }

  Future<void> searchDoctor(String doctorName) async {
    emit(const DoctorsStates.doctorsListLoading());

    final result = await _doctorsRepo.searchDoctor(doctorName);

    result.when(
      success: (data) {
        emit(DoctorsStates.doctorsListSuccess(data));
      },
      failure: (error) {
        emit(DoctorsStates.failure(
            error.apiErrorModel.message ?? "Error Occurred"));
      },
    );
  }

  Future<void> sortDoctors(
    List<DoctorModel> doctors,
  ) async {
    emit(const DoctorsStates.doctorsListLoading());
    List<DoctorModel> sortedDoctors = [];

    if (sortBySpecialization == SortBySpecialization.all &&
        sortByDegree == SortByDegree.all) {
      getAllDoctors();
    } else {
      if (sortBySpecialization != null) {
        sortedDoctors = doctors
            .where((doctor) =>
                doctor.specialization.id == sortBySpecialization!.value)
            .toList();
      }

      if (sortByDegree != null) {
        if (sortedDoctors.isNotEmpty) {
          sortedDoctors = sortedDoctors
              .where((doctor) => doctor.degree == sortByDegree!.value)
              .toList();
        } else {
          sortedDoctors = doctors
              .where((doctor) => doctor.degree == sortByDegree!.value)
              .toList();
        }
      }

      if (sortedDoctors.isNotEmpty) {
        emit(DoctorsStates.doctorsListSuccess(sortedDoctors));
      } else {
        emit(DoctorsStates.doctorsListSuccess(doctors));
      }
    }
  }
}
