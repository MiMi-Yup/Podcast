import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/secure_preferences_repository_impl.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';

@Injectable(as: UnitOfWork)
class UnitOfWorkImpl implements UnitOfWork {
  UnitOfWorkImpl(
      {required this.auth,
      required this.secure,
      required this.sharedPreferences,
      required this.user});

  @override
  final AuthRepository auth;

  @override
  final SessionAuthenticaiton secure;

  @override
  final SharedPreferencesRepository sharedPreferences;

  @override
  final UserRepository user;
}
