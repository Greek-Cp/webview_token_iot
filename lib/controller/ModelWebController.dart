import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModelWebController {
  String webUrl = '';
  final String _webUrlKey = 'KEY_PREF_WEB';

  // Mengambil webUrl dari shared preferences
  Future<void> loadWebUrl() async {
    final prefs = await SharedPreferences.getInstance();
    webUrl = prefs.getString(_webUrlKey) ?? '';
  }

  // Menyimpan webUrl ke shared preferences
  Future<void> saveWebUrl() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_webUrlKey, webUrl);
  }
}
