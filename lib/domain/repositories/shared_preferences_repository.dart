import 'dart:async';

import 'package:flutter/material.dart';

abstract class SharedPreferencesRepository{
  Future<ThemeMode> get getTheme;
  void setTheme(ThemeMode mode);

  Future<Locale?> get getLanguage;
  void setLanguage(Locale locale);
}