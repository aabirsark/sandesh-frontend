class RoomResModel {
  String? feedback;
  bool? error;
  RoomData? data;

  RoomResModel({this.feedback, this.error, this.data});

  RoomResModel.fromJson(Map<String, dynamic> json) {
    feedback = json['feedback'];
    error = json['error'];
    data = json['data'] != null ? RoomData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feedback'] = feedback;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RoomData {
  String? roomname;
  String? adminName;
  String? code;

  RoomData({this.roomname, this.adminName, this.code});

  RoomData.fromJson(Map<String, dynamic> json) {
    roomname = json['roomname'];
    adminName = json['adminName'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomname'] = roomname;
    data['adminName'] = adminName;
    data['code'] = code;
    return data;
  }
}
