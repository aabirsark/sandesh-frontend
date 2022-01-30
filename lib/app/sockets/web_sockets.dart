import 'package:sandesh/app/api/api.dart';
import 'package:sandesh/app/database/boxes.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/app/utils/date_tools.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_indi.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketClient {
  // --- Making class SingleTon
  static final SocketClient _singleton = SocketClient._internal();

  factory SocketClient() {
    return _singleton;
  }

  SocketClient._internal();

  // ----------------------------

  static late io.Socket socket;

  static connectSocket() {
    socket = io.io(
        API.api,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setQuery({"username": UserDataDB.username})
            .build());

    socket.connect();
    socket.onConnect((data) => print("Socket Connected"));
  }

  static disconnectSocket() {
    socket.disconnect();
    socket.onDisconnect((data) => print("socket disconnected"));
  }

  static addChatsListeners() {
    socket.on("newChatMsg", (data) {
      ChatIndi chatIndi = ChatIndi()
        ..date = data['date']
        ..time = data['time']
        ..username = data['from']
        ..message = data['msg'];

      if (SocketDatabaseAgreement.isDataBaseExist(data['from'])) {
        SocketDatabaseAgreement.updateChats(data['from'], chatIndi);
      } else {
        SocketDatabaseAgreement.createNewBaseAndAddMessage(
            data['from'], chatIndi, null);
      }
    });
  }

  static sendMessage(String msg, String toUsername) {
    socket.emit("msg", <String, String>{
      'msg': msg,
      'from': UserDataDB.username ?? "",
      'to': toUsername,
      'date': DateFormates.currentDate(),
      'time': DateFormates.currentTime()
    });
  }

  static joinRooms() {
    List<String> roomCodes = SocketDatabaseAgreement.getRoomCodes();
    socket.emit("joinRooms", {roomCodes});
  }

  static sendRoomMessage(String msg, String toRoom) {
    socket.emit("RoomMsg", <String, String>{
      'msg': msg,
      'sender': UserDataDB.username ?? "",
      'roomCode': toRoom,
      'date': DateFormates.currentDate(),
      'time': DateFormates.currentTime()
    });
  }

  static addRoomMessageListener() {
    socket.on("NewRoomMsg", (data) {
      RoomIndi msg = RoomIndi()
        ..roomCode = data['roomCode']
        ..username = data['sender']
        ..date = data['date']
        ..time = data['time']
        ..message = data['message'];
      // ? Update Room Messages
      SocketDatabaseAgreement.updateRoom(data['roomCode'], msg);
    });
  }
}
