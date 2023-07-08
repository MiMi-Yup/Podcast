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
  final String idPodcast;
  EditPodcastCubit(
      {required this.episodeUseCases,
      required this.podcastUseCases,
      required this.idPodcast})
      : super(EditPodcastState.initial());

  Future<PodcastResponse?> getPodcastForCreator() async {
    PodcastModel? getPodcast = await podcastUseCases.getPodcastById(idPodcast);
    if (!isClosed) {
      emit(state.copyWith(podcast: getPodcast, episodes: getPodcast?.episodes));
    }
    return getPodcast?.toResponse();
  }

  void deletePodcast() async {
    await podcastUseCases.deletePodcast(id: state.podcast!.id!);
  }

  Future<bool> deleteEpisode({required EpisodeModel episode}) async {
    final result = await episodeUseCases.deleteEpisode(id: episode.id!);
    if (result && !isClosed) {
      emit(state.copyWith(
          episodes: List.from(state.episodes!)..remove(episode)));
    }
    return result;
  }
}
