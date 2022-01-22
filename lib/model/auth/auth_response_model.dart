class AuthResponseModel {
  late String _feedback;
  Data? _data;
  late bool _error;

  AuthResponseModel(
      {required String feedback, Data? data, required bool error}) {
    _feedback = feedback;
    _data = data;
    _error = error;
  }

  String get feedback => _feedback;
  Data? get data => _data;
  bool get err => _error;

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    _feedback = json['feedback'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['feedback'] = _feedback;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    data['error'] = _error;
    return data;
  }
}

class Data {
  String? _id;
  String? _username;
  String? _name;

  Data({required String id, required String username, required String name}) {
    _id = id;
    _username = username;
    _name = name;
  }

  String? get uid => _id;
  String? get username => _username;
  String? get name => _name;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['username'] = _username;
    data['name'] = _name;
    return data;
  }
}
