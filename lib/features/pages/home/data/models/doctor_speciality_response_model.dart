import 'package:json_annotation/json_annotation.dart';

import 'doctor_speciality_model.dart';

part 'doctor_speciality_response_model.g.dart';

@JsonSerializable()
class DoctorSpecialityResponseModel {
  final String message;
  @JsonKey(name: "data")
  final List<DoctorSpecialityModel> homeData;
  final bool status;
  final int code;

  DoctorSpecialityResponseModel({
    required this.message,
    required this.homeData,
    required this.status,
    required this.code,
  });

  factory DoctorSpecialityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecialityResponseModelFromJson(json);
}
