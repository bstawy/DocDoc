import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
}
