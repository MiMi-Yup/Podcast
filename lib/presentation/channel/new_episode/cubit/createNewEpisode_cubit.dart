import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/request/episode/create_request.dart';

import '../../../../../domain/repositories/unit_of_work.dart';

part 'createNewEpisode_state.dart';

@injectable
class CreateNewEpisodeCubit extends Cubit<CreateNewEpisodeState> {
  final EpisodeUseCases episodeUseCases;
  CreateNewEpisodeCubit({required this.episodeUseCases})
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

  void changePodcastID(String podcastID) {
    emit(state.copyWith(podcastID: podcastID));
  }

  Future<void> createEpisode({required File audioUploaded})
  async {
    emit(state.copyWith(state: Status.submitting));
    EpisodeModel? epi = await episodeUseCases.createEpisode(name: state.name, description: state.description, duration: state.duration, href: state.href, image: state.image ?? state.initImage, podcastID: state.podcastID, audioUpload: audioUploaded).onError((error, stackTrace) {
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