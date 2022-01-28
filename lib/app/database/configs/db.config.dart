import 'package:hive/hive.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_indi.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_model.dart';

Future dbConfig() async {
  // ? Config the UserDb
  await UserDataDB.config();

  // ? register adapters
  Hive.registerAdapter<Chats>(ChatsAdapter());
  Hive.registerAdapter<ChatIndi>(ChatIndiAdapter());
  Hive.registerAdapter<RoomIndi>(RoomIndiAdapter());
  Hive.registerAdapter<RoomsModel>(RoomsModelAdapter());

  // ? open chat boxes
  await Hive.openBox<Chats>(chatBoxName);
  await Hive.openBox<RoomsModel>(roomBoxName);
}
