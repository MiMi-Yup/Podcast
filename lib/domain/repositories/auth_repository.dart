import 'dart:async';

import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/response/login_user_response.dart';

abstract class AuthRepository{
  FutureOr<LoginUserResponse?> signUp(NewUserRequest signUp);
  FutureOr<LoginUserResponse?> loginByPassword(LoginUserRequest login);
}