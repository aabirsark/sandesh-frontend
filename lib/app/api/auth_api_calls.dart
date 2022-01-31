import 'dart:convert';

import 'package:sandesh/app/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:sandesh/model/auth/auth_response_model.dart';
import 'package:sandesh/model/auth/user_push_model.dart';

class AuthApi {
  static Future<AuthResponseModel> loginUser(UserPushModel model) async {
    late AuthResponseModel resModel;

    try {
      var uri = Uri.parse(API.loginUri);
      var res = await http.post(uri,
          body: {"username": model.username, "password": model.password});
      var jsonRes = jsonDecode(res.body);

      if (res.statusCode != 200) {
        resModel =
            AuthResponseModel(feedback: "Server Side error", error: true);
      }

      resModel = AuthResponseModel.fromJson(jsonRes);
    } catch (e) {
      resModel =
          AuthResponseModel(feedback: "Cannot connect to server", error: true);
    }

    return resModel;
  }

  static Future<AuthResponseModel> createUser(UserPushModel model) async {
    late AuthResponseModel resModel;

    try {
      var uri = Uri.parse(API.createUser);
      var res = await http.post(uri, body: model.toJson());
      var jsonRes = jsonDecode(res.body);
      print(jsonRes);

      if (res.statusCode != 200) print("Some error");

      resModel = AuthResponseModel.fromJson(jsonRes);
    } catch (e) {
      resModel =
          AuthResponseModel(feedback: "Cannot connect to server", error: true);
    }

    return resModel;
  }

  static Future<_GetAllUserData> getAllUsers() async {
    late _GetAllUserData users;

    try {
      var uri = Uri.parse(API.getAllUsers);
      var res = await http.get(uri);
      print(res.body);
      var jsonRes = jsonDecode(res.body);

      if (res.statusCode != 200) print("Some error");

      users = _GetAllUserData.fromJson(jsonRes);
    } catch (e) {
      users = _GetAllUserData(data: []);
    }

    return users;
  }
}

class _GetAllUserData {
  List<UserData> data = [];

  _GetAllUserData({required this.data});

  _GetAllUserData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data.add(UserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
