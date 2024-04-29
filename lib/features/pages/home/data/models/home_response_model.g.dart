// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeDataAdapter extends TypeAdapter<HomeData> {
  @override
  final int typeId = 0;

  @override
  HomeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeData(
      id: fields[0] as int,
      name: fields[1] as String,
      doctors: (fields[2] as List).cast<DoctorModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomeData obj) {
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
      other is HomeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      message: json['message'] as String,
      homeData: (json['data'] as List<dynamic>)
          .map((e) => HomeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      code: json['code'] as int,
    );

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      id: json['id'] as int,
      name: json['name'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
