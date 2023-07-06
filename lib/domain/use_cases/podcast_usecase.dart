import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/playlist_model.dart';
import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/models/request/podcasts/create_request.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';

import '../../models/response/media/media_response.dart';

@injectable
class PodcastUseCases {
  final UnitOfWork unitOfWork;

  PodcastUseCases({required this.unitOfWork});


  Future<PodcastModel?> createPodcast({required String name, required String description, required String? image, required String categoryID}) async {
    if (image != null) {
      final file = File(image);
      if (file.existsSync()) {
        MediaResponse? link = await unitOfWork.media.uploadImage(file);
        image = link?.url;
      }
    }
    PodcastResponse? newPodcast = await unitOfWork.podcast
        .createPodcast(PodcastCreateRequest(name: name, description: description, image: image!, categoryId: categoryID,));
    if (newPodcast == null) return null;
    return PodcastModel.fromResponse(newPodcast);
  }

  Future<PodcastModel?> getPodcastById(String id) async {
    final result = await unitOfWork.podcast.getPodcastById(id);
    if (result == null) return null;
    return PodcastModel.fromResponse(result);
  }
}
