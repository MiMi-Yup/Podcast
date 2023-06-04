import 'package:configuration/environment/build_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/auth_service.dart';
import 'package:join_podcast/data/data_source/remote/podcasts_service.dart';
import 'package:join_podcast/data/data_source/remote/user_service.dart';
import 'package:join_podcast/data/session_info.dart';
import 'package:join_podcast/di/di.dart';

@module
abstract class NetworkModule {
  String? _token() {
    SessionInfo session = getIt<SessionInfo>();
    return session.token;
  }

  @injectable
  UserService get userService {
    Dio dio = getIt<Dio>();
    String? token = _token();
    if (token != null && token.isNotEmpty) {
      dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return UserService(
      dio,
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }

  @injectable
  PodcastsService get podcastsService {
    Dio dio = getIt<Dio>();
    String? token = _token();
    if (token != null && token.isNotEmpty) {
      dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return PodcastsService(
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
