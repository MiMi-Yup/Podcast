import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesService {
  FutureOr<String?> readValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  FutureOr<void> writeValue(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  FutureOr<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
