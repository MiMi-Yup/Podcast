import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/local/secure_preferences_service.dart';
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart';

@singleton
class SessionAuthenticaiton {
  final SecurePreferencesRepository secureRepo;

  SessionAuthenticaiton({required this.secureRepo});

  Future<void> init() async {
    _token = await secureRepo.getToken(newSession: true);
  }

  String? _token;
  String? get token => _token;

  void logout() {
    _token = null;
    secureRepo.clear();
  }

  void login({required String token, required bool remember}) {
    _token = token;
    secureRepo.setToken(token: token, remember: remember);
  }
}

@Injectable(as: SecurePreferencesRepository)
class SecurePreferencesRepositoryImpl implements SecurePreferencesRepository {
  final SecurePreferencesService storage;

  SecurePreferencesRepositoryImpl({required this.storage});

  @override
  Future<void> clear() async {
    await storage.clear();
  }

  @override
  Future<String?> getToken({bool newSession = false}) async {
    String? token = await storage.readValue('jwt:token');
    String? remember = await storage.readValue('jwt:remember');
    if (token == null || (newSession && remember == "0")) return null;
    return token;
  }

  @override
  Future<void> setToken({required String token, bool remember = false}) async {
    await storage.writeValue('jwt:token', token);
    await storage.writeValue('jwt:remember', remember ? "1" : "0");
  }
}
