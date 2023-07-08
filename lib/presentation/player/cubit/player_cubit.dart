import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/common/widgets/m_text_field_bottom_modal.dart';
import 'package:join_podcast/data/data_source/runtime/player_storage_service.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/presentation/player/ui/widgets/custom_modal_bottom_sheet.dart';
import 'package:join_podcast/presentation/player/ui/widgets/speed_bottom_modal_sheet.dart';
import 'package:join_podcast/utils/download_util.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../ui/widgets/seekbar.dart';
import 'package:get/get.dart';

part 'player_state.dart';

@injectable
class PlayerCubit extends Cubit<PlayerState> {
  final EpisodeUseCases episodeUseCases;
  final PlaylistUseCases playlistUseCases;
  final EpisodePlayerManager episodePlayerManager;
  final String id;
  final List<EpisodeModel> listEpisodes;

  PlayerCubit(
      {required this.id,
      required this.episodeUseCases,
      required this.episodePlayerManager,
      required this.listEpisodes,
      required this.playlistUseCases})
      : super(PlayerState.initial()) {
    initializeCubit();
  }

  Future<void> initializeCubit() async {
    if (id != episodePlayerManager.currentEpisode?.id) {
      //  Lấy thông tin Episode và author
      final episode = await episodeUseCases.getEpisodeById(id);
      final author = await episode?.podcastEx;

      // Xác nhận episode được chọn có trong danh sách hiện phát không, nếu không tạo và gán danh sách mới và reset AudioSources
      if (!episodePlayerManager.currentListEpisodes.contains(episode)) {
        emit(state.copyWith(
            episode: episode, author: author?.author?.name, currentIndex: 0));
        // Đặt lên hàng đợi đầu của danh sách nguồn và danh sách Episode
        final List<EpisodeModel> newListEpisodes = [];
        final List<AudioSource> listSources = [];
        newListEpisodes.add(episode!);
        listSources.add(AudioSource.uri(Uri.parse(state.episode?.href ?? '')));

        // Tạo danh sách Episode và AudioSource
        for (var element in listEpisodes) {
          if (element.id != id) {
            newListEpisodes.add(element);
            listSources.add(AudioSource.uri(Uri.parse(element.href ?? '')));
          }
        }

        // Gán dữ liệu storage ListEpisode và setup AudioSource
        episodePlayerManager.setListEpisodes(newListEpisodes);
        episodePlayerManager.audioPlayer
            .setAudioSource(ConcatenatingAudioSource(children: listSources));
        // Khởi chạy
        await episodePlayerManager.audioPlayer.seek(Duration.zero, index: 0);
        episodePlayerManager.updateEpisode(
            episodePlayerManager.currentListEpisodes[state.currentIndex ?? 0]);
        episodePlayerManager.play();
      } else {
        final int index =
            episodePlayerManager.currentListEpisodes.indexOf(episode!);
        emit(state.copyWith(
            currentIndex: index,
            episode: episode,
            author: author?.author?.name));
        await episodePlayerManager.audioPlayer
            .seek(Duration.zero, index: state.currentIndex);
        episodePlayerManager.updateEpisode(
            episodePlayerManager.currentListEpisodes[state.currentIndex ?? 0]);
        episodePlayerManager.play();
      }
      updateSelectedSpeed(1);
    } else {
      final author = await episodePlayerManager.currentEpisode?.podcastEx;
      emit(state.copyWith(
          episode: episodePlayerManager.currentEpisode,
          author: author?.author?.name,
          selectedSpeed: episodePlayerManager.audioPlayer.speed));
      episodePlayerManager.play();
    }
    bool result = await episodeUseCases.unitOfWork.download.isDownloaded(id);
    emit(state.copyWith(isDownloaded: result));
  }

// Change speed
  void updateSelectedSpeed(double speed) {
    episodePlayerManager.setSpeed(speed);
    if (!isClosed) {
      emit(state.copyWith(selectedSpeed: speed));
    }
  }

// Add to playlist
  void showModalPlaylist(BuildContext context) async {
    final playlists = await playlistUseCases.getAll();
    final result = await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      builder: (context) {
        return CustomModalBottomSheet(
          onCreatePlaylist: () async {
            final _controller = TextEditingController();
            final result = await showTextFieldBottomModal(
              Get.context!,
              "New Playlist",
              _controller,
            );
            if (result != null && result.isNotEmpty) {
              final playlist =
                  await playlistUseCases.createPlaylist(name: result);
              if (playlist?.id != null) {
                playlistUseCases.addEpisodeToPlaylist(
                    idPlaylist: playlist!.id!, idEpisode: id);
              }
              return true;
            }
            return false;
          },
          listTitle: playlists?.map((e) => e.name ?? '').toList(),
        );
      },
    );
    if (result != null && result is List<bool>) {
      final addToPlaylist = (result as List<bool>)
          .asMap()
          .entries
          .where((element) => element.value)
          .map((e) => playlists?[e.key]);
      for (var element in addToPlaylist) {
        playlistUseCases.addEpisodeToPlaylist(
            idPlaylist: element!.id!, idEpisode: id);
      }
    }
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

  void seekToNextEpisode() async {
    final author = await episodePlayerManager
        .currentListEpisodes[state.currentIndex ?? 0 + 1].podcastEx;
    emit(state.copyWith(
        currentIndex: state.currentIndex ?? 0 + 1,
        episode: episodePlayerManager
            .currentListEpisodes[state.currentIndex ?? 0 + 1],
        author: author?.author?.name));
    episodePlayerManager.updateEpisode(
        episodePlayerManager.currentListEpisodes[state.currentIndex ?? 0]);
    episodePlayerManager.audioPlayer.seekToNext();
  }

  void seekToPreviousEpisode() async {
    final author = await episodePlayerManager
        .currentListEpisodes[state.currentIndex ?? 0 - 1].podcastEx;
    emit(state.copyWith(
        currentIndex: state.currentIndex ?? 0 - 1,
        episode: episodePlayerManager
            .currentListEpisodes[state.currentIndex ?? 0 - 1],
        author: author?.author?.name));
    episodePlayerManager.updateEpisode(
        episodePlayerManager.currentListEpisodes[state.currentIndex ?? 0]);
    episodePlayerManager.audioPlayer.seekToPrevious();
  }

  Future addToFavourite() {
    return playlistUseCases.addEpisodeToFavourite(idEpisode: id);
  }

  void downloadEpisode() {
    EpisodeDownloadUtil.downloadEpisode(
        episodePlayerManager.currentEpisode?.href ?? "",
        episodePlayerManager.currentEpisode?.id ?? "");
  }
}
