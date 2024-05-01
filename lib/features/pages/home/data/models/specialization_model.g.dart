// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpecializationModelAdapter extends TypeAdapter<SpecializationModel> {
  @override
  final int typeId = 2;

  @override
  SpecializationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecializationModel(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpecializationModel obj) {
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
      other is SpecializationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
