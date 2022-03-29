// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleric.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClericAdapter extends TypeAdapter<Cleric> {
  @override
  final int typeId = 3;

  @override
  Cleric read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cleric(
      fields[0] as int,
      fields[1] as int,
      (fields[2] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Cleric obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.cd)
      ..writeByte(2)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClericAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
