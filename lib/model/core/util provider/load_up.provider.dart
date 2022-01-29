import 'package:flutter/foundation.dart';

class LoadUpProvider with ChangeNotifier {
  bool _showLoading = false;

  changeLoadingState() {
    _showLoading = !_showLoading;
    notifyListeners();
  }

  bool get loading => _showLoading;
}
