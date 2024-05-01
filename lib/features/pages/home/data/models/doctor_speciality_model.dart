import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'doctor_model.dart';

part 'doctor_speciality_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class DoctorSpecialityModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: "doctors")
  final List<DoctorModel> doctors;

  DoctorSpecialityModel({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory DoctorSpecialityModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecialityModelFromJson(json);
}
