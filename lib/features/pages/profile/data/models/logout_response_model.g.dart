// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseModel _$LogoutResponseModelFromJson(Map<String, dynamic> json) =>
    LogoutResponseModel(
      message: json['message'] as String,
      userData: json['data'] as List<dynamic>,
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );
