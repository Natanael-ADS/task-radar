import 'package:flutter/material.dart';

final class AppThemeController extends ChangeNotifier {
  AppThemeController({ThemeMode initialMode = ThemeMode.system})
    : _themeMode = initialMode;

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;

    _themeMode = mode;
    notifyListeners();
  }

  void toggleLightDark() {
    setThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
