import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/local/secure_preferences_service.dart';
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart';

@Injectable(as: SecurePreferencesRepository)
class SecurePreferencesRepositoryImpl implements SecurePreferencesRepository {
  final SecurePreferencesService storage;

  SecurePreferencesRepositoryImpl({required this.storage});

  @override
  FutureOr<void> clear() {
    storage.clear();
  }

  @override
  FutureOr<String?> getToken() {
    return storage.readValue('jwt:token');
  }

  @override
  FutureOr<void> setToken(String token) {
    return storage.writeValue('jwt:token', token);
  }
}
