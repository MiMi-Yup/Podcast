import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/podcast_model.dart';

part 'podcast_state.dart';

@injectable
class PodcastCubit extends Cubit<PodcastState> {
  final UnitOfWork unitOfWork;
  final String id;
  PodcastCubit({required this.unitOfWork, required this.id})
      : super(PodcastState.initial());

  void init() async {
    final podcast = await unitOfWork.podcast.getPodcastById(id);
    if (podcast != null && !isClosed) {
      emit(state.copyWith(podcast: PodcastModel.fromResponse(podcast)));
    }
  }

  bool toogleSubscribe() {
    bool isSub = false;
    if (state.podcast?.isSubscribed == true) {
      unitOfWork.podcast.unSubscribe(podcastId: state.podcast!.id!);
      isSub = false;
    } else {
      unitOfWork.podcast.subscribe(podcastId: state.podcast!.id!);
      isSub = true;
    }
    final newPodcast = PodcastModel.fromResponse(state.podcast!.toResponse());
    newPodcast.isSubscribed = isSub;
    emit(state.copyWith(podcast: newPodcast));
    return isSub;
  }
}
