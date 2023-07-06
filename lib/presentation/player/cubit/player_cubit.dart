import 'package:configuration/style/style.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/presentation/player/ui/widgets/custom_modal_bottom_sheet.dart';
import 'package:join_podcast/presentation/player/ui/widgets/speed_bottom_modal_sheet.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../ui/widgets/seekbar.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

part 'player_state.dart';

@injectable
class PlayerCubit extends Cubit<PlayerState> {
  final EpisodeUseCases episodeUseCases;
  final String id;

  PlayerCubit({required this.id, required this.episodeUseCases})
      : super(PlayerState.initial()) {
    initializeCubit();
  }

  Future<void> initializeCubit() async {
    final episode = await episodeUseCases.getEpisodeById(id);
    final author = await episode?.podcastEx;
    emit(state.copyWith(episode: episode, author: author?.author?.name));
    // state.audioPlayer.setUrl(state.episode?.href ??
    //     'https://res.cloudinary.com/psncloud/video/upload/v1685551354/sample4_k2de2y.aac?fbclid=IwAR1QYG7Y5Tptvsb-3Z45B5nOkNO47jPSVdxji7QeduW1jYk1KATmBJJRlps');
    state.audioPlayer.setUrl(
        'https://res.cloudinary.com/psncloud/video/upload/v1685551354/sample4_k2de2y.aac?fbclid=IwAR1QYG7Y5Tptvsb-3Z45B5nOkNO47jPSVdxji7QeduW1jYk1KATmBJJRlps');
    updateSelectedSpeed(1);
    state.audioPlayer.play();
    // for (var element in listEpisodeModel) {
    //   if (element?.id != id) {
    //     episodeList.add(AudioSource.uri(Uri.parse(element?.href ?? '')));
    //   }
    // }
    // state.audioPlayer
    //     .setAudioSource(ConcatenatingAudioSource(children: episodeList));
  }

// Change speed
  void updateSelectedSpeed(double speed) {
    state.audioPlayer.setSpeed(speed);
    emit(state.copyWith(selectedSpeed: speed));
  }

// Add to playlist
  void showModalPlaylist(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      builder: (BuildContext context) {
        return CustomModalBottomSheet(
          onCreatePlaylist: () {
            // Xử lý sự kiện tạo danh sách phát mới
          },
          onFinish: () {
            // Xử lý sự kiện khi hoàn thành
          },
        );
      },
    );
  }

  Stream<SeekBarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        state.audioPlayer.positionStream,
        state.audioPlayer.durationStream,
        (Duration position, Duration? duration) {
          return SeekBarData(
            position,
            duration ?? Duration.zero,
          );
        },
      );

  // Hiển thị ModalBottomSheet điều chỉnh tốc độ
  void showPlaybackSpeedModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SpeedChange(
            speed: state.selectedSpeed,
            onSpeedChanged: updateSelectedSpeed,
          );
        });
  }

// Tua sau 10s
  void skipForward() {
    state.audioPlayer
        .seek(state.audioPlayer.position + const Duration(seconds: 10));
  }

  void skipBackward() {
    state.audioPlayer.seek(
        state.audioPlayer.position > const Duration(seconds: 10)
            ? state.audioPlayer.position - const Duration(seconds: 10)
            : Duration.zero);
  }

  @override
  Future<void> close() {
    state.audioPlayer.dispose();
    return super.close();
  }
}
