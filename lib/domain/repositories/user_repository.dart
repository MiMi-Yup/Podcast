import 'dart:async';

import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/response/get_user_response.dart';

abstract class UserRepository{
  FutureOr<GetUserResponse> getCurrentUser();
}