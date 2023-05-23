import 'dart:async';

import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/request/reset_user_request.dart';
import 'package:join_podcast/models/request/verify_user_request.dart';
import 'package:join_podcast/models/response/login_user_response.dart';
import 'package:join_podcast/models/response/token_response.dart';

abstract class AuthRepository{
  FutureOr<bool?> signUp(NewUserRequest signUp);
  FutureOr<LoginUserResponse?> loginByPassword(LoginUserRequest login);
  FutureOr<bool?> verifyCreateAccount(VerifyUserRequest request);
  FutureOr<void> forgotAccount({required String email});
  FutureOr<TokenResponse?> verifyForgotAccount(VerifyUserRequest request);
  FutureOr<bool?> resetAccount({required String token, required ResetUserRequest request});
}