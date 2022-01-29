import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sandesh/app/api/api.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/model/rooms/rooms_model.dart';
import 'package:sandesh/model/rooms/room_res.model.dart';

class RoomApiService {
  // ? for creating a new room
  static Future<RoomResModel> createRoom(RoomPushModel model) async {
    late RoomResModel reModel;

    try {
      var uri = Uri.parse(API.createNewRoom);
      var res = await http.post(uri, body: {
        "roomname": model.roomName,
        "secretcode": model.code,
        "adminName": model.adminUsername,
        "phoneNumber": model.adminPhone
      });

      if (res.statusCode != 200) {
        reModel = RoomResModel(feedback: "Server Side error", error: true);
      }
      var jsonRes = jsonDecode(res.body);
      print(jsonRes);

      reModel = RoomResModel.fromJson(jsonRes);
    } catch (e) {
      reModel = RoomResModel(feedback: "Cannot Connect to Server", error: true);
    }

    return reModel;
  }

  // ? join Room
  static Future<RoomResModel> joinRoom(RoomPushModel model) async {
    late RoomResModel reModel;

    try {
      var uri = Uri.parse(API.joinRoom);
      var res = await http.post(uri, body: {
        "code": model.code,
        "participantUsername": model.adminUsername,
        "participantPhone": model.adminPhone
      });

      if (res.statusCode != 200) {
        reModel = RoomResModel(feedback: "Server Side error", error: true);
      }
      var jsonRes = jsonDecode(res.body);
      reModel = RoomResModel.fromJson(jsonRes);
    } catch (e) {
      reModel = RoomResModel(feedback: "Cannot Connect to Server", error: true);
    }

    return reModel;
  }
}
