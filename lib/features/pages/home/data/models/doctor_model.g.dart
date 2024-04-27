// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      photoUrl: json['photo'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      degree: json['degree'] as String,
      specialization: SpecializationModel.fromJson(
          json['specialization'] as Map<String, dynamic>),
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>),
      price: json['appoint_price'] as int,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
      governrate:
          GovernrateModel.fromJson(json['governrate'] as Map<String, dynamic>),
    );

GovernrateModel _$GovernrateModelFromJson(Map<String, dynamic> json) =>
    GovernrateModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
