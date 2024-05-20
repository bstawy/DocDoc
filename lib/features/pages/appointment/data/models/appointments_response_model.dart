import 'package:json_annotation/json_annotation.dart';

import 'appointment_model.dart';

part 'appointments_response_model.g.dart';

@JsonSerializable()
class AppointmentsResponseModel {
  final String message;
  @JsonKey(name: "data")
  final List<AppointmentModel> appointments;
  final bool status;
  final int code;

  AppointmentsResponseModel({
    required this.message,
    required this.appointments,
    required this.status,
    required this.code,
  });

  factory AppointmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsResponseModelFromJson(json);
}
