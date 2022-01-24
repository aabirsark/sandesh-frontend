import 'package:hive/hive.dart';
import 'package:hive_generator/hive_generator.dart';

part 'chats_model.g.dart';

@HiveType(typeId: 0)
class Chats extends HiveObject {
  // ? username of the user chatting
  @HiveField(0)
  String? username; // will also be used to open a box

  // ? lastMessage
  @HiveField(1)
  String? lastMessage;

  // ? last chatted
  @HiveField(2)
  DateTime? lastChatted;

  // ? avater uri
  @HiveField(3)
  String? avatarUri;
}
