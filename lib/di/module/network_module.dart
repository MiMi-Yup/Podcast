import 'package:configuration/environment/build_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/auth_service.dart';
import 'package:join_podcast/data/data_source/remote/user_service.dart';
import 'package:join_podcast/data/secure_preferences_repository_impl.dart';
import 'package:join_podcast/di/di.dart';

@module
abstract class NetworkModule {
  @injectable
  UserService get userService {
    Dio dio = getIt<Dio>();
    SessionAuthenticaiton session = getIt<SessionAuthenticaiton>();
    String? token = session.token;
    if (token != null && token.isNotEmpty) {
      dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return UserService(
      dio,
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }

  @injectable
  AuthService get authService {
    return AuthService(
      getIt<Dio>(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }
}
