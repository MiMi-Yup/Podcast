import 'package:configuration/environment/build_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/auth_service.dart';
import 'package:join_podcast/data/data_source/remote/episode_service.dart';
import 'package:join_podcast/data/data_source/remote/media_service.dart';
import 'package:join_podcast/data/data_source/remote/playlist_service.dart';
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

  Dio _auth() {
    Dio dio = getIt<Dio>();
    String? token = _token();
    if (token != null && token.isNotEmpty) {
      dio.options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return dio;
  }

  @injectable
  UserService get userService {
    return UserService(
      _auth(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }

  @injectable
  PodcastsService get podcastsService {
    return PodcastsService(
      _auth(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }

  @injectable
  MediaService get mediaService {
    return MediaService(
      _auth(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }

  @injectable
  EpisodeService get episodeService {
    return EpisodeService(
      _auth(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }

  @injectable
  PlaylistService get playlistService {
    return PlaylistService(
      _auth(),
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
