import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';

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
}
