// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      message: json['message'] as String,
      userData: UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool,
      code: json['code'] as int,
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      email: json['email'] as String,
      phone: json['phone'] as String,
    );