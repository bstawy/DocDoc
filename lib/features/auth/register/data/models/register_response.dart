import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String message;
  @JsonKey(name: "data")
  final UserData userData;
  final bool status;
  final int code;

  RegisterResponse({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String email;
  final String phone;

  UserData({
    required this.email,
    required this.phone,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
