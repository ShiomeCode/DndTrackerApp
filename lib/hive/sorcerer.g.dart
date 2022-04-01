// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorcerer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SorcererAdapter extends TypeAdapter<Sorcerer> {
  @override
  final int typeId = 10;

  @override
  Sorcerer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sorcerer()
      ..level = fields[0] as int?
      ..sp = fields[1] as int?
      ..spellSlots = (fields[2] as List?)?.cast<int>();
  }

  @override
  void write(BinaryWriter writer, Sorcerer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.sp)
      ..writeByte(2)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SorcererAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
