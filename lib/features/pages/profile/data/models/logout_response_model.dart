import 'package:json_annotation/json_annotation.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogoutResponseModel {
  final String message;
  @JsonKey(name: "data")
  final List userData;
  final bool status;
  final int code;

  LogoutResponseModel({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);
}
