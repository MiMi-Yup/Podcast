import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/session_info.dart';
import 'package:join_podcast/domain/repositories/auth_repository.dart';
import 'package:join_podcast/domain/repositories/category_repository.dart';
import 'package:join_podcast/domain/repositories/download_repository.dart';
import 'package:join_podcast/domain/repositories/episode_repository.dart';
import 'package:join_podcast/domain/repositories/media_repository.dart';
import 'package:join_podcast/domain/repositories/playlist_repository.dart';
import 'package:join_podcast/domain/repositories/podcast_repository.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';

@Injectable(as: UnitOfWork)
class UnitOfWorkImpl implements UnitOfWork {
  UnitOfWorkImpl(
      {required this.auth,
      required this.session,
      required this.sharedPreferences,
      required this.user,
      required this.media,
      required this.playlist,
      required this.episode,
      required this.podcast,
      required this.download,
      required this.category});

  @override
  final AuthRepository auth;

  @override
  final SessionInfo session;

  @override
  final SharedPreferencesRepository sharedPreferences;

  @override
  final UserRepository user;

  @override
  final MediaRepository media;

  @override
  final PlaylistRepository playlist;

  @override
  final EpisodeRepository episode;

  @override
  final PodcastRepository podcast;

  @override
  final DownloadRepository download;

  @override
  final CategoryRepository category;
}
