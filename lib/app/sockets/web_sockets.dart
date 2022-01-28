import 'package:sandesh/app/api/api.dart';
import 'package:sandesh/app/database/boxes.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/app/utils/date_tools.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
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
    socket.onConnecting((data) => print("Connecting socket"));
    socket.onConnect((data) => print("Socket Connected"));
    print(socket.connected);
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
    print(msg);
    socket.emit("msg", <String, String>{
      'msg': msg,
      'from': UserDataDB.username ?? "",
      'to': toUsername,
      'date': DateFormates.currentDate(),
      'time': DateFormates.currentTime()
    });
  }
}
