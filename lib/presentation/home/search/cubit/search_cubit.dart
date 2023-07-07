import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/user_model.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final UnitOfWork unitOfWork;
  final int limit = 10;
  SearchCubit({required this.unitOfWork}) : super(SearchState.initial());

  Future<List<String>> getHistorySearch() async {
    return await unitOfWork.user.getSearchHistory() ?? [];
  }

  void removeSearchHistory(String search) {
    unitOfWork.user.removeSearchHistory(search);
  }

  void submitSearch(String query) {
    if (query.isNotEmpty) {
      emit(state.copyWith(query: query));
    }
  }

  void searchChannel() async {
    if (state.query.isEmpty) return;
    if (state.offsetChannel != 0) {
      final lists = await unitOfWork.user
          .search(state.query, offset: state.offsetChannel, limit: limit);
      if ((lists?.count ?? 0) > 0) {
        emit(state.copyWith(
            channels: List.from(state.channels ?? [])
              ..addAll(lists!.items!.map((e) => e.toModel()).toList()),
            offsetChannel: state.offsetChannel + 1));
      } else {
        emit(state.copyWith(offsetChannel: 0));
      }
    }
  }

  void searchPodcast() async {
    if (state.query.isEmpty) return;
    if (state.offsetChannel != 0) {
      final lists = await unitOfWork.podcast
          .search(state.query, offset: state.offsetPodcast, limit: limit);
      if ((lists?.count ?? 0) > 0) {
        emit(state.copyWith(
            podcasts: List.from(state.podcasts ?? [])
              ..addAll(lists!.items!
                  .map((e) => PodcastModel.fromResponse(e))
                  .toList()),
            offsetPodcast: state.offsetPodcast + 1));
      } else {
        emit(state.copyWith(offsetPodcast: 0));
      }
    }
  }

  void searchEpisode() async {
    if (state.query.isEmpty) return;
    if (state.offsetEpisode != 0) {
      final lists = await unitOfWork.episode
          .search(state.query, offset: state.offsetEpisode, limit: limit);
      if ((lists?.count ?? 0) > 0) {
        emit(state.copyWith(
            episodes: List.from(state.episodes ?? [])
              ..addAll(lists!.items!
                  .map((e) => EpisodeModel.fromJson(e.toJson()))
                  .toList()),
            offsetEpisode: state.offsetEpisode + 1));
      } else {
        emit(state.copyWith(offsetEpisode: 0));
      }
    }
  }
}
