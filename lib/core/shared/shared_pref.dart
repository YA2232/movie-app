import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> setDarkMode(bool value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDark", value);
  }

  static Future<bool?> getDarkMode() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool("isDark");
  }
}
