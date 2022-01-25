import 'package:hive/hive.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';

class Boxes {
  static Box<Chats> chatBox = Hive.box<Chats>(chatBoxName);
}

class SocketDatabaseAgreement {
  // ? if user exits then turn ups the bool
  static bool isDataBaseExist(String username) {
    if (Boxes.chatBox.get(username) != null) {
      return true;
    }
    return false;
  }

  // ? update Chats
  static void updateChats(String username, ChatIndi msg) {
    if (Boxes.chatBox.get(username) != null) {
      Boxes.chatBox.get(username)!
        ..chats.add(msg)
        ..save();
    }
  }

  // TODO : make sure it works

  static void createNewBaseAndAddMessage(String username, ChatIndi msg) {
    Chats chatInfo = Chats()
      ..username = username
      ..chats.add(msg);

    // ? first create
    Boxes.chatBox.put(username, chatInfo);
  }
}
