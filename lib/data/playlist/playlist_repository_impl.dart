import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/playlist_service.dart';
import 'package:join_podcast/domain/repositories/playlist_repository.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';
import 'package:join_podcast/models/request/playlists/remove_episode_request.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/models/request/playlists/add_episode_request.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: PlaylistRepository)
class PlaylistRepositoryImpl implements PlaylistRepository {
  PlaylistRepositoryImpl({required this.service});

  final PlaylistService? service;

  @override
  FutureOr<bool?> addEpisodeToPlaylist(
      {required String id, required AddEpisodeRequest request}) {
    return service
        ?.addEpisode(id, request)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<PlaylistResponse?> createPlaylist(PlaylistCreateRequest request) {
    return service
        ?.create(request)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<bool?> deletePlaylist(String id) {
    return service
        ?.deletePlaylist(id)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<List<PlaylistResponse>?> getAllPlaylist() {
    return service?.getAll().then((value) => value.data).catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<PlaylistResponse?> getPlaylistById(String id) {
    return service
        ?.getPlaylistById(id)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<bool?> removeEpisodeFromPlaylist(
      {required String id, required RemoveEpisodeRequest request}) {
    return service
        ?.removeEpisode(id, request)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }
}
