// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paladin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaladinAdapter extends TypeAdapter<Paladin> {
  @override
  final int typeId = 7;

  @override
  Paladin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Paladin(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
      (fields[4] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Paladin obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.cd)
      ..writeByte(2)
      ..write(obj.ds)
      ..writeByte(3)
      ..write(obj.loh)
      ..writeByte(4)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaladinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
