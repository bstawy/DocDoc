// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_doctors_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDoctorsResponseModel _$AllDoctorsResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllDoctorsResponseModel(
      message: json['message'] as String,
      doctors: (json['data'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );
