// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_speciality_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorSpecialityResponseModel _$DoctorSpecialityResponseModelFromJson(
        Map<String, dynamic> json) =>
    DoctorSpecialityResponseModel(
      message: json['message'] as String,
      homeData: (json['data'] as List<dynamic>)
          .map((e) => DoctorSpecialityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$DoctorSpecialityResponseModelToJson(
        DoctorSpecialityResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.homeData,
      'status': instance.status,
      'code': instance.code,
    };
