import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/shared/shared_pref.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);
  void toggleTheme(bool isDark) async {
    await SharedPref.setDarkMode(isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
