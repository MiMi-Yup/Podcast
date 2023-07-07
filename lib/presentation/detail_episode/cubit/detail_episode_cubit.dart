import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/user_model.dart';

part 'detail_episode_state.dart';

@injectable
class DetailEpisodeCubit extends Cubit<DetailEpisodeState> {
  final UnitOfWork unitOfWork;
  final EpisodeModel episode;
  DetailEpisodeCubit({required this.unitOfWork, required this.episode})
      : super(DetailEpisodeState.initial());

  void init() async {
    final _episode = await unitOfWork.episode.getEpisodeById(episode.id!);
    final episodeModel = _episode?.toModel();
    final _simplePodcast = await episodeModel?.podcastEx;
    final _podcast =
        await unitOfWork.podcast.getPodcastById(_simplePodcast?.id ?? '');
    if (_podcast != null && !isClosed) {
      final podcastModel = PodcastModel.fromResponse(_podcast);
      emit(state.copyWith(
          podcast: podcastModel,
          user: podcastModel.author,
          episode: episodeModel));
    }
  }
}
