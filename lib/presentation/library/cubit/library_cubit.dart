import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart';
import 'package:join_podcast/models/playlist_model.dart';

part 'library_state.dart';

@injectable
class LibraryCubit extends Cubit<LibraryState> {
  final PlaylistUseCases usecase;
  LibraryCubit({required this.usecase})
      : super(LibraryStateFavourite.initial());

  Future<PlaylistModel?> createPlaylist({required String name}) {
    return usecase.createPlaylist(name: name);
  }
}
