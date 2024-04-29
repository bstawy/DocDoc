import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'doctor_model.dart';

part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponse {
  final String message;
  @JsonKey(name: "data")
  final List<HomeData> homeData;
  final bool status;
  final int code;

  HomeResponse({
    required this.message,
    required this.homeData,
    required this.status,
    required this.code,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

@HiveType(typeId: 0)
@JsonSerializable()
class HomeData {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: "doctors")
  final List<DoctorModel> doctors;

  HomeData({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}
