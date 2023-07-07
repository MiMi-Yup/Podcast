import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/runtime/player_storage_service.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/presentation/player/ui/widgets/custom_modal_bottom_sheet.dart';
import 'package:join_podcast/presentation/player/ui/widgets/speed_bottom_modal_sheet.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../ui/widgets/seekbar.dart';

part 'player_state.dart';

@injectable
class PlayerCubit extends Cubit<PlayerState> {
  final EpisodeUseCases episodeUseCases;
  final EpisodePlayerManager episodePlayerManager;
  final String id;

  PlayerCubit(
      {required this.id,
      required this.episodeUseCases,
      required this.episodePlayerManager})
      : super(PlayerState.initial()) {
    initializeCubit();
  }

  Future<void> initializeCubit() async {
    if (id != episodePlayerManager.currentEpisode?.id) {
      final episode = await episodeUseCases.getEpisodeById(id);
      final author = await episode?.podcastEx;
      emit(state.copyWith(episode: episode, author: author?.author?.name));
      episodePlayerManager.playEpisode(id);
      updateSelectedSpeed(1);
    } else {
      final author = await episodePlayerManager.currentEpisode?.podcastEx;
      emit(state.copyWith(
          episode: episodePlayerManager.currentEpisode,
          author: author?.author?.name));
      episodePlayerManager.playEpisode(id);
      emit(state.copyWith(
          selectedSpeed: episodePlayerManager.audioPlayer.speed));
    }
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
    episodePlayerManager.setSpeed(speed);
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
          listTitle: const ["nd1", "nd2", "nd3", "nd4", "nd5", "nd6", "nd7"],
        );
      },
    );
  }

  Stream<SeekBarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        episodePlayerManager.audioPlayer.positionStream,
        episodePlayerManager.audioPlayer.durationStream,
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
    episodePlayerManager.audioPlayer.seek(
        episodePlayerManager.audioPlayer.position +
            const Duration(seconds: 10));
  }

  void skipBackward() {
    episodePlayerManager.audioPlayer.seek(
        episodePlayerManager.audioPlayer.position > const Duration(seconds: 10)
            ? episodePlayerManager.audioPlayer.position -
                const Duration(seconds: 10)
            : Duration.zero);
  }
}
