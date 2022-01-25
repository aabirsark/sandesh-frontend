import 'package:hive/hive.dart';
import 'package:hive_generator/hive_generator.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';

part 'chats_model.g.dart';

@HiveType(typeId: 0)
class Chats extends HiveObject {
  // ? username of the user chatting
  @HiveField(0)
  String? username; // will also be used to open a box

  // ? avater uri
  @HiveField(1)
  String? avatarUri;

  @HiveField(2)
  List<ChatIndi> chats = [];
}
