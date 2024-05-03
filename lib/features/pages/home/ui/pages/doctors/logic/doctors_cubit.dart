import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/doctor_model.dart';
import '../data/repos/doctors_repo.dart';
import 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorsRepo _doctorsRepo;

  DoctorsCubit(this._doctorsRepo) : super(const DoctorsState.initial());

  SortBySpecialization? sortBySpecialization;
  SortByDegree? sortByDegree;

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

  Future<void> sortDoctors(
    List<DoctorModel> doctors,
  ) async {
    emit(const DoctorsState.doctorsListLoading());
    List<DoctorModel> sortedDoctors = [];

    if (sortBySpecialization == SortBySpecialization.all &&
        sortByDegree == SortByDegree.all) {
      getAllDoctors();
    }

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
      emit(DoctorsState.doctorsListSuccess(sortedDoctors));
    } else {
      emit(DoctorsState.doctorsListSuccess(doctors));
    }
  }
}

enum SortBySpecialization {
  all(0),
  cardiology(1),
  dermatology(2),
  neurology(3),
  orthopedics(4),
  pediatrics(5),
  gynecology(6),
  ophthalmology(7),
  urology(8),
  gastroenterology(9),
  psychiatry(10);

  final int value;

  const SortBySpecialization(this.value);
}

enum SortByDegree {
  all("All"),
  consultant("Consultant"),
  specialist("Specialist"),
  professor("Professor");

  final String value;

  const SortByDegree(this.value);
}
