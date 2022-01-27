import 'package:hive/hive.dart';

part 'chats_individual.g.dart';

@HiveType(typeId: 1)
class ChatIndi extends HiveObject {
  // ? sender username
  @HiveField(0)
  String? username;

  // ? message
  @HiveField(1)
  String? message;

  // ? time
  @HiveField(2)
  String? time;

  // ? date
  @HiveField(3)
  String? date;
}
