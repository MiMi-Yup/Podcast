import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/use_cases/podcast_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';

import '../../../../../domain/repositories/unit_of_work.dart';
import '../../../../../domain/use_cases/episode_page_usecase.dart';

part 'editPodcast_state.dart';

@injectable
class EditPodcastCubit extends Cubit<EditPodcastState> {
  final PodcastUseCases podcastUseCases;
  final EpisodeUseCases episodeUseCases;
  EditPodcastCubit(this.episodeUseCases, {required this.podcastUseCases})
      : super(EditPodcastState.initial());

  void setID(String id) {
    emit(state.copyWith(id: id));
  }

  Future<PodcastResponse?> getPodcastForCreator({required String id}) async {
    PodcastModel? getPodcast = await podcastUseCases.getPodcastById(id);
    emit(state.copyWith(image: getPodcast?.image, name: getPodcast?.name, episodes: getPodcast?.episodes, count: getPodcast?.count, numListening: getPodcast?.numListening));
    return getPodcast?.toResponse();
  }

  void deletePodcast({required String id}) async {
    if (state.episodes != null) {
      for (EpisodeModel e in state.episodes!) {
        await episodeUseCases.deleteEpisode(id: e.id!);
      }
    }
    await podcastUseCases.deletePodcast(id: id);
  }
}