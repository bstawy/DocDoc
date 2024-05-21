import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class PatientModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
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
