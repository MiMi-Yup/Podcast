import 'dart:async';

import 'package:join_podcast/models/request/users/change_password_request.dart';
import 'package:join_podcast/models/request/users/update_request.dart';
import 'package:join_podcast/models/response/users/user_response.dart';

abstract class UserRepository{
  Future<UserResponse?> getCurrentUser();
  FutureOr<bool?> changePassword(UserChangePasswordRequest request);
  FutureOr<UserResponse?> updateInfo(UserUpdateRequest request);
  FutureOr<UserResponse?> getUserById(String id);
}