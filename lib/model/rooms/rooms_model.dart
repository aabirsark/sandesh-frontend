class RoomPushModel {
  final String code;
  final String? roomName;
  String? adminUsername;
  String? adminPhone;

  RoomPushModel(
      {required this.code, this.roomName, this.adminUsername, this.adminPhone});
}
