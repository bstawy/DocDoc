// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModel(
      message: json['message'] as String?,
      userData: (json['data'] as List<dynamic>?)
          ?.map((e) => ProfileUserDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );
