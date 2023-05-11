import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';

@Injectable(as: UnitOfWork)
class UnitOfWorkImpl implements UnitOfWork {
  final UserRepository userRepo;
  final SecurePreferencesRepository preferencesRepo;
  final AuthRepository authRepo;

  @override
  UserRepository get user => userRepo;

  @override
  AuthRepository get auth => authRepo;

  @override
  SecurePreferencesRepository get preferences => preferencesRepo;

  UnitOfWorkImpl(
      {required this.userRepo,
      required this.preferencesRepo,
      required this.authRepo});
}
