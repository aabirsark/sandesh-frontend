// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatsAdapter extends TypeAdapter<Chats> {
  @override
  final int typeId = 0;

  @override
  Chats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chats()
      ..username = fields[0] as String?
      ..avatarUri = fields[1] as String?
      ..phNumber = fields[2] as String?
      ..chats = (fields[3] as List).cast<ChatIndi>();
  }

  @override
  void write(BinaryWriter writer, Chats obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.avatarUri)
      ..writeByte(2)
      ..write(obj.phNumber)
      ..writeByte(3)
      ..write(obj.chats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
