import 'package:flutter/foundation.dart';

class HomeStateProvider with ChangeNotifier {
  // ? varialbles
  String _page = "Chats";

  // ? setter
  changePageState(String pageStatus) {
    _page = pageStatus;
    notifyListeners();
  }

  // ? getter
  String get chatPage => _page;
}
