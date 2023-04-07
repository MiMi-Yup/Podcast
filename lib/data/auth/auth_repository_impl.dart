import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/auth_service.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/response/login_user_response.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthService? authService;

  AuthRepositoryImpl({required this.authService});

  @override
  FutureOr<LoginUserResponse?> loginByPassword(LoginUserRequest login) {
    return authService?.login(login).catchError((onError){
      ExceptionUtil.handle(onError);
      return LoginUserResponse();
    });
  }

  @override
  FutureOr<LoginUserResponse?> signUp(NewUserRequest signUp) {
    return authService?.signUp(signUp);
  }
}
