import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/api_service.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';
import 'package:join_podcast/models/response/get_user_response.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  ApiService? api;
  UserRepositoryImpl({this.api});

  @override
  FutureOr<GetUserResponse> getCurrentUser() {
    // TODO: implement GetCurrentUser
    throw UnimplementedError();
  }
}
