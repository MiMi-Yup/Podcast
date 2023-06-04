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
  SearchCubit({required this.unitOfWork})
      : super(SearchStateInitial(
            channels: const [], episodes: const [], podcasts: const []));

  Future<List<String>> getHistorySearch() async {
    await Future.delayed(const Duration(seconds: 2));
    return ["1", "2"];
  }
}
