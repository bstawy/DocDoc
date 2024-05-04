// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_speciality_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorSpecialityModelAdapter extends TypeAdapter<DoctorSpecialityModel> {
  @override
  final int typeId = 0;

  @override
  DoctorSpecialityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorSpecialityModel(
      id: fields[0] as int,
      name: fields[1] as String,
      doctors: (fields[2] as List).cast<DoctorModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DoctorSpecialityModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.doctors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorSpecialityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorSpecialityModel _$DoctorSpecialityModelFromJson(
        Map<String, dynamic> json) =>
    DoctorSpecialityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
