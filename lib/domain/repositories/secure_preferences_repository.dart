import 'dart:async';

abstract class SecurePreferencesRepository {
  Future<String?> getToken({bool newSession = false});
  Future<void> setToken({required String token, bool remember = false});
  Future<void> clear();
}
