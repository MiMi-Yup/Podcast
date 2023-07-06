import 'dart:async';

import 'package:join_podcast/models/request/podcasts/create_request.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';

abstract class PodcastRepository {
  FutureOr<PodcastResponse?> getPodcastById(String id);
  FutureOr<PodcastResponse?> createPodcast(PodcastCreateRequest request);
}
