import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/playlist_service.dart';
import 'package:join_podcast/domain/repositories/playlist_repository.dart';
import 'package:join_podcast/models/request/playlists/update_request.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: PlaylistRepository)
class PlaylistRepositoryImpl implements PlaylistRepository {
  PlaylistRepositoryImpl({required this.service});

  final PlaylistService? service;

  @override
  FutureOr<bool?> addEpisodeToPlaylist(
      {required String idPlaylist, required String idEpisode}) {
    return service
        ?.addEpisode(idPlaylist, idEpisode)
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
  FutureOr<ListResponse<PlaylistResponse>?> getAllPlaylist() {
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
      {required String idPlaylist, required String idEpisode}) {
    return service
        ?.removeEpisode(idPlaylist, idEpisode)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<bool?> updatePlaylist(
      {required String idPlaylist, required String name}) {
    return service
        ?.updatePlaylist(idPlaylist, UpdatePlaylistRequest(name: name))
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }
}
