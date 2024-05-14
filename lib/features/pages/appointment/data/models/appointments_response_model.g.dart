// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentsResponseModel _$AppointmentsResponseModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentsResponseModel(
      message: json['message'] as String,
      appointments: (json['appointments'] as List<dynamic>)
          .map((e) => AppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );
