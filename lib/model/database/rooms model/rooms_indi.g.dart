// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_indi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomIndiAdapter extends TypeAdapter<RoomIndi> {
  @override
  final int typeId = 3;

  @override
  RoomIndi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomIndi()
      ..username = fields[0] as String?
      ..message = fields[1] as String?
      ..time = fields[2] as String?
      ..date = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, RoomIndi obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomIndiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
