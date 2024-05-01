import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'governrate_model.dart';

part 'city_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class CityModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final GovernrateModel governrate;

  CityModel({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
