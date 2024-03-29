import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/auth_service.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/models/request/auth/new_user_request.dart';
import 'package:join_podcast/models/request/auth/login_user_request.dart';
import 'package:join_podcast/models/request/auth/verify_user_request.dart';
import 'package:join_podcast/models/request/auth/reset_user_request.dart';
import 'package:join_podcast/models/response/auth/login_user_response.dart';
import 'package:join_podcast/models/response/auth/reset_token_response.dart';
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
  FutureOr<ResetTokenResponse?> verifyForgotAccount(VerifyUserRequest request) {
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
