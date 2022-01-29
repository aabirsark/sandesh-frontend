class RoomResModel {
  String? feedback;
  bool? error;
  Data? data;

  RoomResModel({this.feedback, this.error, this.data});

  RoomResModel.fromJson(Map<String, dynamic> json) {
    feedback = json['feedback'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? roomname;
  String? adminName;
  String? code;

  Data({this.roomname, this.adminName, this.code});

  Data.fromJson(Map<String, dynamic> json) {
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
