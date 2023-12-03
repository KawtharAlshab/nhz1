// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower-model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlowerModelAdapter extends TypeAdapter<FlowerModel> {
  @override
  final int typeId = 1;

  @override
  FlowerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlowerModel(
      name: fields[1] as String,
      color: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FlowerModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
