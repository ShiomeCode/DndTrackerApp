// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fighter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FighterAdapter extends TypeAdapter<Fighter> {
  @override
  final int typeId = 5;

  @override
  Fighter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fighter()
      ..level = fields[0] as int?
      ..sw = fields[1] as int?
      ..acs = fields[2] as int?
      ..ea = fields[3] as int?
      ..ind = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, Fighter obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.sw)
      ..writeByte(2)
      ..write(obj.acs)
      ..writeByte(3)
      ..write(obj.ea)
      ..writeByte(4)
      ..write(obj.ind);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FighterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
