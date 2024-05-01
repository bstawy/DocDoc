import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/doctor_model.dart';
import '../data/models/doctor_speciality_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.doctorSpecialityLoading() = DoctorSpecialityLoading;
  const factory HomeState.doctorListLoading() = DoctorListLoading;
  const factory HomeState.doctorSpecialitySuccess(
      List<DoctorSpecialityModel> data) = DoctorSpecialitySuccess;
  const factory HomeState.doctorListSuccess(List<DoctorModel> data) =
      DoctorListSuccess;
  const factory HomeState.failure({required String error}) = Failure;
}
