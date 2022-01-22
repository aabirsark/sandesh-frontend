import 'package:flutter/material.dart';

extension RxSize on BuildContext {
  /// return the size of the screen
  Size get screenSize => MediaQuery.of(this).size;

  /// return the height of the screen
  double get screenHeight => MediaQuery.of(this).size.height;

  /// return the width of the screen
  double get screenWidth => MediaQuery.of(this).size.width;
}
