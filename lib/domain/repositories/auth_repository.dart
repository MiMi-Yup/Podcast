import 'dart:async';

import 'package:join_podcast/models/request/auth/login_user_request.dart';
import 'package:join_podcast/models/request/auth/new_user_request.dart';
import 'package:join_podcast/models/request/auth/reset_user_request.dart';
import 'package:join_podcast/models/request/auth/verify_user_request.dart';
import 'package:join_podcast/models/response/auth/login_user_response.dart';
import 'package:join_podcast/models/response/auth/reset_token_response.dart';

abstract class AuthRepository{
  FutureOr<bool?> signUp(NewUserRequest signUp);
  FutureOr<LoginUserResponse?> loginByPassword(LoginUserRequest login);
  FutureOr<bool?> verifyCreateAccount(VerifyUserRequest request);
  FutureOr<void> forgotAccount({required String email});
  FutureOr<ResetTokenResponse?> verifyForgotAccount(VerifyUserRequest request);
  FutureOr<bool?> resetAccount({required String token, required ResetUserRequest request});
}