import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/podcast_model.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final UnitOfWork unitOfWork;
  SearchCubit({required this.unitOfWork}) : super(SearchState.initial());

  Future<List<String>> getHistorySearch() async {
    return await unitOfWork.user.getSearchHistory() ?? [];
  }

  void removeSearchHistory(String search) {
    unitOfWork.user.removeSearcgHistory(search);
  }

  void searchChannel(String query) {}

  void searchPodcast(String query) {}

  void searchEpisode(String query) {}
}
