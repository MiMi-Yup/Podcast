import 'dart:async';

import 'package:flutter/material.dart';

abstract class SharedPreferencesRepository{
  Future<ThemeMode> get getTheme;
  void setTheme(ThemeMode mode);

  Future<Locale?> get getLanguage;
  void setLanguage(Locale locale);

  Future<int?> get getRemoveCompleted;
  void setRemoveCompleted(int value);

  Future<int?> get getRemoveUnfinished;
  void setRemoveUnfinished(int value);

  Future<bool> get getAutodownload;
  void setAutodownload(bool value);

  Future<bool> get getDownloadWifi;
  void setDownloadWifi(bool value);
}