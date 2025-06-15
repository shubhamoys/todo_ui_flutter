import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_ui_flutter/core/constants/storage_keys.dart';

class AuthUtils {
  static Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(StorageKeys.authToken);
    return token != null;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeys.authToken);
  }
}
