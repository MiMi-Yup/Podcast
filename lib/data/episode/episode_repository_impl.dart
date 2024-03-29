import 'dart:io';

import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/episode_service.dart';
import 'package:join_podcast/domain/repositories/episode_repository.dart';
import 'package:join_podcast/models/request/episode/update_request.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';
import 'package:join_podcast/models/request/episode/create_request.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/list_seperate_response.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: EpisodeRepository)
class EpisodeRepositoryImpl implements EpisodeRepository {
  EpisodeRepositoryImpl({required this.service});

  final EpisodeService? service;

  @override
  FutureOr<EpisodeResponse?> createEpisode(EpisodeCreateRequest request) {
    return service
        ?.create(request)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<EpisodeResponse?> updateEpisode({
    required String id,
    required EpisodeUpdateRequest request,
  }) {
    return service
        ?.updateEpisode(id, request)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<EpisodeResponse?> getEpisodeById(String id) {
    return service
        ?.getEpisodeById(id)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<ListSeperateResponse<EpisodeResponse>?> search(String query,
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
  FutureOr<bool?> deleteEpisode(String id) {
    return service
        ?.deleteEpisode(id)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<ListResponse<EpisodeResponse>?> getMostListened() {
    return service
        ?.getMostListened()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<ListResponse<EpisodeResponse>?> getNewest() {
    return service
        ?.getNewest()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }
}
