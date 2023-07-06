import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/use_cases/podcast_page_usecase.dart';
import 'package:join_podcast/models/model_example/podcast_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

import '../ui/widgets/seekbar.dart';

part 'podcast_state.dart';

@injectable
class PodcastCubit extends Cubit<PodcastState> {
  Song song = Get.arguments ?? Song.songs[0];
  final PodcastUseCases podcastUseCases;
  PodcastCubit({required this.podcastUseCases}) : super(PodcastState.initial());

  // void updateSelectedSpeed(double speed) {
  //   emit(PodcastSpeedChanged(speed));
  //   state.audioPlayer.setSpeed(speed);
  // }

  void skipForward() {
    state.audioPlayer
        .seek(state.audioPlayer.position + const Duration(seconds: 10));
  }

  void skipBackward() {
    state.audioPlayer.seek(
        state.audioPlayer.position > const Duration(seconds: 10)
            ? state.audioPlayer.position - const Duration(seconds: 10)
            : Duration.zero);
  }

  @override
  Future<void> close() {
    state.audioPlayer.dispose();
    return super.close();
  }
}
