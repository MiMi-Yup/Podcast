import 'dart:async';

import 'package:configuration/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/local/shared_preferences_service.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:collection/src/iterable_extensions.dart';

@Injectable(as: SharedPreferencesRepository)
class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferencesService storage;

  SharedPreferencesRepositoryImpl({required this.storage});

  @override
  Future<ThemeMode> get getTheme async {
    String? value = await storage.readStringValue("theme");
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
        await storage.writeStringValue("theme", "dark");
        break;
      case ThemeMode.light:
        storage.writeStringValue("theme", "light");
        break;
      default:
        break;
    }
  }

  @override
  Future<Locale?> get getLanguage async {
    String? value = await storage.readStringValue("language");
    return MultiLanguage.delegate.supportedLocales
        .firstWhereOrNull((element) => element.languageCode == value);
  }

  @override
  void setLanguage(Locale locale) async {
    await storage.writeStringValue('language', locale.languageCode);
  }

  @override
  Future<bool> get getAutodownload async {
    bool? value = await storage.readBoolValue("autoDownload");
    return value ?? false;
  }

  @override
  Future<bool> get getDownloadWifi async {
    bool? value = await storage.readBoolValue("downloadIfWifi");
    return value ?? false;
  }

  @override
  Future<int?> get getRemoveCompleted async =>
      await storage.readIntValue("removeCompleted");

  @override
  Future<int?> get getRemoveUnfinished async =>
      await storage.readIntValue("removeUnfinished");

  @override
  void setAutodownload(bool value) async {
    await storage.writeBoolValue("autoDownload", value);
  }

  @override
  void setDownloadWifi(bool value) async {
    await storage.writeBoolValue("downloadIfWifi", value);
  }

  @override
  void setRemoveCompleted(int value) async {
    await storage.writeIntValue("removeCompleted", value);
  }

  @override
  void setRemoveUnfinished(int value) async {
    await storage.writeIntValue("removeUnfinished", value);
  }
}
