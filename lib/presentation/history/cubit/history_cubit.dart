import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';

part 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final UnitOfWork unitOfWork;
  final int limit = 10;
  HistoryCubit({required this.unitOfWork}) : super(HistoryState.initial());

  void removeSearchHistory(EpisodeModel episode) async {
    final result = await unitOfWork.user.removeEpisodeInHistory(episode.id!);
    if (result == true && !isClosed) {
      emit(state.copyWith(
          episodes: state.episodes == null ? null : List.from(state.episodes!)
            ?..remove(episode)));
    }
  }

  void getEpisode() async {
    if (state.offsetEpisode != 0) {
      final lists = await unitOfWork.user
          .getHistoryEpisodes(offset: state.offsetEpisode, limit: limit);
      if ((lists?.count ?? 0) > 0 && !isClosed) {
        emit(state.copyWith(
            episodes: List.from(state.episodes ?? [])
              ..addAll(lists!.items!.map((e) => e.toModel()).toList()),
            offsetEpisode: state.offsetEpisode + 1));
      } else {
        emit(state.copyWith(offsetEpisode: 0));
      }
    }
  }

  Future removeHistoryAll() {
    return unitOfWork.user.clearHistory();
  }
}
