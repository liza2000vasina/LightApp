import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._();

  static SharedPreferences _sharedPreferences;

  static Future<void> _init() async {
    if (_sharedPreferences == null)
      _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void putJson(String key, String json) {
    _init().then((value) {
      _sharedPreferences.setString(key, jsonEncode(json));
    });
  }

  static void putJsons(String key, List<Map<String, dynamic>> json) {
    _init().then((value) {
      _sharedPreferences.setString(key, jsonEncode(json));
    });
  }

  static Map<String, dynamic> getJson(String key) {
    _init().then((value) {
      var value = _sharedPreferences.getString(key);
      return value != null ? jsonDecode(value) : null;
    });
  }

  static Future<List> getJsons(String key) async {
    await _init();
    var value = _sharedPreferences.getString(key);
    return value != null ? jsonDecode(value) : null;
  }

  static void putString(String key, String value) {
    _init().then((e) {
      _sharedPreferences.setString(key, value);
    });
  }

  static String getString(String key, String value) {
    _init().then((value) {
      return _sharedPreferences.get(key);
    });
  }
}
