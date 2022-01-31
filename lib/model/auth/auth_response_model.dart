class AuthResponseModel {
  late String _feedback;
  UserData? _data;
  late bool _error;

  AuthResponseModel(
      {required String feedback, UserData? data, required bool error}) {
    _feedback = feedback;
    _data = data;
    _error = error;
  }

  String get feedback => _feedback;
  UserData? get data => _data;
  bool get err => _error;

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    _feedback = json['feedback'];
    _data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feedback'] = _feedback;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    data['error'] = _error;
    return data;
  }
}

class UserData {
  String? _id;
  String? _username;
  String? _name;
  String? _phNumber;

  UserData({required String id, required String username, required String name, required String phNumber}) {
    _id = id;
    _username = username;
    _name = name;
    _phNumber = phNumber;
  }

  String? get uid => _id;
  String? get username => _username;
  String? get name => _name;
  String? get phNumber => _phNumber;

  UserData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _name = json['name'];
    _phNumber = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['username'] = _username;
    data['name'] = _name;
    data['phone'] = _phNumber;
    return data;
  }
}
