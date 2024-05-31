import 'package:json_annotation/json_annotation.dart';

import 'profile_user_data_model.dart';

part 'user_profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponseModel {
  final String? message;
  @JsonKey(name: "data")
  final List<ProfileUserDataModel>? userData;
  final bool? status;
  final int? code;

  UserProfileResponseModel({
    this.message,
    this.userData,
    this.status,
    this.code,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);
}
