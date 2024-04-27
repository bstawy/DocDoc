import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  @JsonKey(name: "photo")
  final String photoUrl;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final SpecializationModel specialization;
  final CityModel city;
  @JsonKey(name: "appoint_price")
  final int price;
  @JsonKey(name: "start_time")
  final String startTime;
  @JsonKey(name: "end_time")
  final String endTime;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.price,
    required this.startTime,
    required this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}

@JsonSerializable()
class SpecializationModel {
  final int id;
  final String name;

  SpecializationModel({
    required this.id,
    required this.name,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);
}

@JsonSerializable()
class CityModel {
  final int id;
  final String name;
  final GovernrateModel governrate;

  CityModel({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

@JsonSerializable()
class GovernrateModel {
  final int id;
  final String name;

  GovernrateModel({
    required this.id,
    required this.name,
  });

  factory GovernrateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernrateModelFromJson(json);
}
