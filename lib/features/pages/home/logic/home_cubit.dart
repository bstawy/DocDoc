import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getDoctorSpecialityData() async {
    emit(const HomeState.doctorSpecialityLoading());

    final response = await _homeRepo.getDoctorSpecialityData();

    response.when(
      success: (response) {
        emit(HomeState.doctorSpecialitySuccess(response));
      },
      failure: (error) {
        emit(
          HomeState.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }

  void getAllDoctorsData() async {
    emit(const HomeState.doctorListLoading());

    final response = await _homeRepo.getAllDoctorsData();

    response.when(
      success: (response) {
        emit(HomeState.doctorListSuccess(response));
      },
      failure: (error) {
        emit(
          HomeState.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}