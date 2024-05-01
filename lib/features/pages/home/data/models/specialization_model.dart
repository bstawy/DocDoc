import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specialization_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class SpecializationModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  SpecializationModel({
    required this.id,
    required this.name,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);
}
