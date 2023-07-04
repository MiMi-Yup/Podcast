import 'dart:async';

import 'package:join_podcast/models/request/episode/create_request.dart';
import 'package:join_podcast/models/request/episode/update_request.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';

abstract class EpisodeRepository {
  FutureOr<EpisodeResponse?> createEpisode(EpisodeCreateRequest request);
  FutureOr<EpisodeResponse?> updateEpisode(
      {required String id, required EpisodeUpdateRequest request});
  FutureOr<EpisodeResponse?> getEpisodeById(String id);
}
