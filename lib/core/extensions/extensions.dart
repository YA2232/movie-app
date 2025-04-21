import 'package:flutter/material.dart';

extension DarkTheme on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
