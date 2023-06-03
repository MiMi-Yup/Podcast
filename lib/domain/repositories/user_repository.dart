import 'dart:async';

import 'package:join_podcast/models/request/users/change_password_request.dart';
import 'package:join_podcast/models/response/users/profile_response.dart';

abstract class UserRepository{
  FutureOr<ProfileResponse?> getCurrentUser();
  FutureOr<bool?> changePassword(UserChangePasswordRequest request);
}