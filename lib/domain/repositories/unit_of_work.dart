import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/domain/repositories/preferences_repository.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';

abstract class UnitOfWork{
  UserRepository get user;
  AuthRepository get auth;
  PreferencesRepository get preferences;
}