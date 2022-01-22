import 'package:flutter/material.dart';

extension RxNaviagation on BuildContext {
  void navigateTo(Widget child) => Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => child,
      ));

  void navigateBack() => Navigator.pop(this);

  void replaceContext(Widget child) => Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) => child,
      ));
}
