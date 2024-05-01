// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governrate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GovernrateModelAdapter extends TypeAdapter<GovernrateModel> {
  @override
  final int typeId = 4;

  @override
  GovernrateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GovernrateModel(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GovernrateModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GovernrateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernrateModel _$GovernrateModelFromJson(Map<String, dynamic> json) =>
    GovernrateModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );
