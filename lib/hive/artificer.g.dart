// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artificer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArtificerAdapter extends TypeAdapter<Artificer> {
  @override
  final int typeId = 0;

  @override
  Artificer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Artificer(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      (fields[4] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Artificer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.castingMod)
      ..writeByte(2)
      ..write(obj.ik)
      ..writeByte(3)
      ..write(obj.fog)
      ..writeByte(4)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtificerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
