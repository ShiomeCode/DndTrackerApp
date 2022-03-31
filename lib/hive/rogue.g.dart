// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rogue.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RogueAdapter extends TypeAdapter<Rogue> {
  @override
  final int typeId = 9;

  @override
  Rogue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rogue()
      ..level = fields[0] as int?
      ..modi = fields[1] as int?
      ..sa = fields[2] as int?
      ..sol = fields[3] as int?;
  }

  @override
  void write(BinaryWriter writer, Rogue obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.modi)
      ..writeByte(2)
      ..write(obj.sa)
      ..writeByte(3)
      ..write(obj.sol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RogueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
