import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart';
import 'package:join_podcast/models/episode_model.dart';

part 'playlist_state.dart';

@injectable
class PlaylistCubit extends Cubit<PlaylistState> {
  final PlaylistUseCases usecase;
  final String playlist;
  PlaylistCubit({required this.usecase, required this.playlist})
      : super(PlaylistState.initial());

  void init() async {
    final result = await usecase.getPlaylistById(playlist);
    if (result != null && !isClosed) {
      emit(state.copyWith(
          namePlaylist: result.name,
          count: result.count,
          countDownload: 0,
          episodes: result.episodes));
      sortByDate();
    }
  }

  void removeFromPlaylist(EpisodeModel episode) async {
    if (episode.id != null && episode.id!.isNotEmpty) {
      final result = await usecase.removeFromPlaylist(
          idPlaylist: playlist, idEpisode: episode.id!);
      if (result) {
        emit(state.copyWith(
            count: state.count - 1,
            episodes: List.from(state.episodes)..remove(episode),
            countDownload: state.countDownload - (0)));
      }
    }
  }

  void sortByName() {
    final newOrder = List<EpisodeModel>.from(state.episodes)
      ..sort((a, b) =>
          (a.name ?? '').toLowerCase().compareTo((b.name ?? '').toLowerCase()) *
          (state.order == SortOrder.nameAsc ? 1 : -1));
    emit(state.copyWith(
        episodes: newOrder,
        order: state.order == SortOrder.nameAsc
            ? SortOrder.nameDesc
            : SortOrder.nameAsc));
  }

  void sortByDate() {
    final newOrder = List<EpisodeModel>.from(state.episodes)
      ..sort((a, b) =>
          (a.createdAt != null && b.createdAt != null
              ? a.createdAt!.compareTo(b.createdAt!)
              : 0) *
          (state.order == SortOrder.dateAsc ? 1 : -1));
    emit(state.copyWith(
        episodes: newOrder,
        order: state.order == SortOrder.dateAsc
            ? SortOrder.dateDesc
            : SortOrder.dateAsc));
  }

  void updatePlaylist({String? name}) async {
    final result =
        await usecase.updatePlaylist(idPlaylist: playlist, name: name);
    if (result) emit(state.copyWith(namePlaylist: name));
  }

  Future<void> deletePlaylist() {
    return usecase.deletePlaylist(id: playlist);
  }
}
