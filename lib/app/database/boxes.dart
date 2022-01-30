import 'package:hive/hive.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_indi.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_model.dart';

class Boxes {
  // ? Chat Box

  static Box<Chats> chatBox = Hive.box<Chats>(chatBoxName);
  static getUser(String username) => chatBox.get(username);

  // ? Room box

  static Box<RoomsModel> roomBox = Hive.box<RoomsModel>(roomBoxName);
  static getRoom(String code) => roomBox.get(code);
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

  static void updateRoom(String roomcode, RoomIndi msg) {
    if (Boxes.getRoom(roomcode) != null) {
      Boxes.roomBox.get(roomcode)!
        ..chats.add(msg)
        ..save();
    }
  }

  static void createNewBaseAndAddMessage(
      String username, ChatIndi msg, String? phone) {
    print("added");
    Chats chatInfo = Chats()
      ..username = username
      ..phNumber = phone
      ..chats.add(msg);

    // ? first create
    Boxes.chatBox.put(username, chatInfo);
  }

  static List<String> getRoomCodes() {
    var data = Boxes.roomBox.values.toList();
    final List<String> codes = [];
    for (var item in data) {
      codes.add(item.code ?? "");
    }

    return codes;
  }
}
