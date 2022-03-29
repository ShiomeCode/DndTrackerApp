// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'druid.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DruidAdapter extends TypeAdapter<Druid> {
  @override
  final int typeId = 4;

  @override
  Druid read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Druid(
      fields[0] as int,
      fields[1] as int,
      (fields[2] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Druid obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.ws)
      ..writeByte(2)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DruidAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
