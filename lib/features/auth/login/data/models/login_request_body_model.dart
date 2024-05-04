import 'package:json_annotation/json_annotation.dart';

part 'login_request_body_model.g.dart';

@JsonSerializable()
class LoginRequestBodyModel {
  final String email;
  final String password;

  LoginRequestBodyModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyModelToJson(this);
}
