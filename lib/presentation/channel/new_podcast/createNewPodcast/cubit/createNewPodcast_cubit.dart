import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/use_cases/podcast_usecase.dart';
import 'package:join_podcast/models/request/podcasts/create_request.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/ui/createNameAndDescription_screen.dart';

import '../../../../../domain/repositories/unit_of_work.dart';
import '../../../../../models/podcast_model.dart';

part 'createNewPodcast_state.dart';

@injectable
class CreateNewPodcastCubit extends Cubit<CreateNewPodcastState> {
  final PodcastUseCases podcastUseCases;
  CreateNewPodcastCubit({required this.podcastUseCases})
      : super(CreateNewPodcastState.initial());

  void changePodcastName(String podcastName) {
    emit(state.copyWith(name: podcastName));
  }

  void changeImage(XFile file) {
    emit(state.copyWith(image: file.path));
  }

  void changePodcastDes(String podcastDes) {
    emit(state.copyWith(description: podcastDes));
  }

  void changeCategory(String category) {
    emit(state.copyWith(categoryId: category));
  }

  void createPodcast()
  {
    podcastUseCases.unitOfWork.podcast.createPodcast(PodcastCreateRequest(name: state.name, description: state.description, image: state.image!, categoryId: state.categoryId));
  }
}