import 'dart:async';

import 'package:flutter/material.dart';

abstract class SharedPreferencesRepository{
  Future<ThemeMode> getTheme();
  void setTheme(ThemeMode mode);
}