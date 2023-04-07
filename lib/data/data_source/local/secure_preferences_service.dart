import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@singleton
class SecurePreferencesService {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock));

  FutureOr<String?> readValue(String key) async => await storage.read(key: key);

  FutureOr<void> writeValue(String key, String value) async =>
      await storage.write(key: key, value: value);

  FutureOr<void> delete(String key) async => await storage.delete(key: key);

  FutureOr<void> clear() async => await storage.deleteAll();
}
