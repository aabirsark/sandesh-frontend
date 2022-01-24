import 'package:sandesh/app/database/userdata/userData.db.dart';
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
        "http://192.168.42.173:8000",
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

  static addChatsListeners(){
    
  }
}
