// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monk.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MonkAdapter extends TypeAdapter<Monk> {
  @override
  final int typeId = 6;

  @override
  Monk read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Monk()
      ..level = fields[0] as int?
      ..ki = fields[1] as int?
      ..kidc = fields[2] as int?
      ..um = fields[3] as int?;
  }

  @override
  void write(BinaryWriter writer, Monk obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.ki)
      ..writeByte(2)
      ..write(obj.kidc)
      ..writeByte(3)
      ..write(obj.um);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
