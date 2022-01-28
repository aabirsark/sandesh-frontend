import 'package:hive/hive.dart';

import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_indi.dart';

part 'rooms_model.g.dart';

@HiveType(typeId: 2)
class RoomsModel extends HiveObject {
  // ? username of the user chatting
  @HiveField(0)
  String? roomName;

  // ? avater uri
  @HiveField(1)
  String? code; // will also be used to open a box

  @HiveField(2)
  String? adminName;

  @HiveField(3)
  List<RoomIndi> chats = [];
}
