import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/auth_service.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/verify_user_request.dart';
import 'package:join_podcast/models/request/reset_user_request.dart';
import 'package:join_podcast/models/response/login_user_response.dart';
import 'package:join_podcast/models/response/token_response.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthService? authService;

  AuthRepositoryImpl({required this.authService});

  @override
  FutureOr<LoginUserResponse?> loginByPassword(LoginUserRequest login) {
    return authService
        ?.login(login)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<bool?> signUp(NewUserRequest signUp) {
    return authService?.signUp(signUp).then((_) => true).catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<void> forgotAccount({required String email}) {
    return authService
        ?.forgotAccount(VerifyUserRequest(email: email, code: ''))
        .catchError((onError) {
      ExceptionUtil.handle(onError);
    });
  }

  @override
  FutureOr<bool?> verifyCreateAccount(VerifyUserRequest request) {
    return authService
        ?.verifyCreate(request)
        .then((_) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<TokenResponse?> verifyForgotAccount(VerifyUserRequest request) {
    return authService
        ?.verifyForgot(request)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<bool?> resetAccount(
      {required String token, required ResetUserRequest request}) {
    return authService
        ?.resetAccount(token, request)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }
}
