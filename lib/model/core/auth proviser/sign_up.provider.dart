import 'package:flutter/foundation.dart';
import 'package:sandesh/model/auth/auth_response_model.dart';

class SignUpProvider with ChangeNotifier {
  bool _showLoading = false;

  changeLoadingState() {
    _showLoading = !_showLoading;
    notifyListeners();
  }

  bool get loading => _showLoading;
}
