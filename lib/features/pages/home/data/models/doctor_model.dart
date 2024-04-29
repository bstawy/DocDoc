import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'city_model.dart';
import 'specialization_model.dart';

part 'doctor_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class DoctorModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  @JsonKey(name: "photo")
  final String photoUrl;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final String address;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final String degree;
  @HiveField(9)
  final SpecializationModel specialization;
  @HiveField(10)
  final CityModel city;
  @HiveField(11)
  @JsonKey(name: "appoint_price")
  final int price;
  @HiveField(12)
  @JsonKey(name: "start_time")
  final String startTime;
  @HiveField(13)
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
