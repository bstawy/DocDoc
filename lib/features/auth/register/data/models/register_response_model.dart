import 'package:json_annotation/json_annotation.dart';

import 'user_data_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  String? message;
  @JsonKey(name: "data")
  UserDataModel? userData;
  bool? status;
  int? code;

  RegisterResponseModel({
    this.message,
    this.userData,
    this.status,
    this.code,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}
