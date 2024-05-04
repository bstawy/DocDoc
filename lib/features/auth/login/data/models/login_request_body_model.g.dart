// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestBodyModel _$LoginRequestBodyModelFromJson(
        Map<String, dynamic> json) =>
    LoginRequestBodyModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestBodyModelToJson(
        LoginRequestBodyModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
