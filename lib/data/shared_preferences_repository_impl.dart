import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/local/shared_preferences_service.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';

@Injectable(as: SharedPreferencesRepository)
class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferencesService storage;

  SharedPreferencesRepositoryImpl({required this.storage});

  @override
  Future<ThemeMode> getTheme() async {
    String? value = await storage.readValue("theme");
    switch (value) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  @override
  void setTheme(ThemeMode mode) async {
    switch (mode) {
      case ThemeMode.dark:
        await storage.writeValue("theme", "dark");
        break;
      case ThemeMode.light:
        storage.writeValue("theme", "light");
        break;
      default:
        break;
    }
  }
}
