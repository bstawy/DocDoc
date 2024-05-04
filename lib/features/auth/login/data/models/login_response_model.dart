import 'package:json_annotation/json_annotation.dart';

import '../../../register/data/models/user_data_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  @JsonKey(name: "data")
  final UserDataModel userData;
  final bool status;
  final int code;

  LoginResponseModel({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
