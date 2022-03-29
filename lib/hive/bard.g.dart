// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BardAdapter extends TypeAdapter<Bard> {
  @override
  final int typeId = 2;

  @override
  Bard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bard(
      fields[0] as int,
      fields[1] as int,
      (fields[2] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Bard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.bi)
      ..writeByte(2)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
