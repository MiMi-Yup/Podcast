import 'dart:async';

abstract class SecurePreferencesRepository{
  FutureOr<String?> getToken();
  FutureOr<void> setToken(String token);
  FutureOr<void> clear();
}