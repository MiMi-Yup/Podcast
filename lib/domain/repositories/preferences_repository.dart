import 'dart:async';

abstract class PreferencesRepository{
  FutureOr<String?> getToken();
  FutureOr<void> setToken(String token);
  FutureOr<void> clear();
}