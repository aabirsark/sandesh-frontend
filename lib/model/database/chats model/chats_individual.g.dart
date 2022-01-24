// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_individual.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatIndiAdapter extends TypeAdapter<ChatIndi> {
  @override
  final int typeId = 1;

  @override
  ChatIndi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatIndi()
      ..username = fields[0] as String?
      ..message = fields[1] as String?
      ..time = fields[2] as String?
      ..date = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, ChatIndi obj) {
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
      other is ChatIndiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
