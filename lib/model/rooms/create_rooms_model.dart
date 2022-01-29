import 'package:sandesh/app/database/userdata/userData.db.dart';

class RoomPushModel {
  final String code;
  final String? roomName;
  String? adminUsername = UserDataDB.username;
  String? adminPhone = UserDataDB.phone;

  RoomPushModel(
      {required this.code, this.roomName, this.adminUsername, this.adminPhone});
}
