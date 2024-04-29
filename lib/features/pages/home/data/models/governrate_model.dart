import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'governrate_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class GovernrateModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  GovernrateModel({
    required this.id,
    required this.name,
  });

  factory GovernrateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernrateModelFromJson(json);
}
