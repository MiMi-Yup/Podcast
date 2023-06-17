import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/playlist_model.dart';

part 'playlist_state.dart';

@injectable
class PlaylistCubit extends Cubit<PlaylistState> {
  final PlaylistUseCases usecase;
  //Testing allow null variable below
  final PlaylistModel? playlist;
  PlaylistCubit({required this.usecase, required this.playlist})
      : super(PlaylistStateInitial(episodes: playlist?.episodes ?? []));
}
