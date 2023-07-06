import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart';
import 'package:join_podcast/models/user_model.dart';

@singleton
class SessionInfo {
  final SecurePreferencesRepository secureRepo;
  UserModel? _user;
  String? _token;

  SessionInfo({required this.secureRepo});

  String? get token => _token;
  UserModel? get user => _user;

  Future<void> init() async {
    _token = await secureRepo.getToken(newSession: true);
  }

  void logout() {
    _token = null;
    secureRepo.clear();
  }

  void login({required String token, required bool remember, UserModel? user}) {
    _token = token;
    _user = user;
    secureRepo.setToken(token: token, remember: remember);
  }

  void updateUser({required UserModel user}) {
    _user = user;
  }
}
