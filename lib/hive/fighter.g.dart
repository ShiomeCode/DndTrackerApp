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
    return Fighter(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Fighter obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.sw)
      ..writeByte(2)
      ..write(obj.acs)
      ..writeByte(3)
      ..write(obj.ea);
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
