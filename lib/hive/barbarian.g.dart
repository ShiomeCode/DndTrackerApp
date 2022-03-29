// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barbarian.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BarbarianAdapter extends TypeAdapter<Barbarian> {
  @override
  final int typeId = 1;

  @override
  Barbarian read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Barbarian(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Barbarian obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.rage)
      ..writeByte(2)
      ..write(obj.bc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarbarianAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
