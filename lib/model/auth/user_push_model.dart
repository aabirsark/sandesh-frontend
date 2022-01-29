class UserPushModel {
  String username;
  String password;
  String? fullname;
  String? phNumber;

  UserPushModel(
      {required this.username,
      required this.password,
      this.fullname,
      this.phNumber});

  toJson() {
    Map<String, String> jsonData = {
      "username": username,
      "password": password,
      "fullname": fullname ?? "",
      "phone": phNumber ?? "",
      "joinedAt": _getCurrentDate()
    };

    return jsonData;
  }
}

_getCurrentDate() {
  DateTime now = DateTime.now();
  return "${now.day}/${now.month}/${now.year}";
}
