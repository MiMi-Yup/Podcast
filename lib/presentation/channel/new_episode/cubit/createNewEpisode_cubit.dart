import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';

part 'createNewEpisode_state.dart';

@injectable
class CreateNewEpisodeCubit extends Cubit<CreateNewEpisodeState> {
  final EpisodeUseCases episodeUseCases;
  final String idPodcast;
  CreateNewEpisodeCubit(
      {required this.episodeUseCases, required this.idPodcast})
      : super(CreateNewEpisodeState.initial());

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeDes(String description) {
    emit(state.copyWith(description: description));
  }

  void changeDuration(double duration) {
    emit(state.copyWith(duration: duration));
  }

  void changeHref(String href) {
    emit(state.copyWith(href: href));
  }

  void changeImage(XFile image) {
    emit(state.copyWith(image: image.path));
  }

  Future<void> createEpisode({required File audioUploaded}) async {
    emit(state.copyWith(state: Status.submitting));
    EpisodeModel? epi = await episodeUseCases
        .createEpisode(
            name: state.name,
            description: state.description,
            duration: state.duration,
            href: state.href,
            image: state.image ?? state.initImage,
            podcastID: idPodcast,
            audioUpload: audioUploaded)
        .onError((error, stackTrace) {
      emit(state.copyWith(state: Status.error));
      return null;
    });
    if (epi != null) {
      emit(state.copyWith(state: Status.success));
    } else {
      emit(state.copyWith(state: Status.error));
    }
  }
}
