import 'dart:async';

import 'package:join_podcast/models/request/podcasts/create_request.dart';
import 'package:join_podcast/models/response/list_seperate_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';

abstract class PodcastRepository {
  FutureOr<PodcastResponse?> getPodcastById(String id);
  FutureOr<PodcastResponse?> createPodcast(PodcastCreateRequest request);
  FutureOr<ListSeperateResponse<PodcastResponse>?> search(String query,
      {int? offset, int? limit});
  FutureOr<bool?> subscribe({required String podcastId});
  FutureOr<bool?> unSubscribe({required String podcastId});
  FutureOr<bool?> deletePodcast(String id);
  //FutureOr<bool?> updatePodcast({required String idPlaylist, required String name});
}
