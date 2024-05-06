// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num).toInt(),
      doctor: DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      startTime: json['appointment_time'] as String,
      endTime: json['appointment_end_time'] as String,
      status: json['status'] as String,
      notes: json['notes'] as String,
      price: json['appointment_price'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'patient': instance.patient,
      'appointment_time': instance.startTime,
      'appointment_end_time': instance.endTime,
      'status': instance.status,
      'notes': instance.notes,
      'appointment_price': instance.price,
    };
