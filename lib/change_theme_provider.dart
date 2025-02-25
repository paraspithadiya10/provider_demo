import 'package:flutter/material.dart';

class ChangeThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  bool get getThemeMode => isDarkMode;

  bool changeThemeMode(bool value) {
    isDarkMode = value;
    notifyListeners();

    return isDarkMode;
  }
}
