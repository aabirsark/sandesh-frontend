class API {
  static String api = "http://192.168.42.117:8000";

  // ? For Authentication
  static String loginUri = "$api/login";
  static String createUser = "$api/createUser";
  static String getAllUsers = "$api/users";

  // ? for Joining Room
  static String createNewRoom = "$api/createNewRoom";
  static String joinRoom = "$api/joinRoom";
  static String getRoomParticipants = "$api/roomParti";
}
