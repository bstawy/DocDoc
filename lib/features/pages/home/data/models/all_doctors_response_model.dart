import 'package:json_annotation/json_annotation.dart';

import 'doctor_model.dart';

part 'all_doctors_response_model.g.dart';

@JsonSerializable()
class AllDoctorsResponseModel {
  final String message;
  @JsonKey(name: "data")
  final List<DoctorModel> doctors;
  final bool status;
  final int code;

  AllDoctorsResponseModel({
    required this.message,
    required this.doctors,
    required this.status,
    required this.code,
  });

  factory AllDoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsResponseModelFromJson(json);
}
