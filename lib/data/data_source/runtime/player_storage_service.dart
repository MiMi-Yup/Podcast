import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:injectable/injectable.dart';

@singleton
class EpisodePlayerManager {
  late final AudioPlayer _audioPlayer;
  late List<EpisodeModel> _currentListEpisodes;
  EpisodeModel? _currentEpisode;
  bool _isPlaying = false;

  EpisodePlayerManager() {
    _audioPlayer = AudioPlayer();
    _currentListEpisodes = [];
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        _isPlaying = false;
      }
    });
  }

  AudioPlayer get audioPlayer => _audioPlayer;

  EpisodeModel? get currentEpisode => _currentEpisode;

  bool get isPlaying => _isPlaying;

  List<EpisodeModel> get currentListEpisodes => _currentListEpisodes;

  void playEpisode(String idEpisode) async {
    if (idEpisode != _currentEpisode?.id) {
      final episodeUseCases = getIt<EpisodeUseCases>();
      final episode = await episodeUseCases.getEpisodeById(idEpisode);
      _currentEpisode = episode;
      _audioPlayer.setUrl(episode?.href ?? '');
      _audioPlayer.play();
      _isPlaying = true;

      final log = getIt<UserRepository>();
      await log.addHistory(idEpisode);
    }
  }

  void setListEpisodes(List<EpisodeModel> list) {
    _currentListEpisodes = list;
  }

  void play() {
    _audioPlayer.play();
    _isPlaying = true;

    if (currentEpisode?.id != null) {
      final log = getIt<UserRepository>();
      log.addHistory(currentEpisode!.id!);
    }
  }

  void pause() {
    _audioPlayer.pause();
    _isPlaying = false;
  }

  void replay() {
    _audioPlayer.seek(
      Duration.zero,
      index: _audioPlayer.effectiveIndices!.first,
    );
    _isPlaying = true;
  }

  void setSpeed(double speed) {
    _audioPlayer.setSpeed(speed);
  }
}
