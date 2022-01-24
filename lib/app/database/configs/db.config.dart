import 'package:hive/hive.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';

Future dbConfig() async {
  // ? Config the UserDb
  await UserDataDB.config();

  // ? register adapters
  Hive.registerAdapter<Chats>(ChatsAdapter());

  // ? open chat boxes
  await Hive.openBox<Chats>(chatBoxName);
}
