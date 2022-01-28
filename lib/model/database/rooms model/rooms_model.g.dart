// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomsModelAdapter extends TypeAdapter<RoomsModel> {
  @override
  final int typeId = 2;

  @override
  RoomsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomsModel()
      ..roomName = fields[0] as String?
      ..code = fields[1] as String?
      ..adminName = fields[2] as String?
      ..chats = (fields[3] as List).cast<RoomIndi>();
  }

  @override
  void write(BinaryWriter writer, RoomsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.roomName)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.adminName)
      ..writeByte(3)
      ..write(obj.chats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
