import 'package:flutter/material.dart';
import 'package:livelife/themes/dark_theme.dart';
import 'package:livelife/themes/light_theme.dart';


class ThemeController with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }
}
