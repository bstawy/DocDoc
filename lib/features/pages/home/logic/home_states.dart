import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/doctor_model.dart';
import '../data/models/doctor_speciality_model.dart';

part 'home_states.freezed.dart';

@freezed
class HomeStates with _$HomeStates {
  const factory HomeStates.initial() = _Initial;
  const factory HomeStates.doctorSpecialityLoading() = DoctorSpecialityLoading;
  const factory HomeStates.doctorListLoading() = DoctorListLoading;
  const factory HomeStates.doctorSpecialitySuccess(
      List<DoctorSpecialityModel> data) = DoctorSpecialitySuccess;
  const factory HomeStates.doctorListSuccess(List<DoctorModel> data) =
      DoctorListSuccess;
  const factory HomeStates.failure({required String error}) = Failure;
}
