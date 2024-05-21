import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/doctor_model.dart';
import 'patient_model.dart';

part 'appointment_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class AppointmentModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final DoctorModel doctor;
  @HiveField(2)
  final PatientModel patient;
  @HiveField(3)
  @JsonKey(name: 'appointment_time')
  final String startTime;
  @HiveField(4)
  @JsonKey(name: 'appointment_end_time')
  final String endTime;
  @HiveField(5)
  final String status;
  @HiveField(6)
  final String notes;
  @HiveField(7)
  @JsonKey(name: 'appointment_price')
  final int price;

  AppointmentModel({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.notes,
    required this.price,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
}
