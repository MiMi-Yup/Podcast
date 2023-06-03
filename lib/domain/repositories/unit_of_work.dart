import 'package:join_podcast/data/secure_preferences_repository_impl.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';

abstract class UnitOfWork{
  UserRepository get user;
  AuthRepository get auth;
  SessionAuthenticaiton get secure;
  SharedPreferencesRepository get sharedPreferences;
}