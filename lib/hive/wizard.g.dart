// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wizard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WizardAdapter extends TypeAdapter<Wizard> {
  @override
  final int typeId = 12;

  @override
  Wizard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wizard(
      fields[0] as int,
      fields[1] as int,
      (fields[2] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Wizard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.ar)
      ..writeByte(2)
      ..write(obj.spellSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WizardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
