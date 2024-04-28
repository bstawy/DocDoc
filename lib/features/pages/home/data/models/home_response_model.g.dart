// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      message: json['message'] as String,
      homeData: (json['data'] as List<dynamic>)
          .map((e) => HomeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      code: json['code'] as int,
    );

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      id: json['id'] as int,
      name: json['name'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
