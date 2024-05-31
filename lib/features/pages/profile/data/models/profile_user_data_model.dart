import 'package:json_annotation/json_annotation.dart';

part 'profile_user_data_model.g.dart';

@JsonSerializable()
class ProfileUserDataModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;

  ProfileUserDataModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.gender,
  });

  factory ProfileUserDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserDataModelFromJson(json);
}
