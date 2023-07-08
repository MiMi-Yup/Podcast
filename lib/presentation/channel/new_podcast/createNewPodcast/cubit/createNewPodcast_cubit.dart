import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/podcast_usecase.dart';
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

  Future<bool?> createPodcast() async {
    emit(state.copyWith(state: Status.submitting));
    PodcastModel? isSuccess = await podcastUseCases
        .createPodcast(
            name: state.name,
            description: state.description,
            image: state.image ?? state.initImage,
            categoryID: state.categoryId)
        .onError((error, stackTrace) {
      emit(state.copyWith(state: Status.error));
      return null;
    });
    if (isSuccess == null) {
      emit(state.copyWith(state: Status.error));
      return false;
    }
    ;
    emit(state.copyWith(state: Status.success));
    return true;
  }
}
