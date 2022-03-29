// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warlock.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WarlockAdapter extends TypeAdapter<Warlock> {
  @override
  final int typeId = 11;

  @override
  Warlock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Warlock(
      fields[0] as int,
      (fields[1] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Warlock obj) {
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
      other is WarlockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
