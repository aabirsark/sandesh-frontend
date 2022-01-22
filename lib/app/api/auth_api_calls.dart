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
      print(jsonRes);

      if (res.statusCode != 200) print("Some error");

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
}
