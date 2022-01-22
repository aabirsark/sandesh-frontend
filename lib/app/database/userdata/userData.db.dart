import 'package:hive/hive.dart';

class UserDataDB {
  // ? Making class singleton

  static final UserDataDB _singleton = UserDataDB._internal();

  factory UserDataDB() {
    return _singleton;
  }

  UserDataDB._internal();

  // -----------------------------

  static Future config() async {
    await Hive.openBox(_hiveBoxName);
    _userDataBox = Hive.box(_hiveBoxName);
  }

  static const _hiveBoxName = "userData";

  static late Box _userDataBox;

  // ? Setters -----------------------------------

  static putAllFields(
      {required String uid, required String username, required String name}) {
    _userDataBox.put("uid", uid);
    _userDataBox.put("username", username);
    _userDataBox.put("name", name);
  }

  static putUserId(String uid) {
    _userDataBox.put("uid", uid);
  }

  static putUserName(String username) {
    _userDataBox.put("username", username);
  }

  static putUserFullName(String name) {
    _userDataBox.put("name", name);
  }

  // -----------------------------------

  // ? Getters ---------------------------------------------

  static String? get uid => _userDataBox.get("uid");
  static String? get username => _userDataBox.get("username");
  static String? get name => _userDataBox.get("name");
}
