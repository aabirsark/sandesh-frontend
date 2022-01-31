import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sandesh/app/api/api.dart';
import 'package:sandesh/model/rooms/room_participants.res.model.dart';
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

  static Future<RoomParticipantsResModel> getRoomParticipants(
      String code) async {
    late RoomParticipantsResModel reModel;

    try {
      var uri = Uri.parse(API.getRoomParticipants);

      var res = await http.post(uri, body: {"code": code});

      var jsonData = jsonDecode(res.body);
      reModel = RoomParticipantsResModel.fromJson(jsonData);
    } catch (e) {
      reModel = RoomParticipantsResModel(
          feedback: "An error occured", error: true, data: []);
    }
    return reModel;
  }

  static Future deleteRoom(String code, String username) async {
    try {
      var uri = Uri.parse(API.deleteUser);

      await http.delete(uri, body: {"code": code, "name": username});
      return true;
    } catch (e) {
      return false;
    }
  }
}
