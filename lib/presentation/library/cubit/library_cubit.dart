import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/playlist_model.dart';

part 'library_state.dart';

@injectable
class LibraryCubit extends Cubit<LibraryState> {
  final PlaylistUseCases usecase;
  LibraryCubit({required this.usecase}) : super(LibraryState.initial());

  Future<PlaylistModel?> createPlaylist({required String name}) async {
    final result = await usecase.createPlaylist(name: name);
    if (result != null) {
      emit(state.copyWith(playlists: List.from(state.playlists)..add(result)));
    }
    return result;
  }

  void init() async {
    final fav = await usecase.getFavourite();
    final play = await usecase.getAll();
    if (!isClosed) emit(state.copyWith(favourites: fav, playlists: play));
  }

  void deletePlaylist(PlaylistModel playlist) async {
    if (state.playlists.contains(playlist) &&
        await usecase.deletePlaylist(id: playlist.id!)) {
      emit(state.copyWith(
          playlists: List.from(state.playlists)..remove(playlist)));
    }
  }
}
