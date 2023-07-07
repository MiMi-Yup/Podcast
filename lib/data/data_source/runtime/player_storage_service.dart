import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:injectable/injectable.dart';

@singleton
class EpisodePlayerManager {
  late final AudioPlayer _audioPlayer;
  EpisodeModel? _currentEpisode;
  bool _isPlaying = false;

  EpisodePlayerManager() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        _isPlaying = false;
      }
    });
  }

  AudioPlayer get audioPlayer => _audioPlayer;

  EpisodeModel? get currentEpisode => _currentEpisode;

  bool get isPlaying => _isPlaying;

  void playEpisode(String idEpisode) async {
    if (idEpisode != _currentEpisode?.id) {
      final episodeUseCases = getIt<EpisodeUseCases>();
      final episode = await episodeUseCases.getEpisodeById(idEpisode);
      _currentEpisode = episode;
      // _audioPlayer.setUrl(episode?.href ?? '');
      _audioPlayer.setUrl(
          'https://res.cloudinary.com/psncloud/video/upload/v1685551354/sample4_k2de2y.aac?fbclid=IwAR1QYG7Y5Tptvsb-3Z45B5nOkNO47jPSVdxji7QeduW1jYk1KATmBJJRlps');
      _audioPlayer.play();
      _isPlaying = true;
    }
  }

  void play() {
    _audioPlayer.play();
    _isPlaying = true;
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
