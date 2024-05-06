import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/doctor_model.dart';
import 'patient_model.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final int id;
  final DoctorModel doctor;
  final PatientModel patient;
  @JsonKey(name: 'appointment_time')
  final String startTime;
  @JsonKey(name: 'appointment_end_time')
  final String endTime;
  final String status;
  final String notes;
  @JsonKey(name: 'appointment_price')
  final String price;

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
