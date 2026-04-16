import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

final class AppThemeCubit extends Cubit<ThemeMode> {
  AppThemeCubit({ThemeMode initialMode = ThemeMode.system})
    : super(initialMode);

  bool get isDarkMode => state == ThemeMode.dark;

  void setThemeMode(ThemeMode mode) {
    if (state == mode) return;

    emit(mode);
  }

  void toggleLightDark() {
    setThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
