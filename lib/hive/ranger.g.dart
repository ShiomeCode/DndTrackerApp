// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranger.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RangerAdapter extends TypeAdapter<Ranger> {
  @override
  final int typeId = 8;

  @override
  Ranger read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ranger()
      ..level = fields[0] as int?
      ..spellSlots = (fields[1] as List?)?.cast<int>();
  }

  @override
  void write(BinaryWriter writer, Ranger obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RangerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
