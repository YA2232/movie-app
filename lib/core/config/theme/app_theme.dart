import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_color.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.white,
        contentTextStyle: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.secondaryBackGround,
        hintStyle: TextStyle(
            color: Color.fromARGB(0, 227, 227, 232),
            fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              elevation: 0,
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))));

  static final darkTheme = ThemeData(
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.background,
      brightness: Brightness.dark,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColor.background,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.secondaryBackGround,
        hintStyle: TextStyle(color: Color(0xff), fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              elevation: 0,
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))));
}
