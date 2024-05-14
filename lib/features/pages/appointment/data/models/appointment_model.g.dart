// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentModelAdapter extends TypeAdapter<AppointmentModel> {
  @override
  final int typeId = 5;

  @override
  AppointmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentModel(
      id: fields[0] as int,
      doctor: fields[1] as DoctorModel,
      patient: fields[2] as PatientModel,
      startTime: fields[3] as String,
      endTime: fields[4] as String,
      status: fields[5] as String,
      notes: fields[6] as String,
      price: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.doctor)
      ..writeByte(2)
      ..write(obj.patient)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num).toInt(),
      doctor: DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      startTime: json['appointment_time'] as String,
      endTime: json['appointment_end_time'] as String,
      status: json['status'] as String,
      notes: json['notes'] as String,
      price: json['appointment_price'] as String,
    );
