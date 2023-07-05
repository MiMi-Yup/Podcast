import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/user_service.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';
import 'package:join_podcast/models/request/users/change_password_request.dart';
import 'package:join_podcast/models/request/users/update_request.dart';
import 'package:join_podcast/models/response/users/user_response.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserService userService;
  UserRepositoryImpl({required this.userService});

  @override
  Future<UserResponse?> getCurrentUser() {
    return userService
        .getCurrentProfile()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<bool?> changePassword(UserChangePasswordRequest request) {
    return userService
        .changePassword(request)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<UserResponse?> getUserById(String id) {
    return userService
        .getUserById(id)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<UserResponse?> updateInfo(UserUpdateRequest request) {
    return userService
        .updateUser(request)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }
}
