import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/request/episode/create_request.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';

import '../../models/response/media/media_response.dart';

@injectable
class EpisodeUseCases {
  final UnitOfWork unitOfWork;

  EpisodeUseCases({required this.unitOfWork});

  Future<EpisodeModel?> getEpisodeById(String id) async {
    EpisodeResponse? episodeResponse =
        await unitOfWork.episode.getEpisodeById(id);
    if (episodeResponse != null) return episodeResponse.episode;
    return null;
  }

  Future<EpisodeModel?> createEpisode({required String name, required String description, required double duration, required String href, required String image, required String podcastID, required File audioUpload}) async {
      final file = File(image);
      if (file.existsSync()) {
        MediaResponse? link = await unitOfWork.media.uploadImage(file);
        image = link as String;
      }

      if (audioUpload.existsSync()) {
        MediaResponse? link = await unitOfWork.media.uploadAudio(audioUpload);
        href = link as String;
      }

      EpisodeResponse? newEpi = await unitOfWork.episode.createEpisode(EpisodeCreateRequest(name: name, description: description, duration: duration, href: href, image: image, podcastId: podcastID));
      return newEpi?.toModel();
  }
}
