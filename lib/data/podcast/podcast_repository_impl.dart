import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/podcasts_service.dart';
import 'package:join_podcast/domain/repositories/podcast_repository.dart';
import 'package:join_podcast/models/response/list_seperate_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:join_podcast/models/request/podcasts/create_request.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: PodcastRepository)
class PodcastRepositoryImpl implements PodcastRepository {
  PodcastRepositoryImpl({required this.service});

  final PodcastsService? service;

  @override
  FutureOr<PodcastResponse?> createPodcast(PodcastCreateRequest request) {
    return service
        ?.create(request)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<PodcastResponse?> getPodcastById(String id) {
    return service
        ?.getPodcastById(id)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<ListSeperateResponse<PodcastResponse>?> search(String query,
      {int? offset, int? limit}) {
    return service
        ?.search(query, offset, limit)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<bool?> subscribe({required String podcastId}) {
    return service
        ?.subscribe(podcastId)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<bool?> unSubscribe({required String podcastId}) {
    return service
        ?.unSubscribe(podcastId)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }
}
