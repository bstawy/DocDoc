import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeStates.initial());

  void getDoctorSpecialityData() async {
    emit(const HomeStates.doctorSpecialityLoading());

    final response = await _homeRepo.getDoctorSpecialityData();

    response.when(
      success: (response) {
        emit(HomeStates.doctorSpecialitySuccess(response));
      },
      failure: (error) {
        emit(
          HomeStates.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }

  void getAllDoctorsData() async {
    emit(const HomeStates.doctorListLoading());

    final response = await _homeRepo.getAllDoctorsData();

    response.when(
      success: (response) {
        emit(HomeStates.doctorListSuccess(response));
      },
      failure: (error) {
        emit(
          HomeStates.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
