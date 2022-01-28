import 'package:hive/hive.dart';

part 'rooms_indi.g.dart';

@HiveType(typeId: 3)
class RoomIndi extends HiveObject {
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
