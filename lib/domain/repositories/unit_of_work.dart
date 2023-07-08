import 'package:join_podcast/data/session_info.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/domain/repositories/category_repository.dart';
import 'package:join_podcast/domain/repositories/download_repository.dart';
import 'package:join_podcast/domain/repositories/episode_repository.dart';
import 'package:join_podcast/domain/repositories/media_repository.dart';
import 'package:join_podcast/domain/repositories/playlist_repository.dart';
import 'package:join_podcast/domain/repositories/podcast_repository.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';

abstract class UnitOfWork {
  UserRepository get user;
  AuthRepository get auth;
  SessionInfo get session;
  MediaRepository get media;
  PlaylistRepository get playlist;
  EpisodeRepository get episode;
  PodcastRepository get podcast;
  SharedPreferencesRepository get sharedPreferences;
  DownloadRepository get download;
  CategoryRepository get category;
}
