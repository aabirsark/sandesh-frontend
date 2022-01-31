class RoomParticipantsResModel {
  String? feedback;
  bool? error;
  List<ParticipantData> data = [];

  RoomParticipantsResModel({this.feedback, this.error, required this.data});

  RoomParticipantsResModel.fromJson(Map<String, dynamic> json) {
    feedback = json['feedback'];
    error = json['error'];
    data = List<ParticipantData>.from(json["data"].map((x) => ParticipantData.fromJson(x)));
  }

 
}

class ParticipantData {
  String? username;
  String? phone;
  String? id;

  ParticipantData({this.username, this.phone, this.id});

  ParticipantData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phone = json['phone'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['adminName'] = phone;
    data['code'] = id;
    return data;
  }
}
