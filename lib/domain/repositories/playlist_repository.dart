import 'dart:async';

import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';

abstract class PlaylistRepository {
  FutureOr<PlaylistResponse?> getPlaylistById(String id);
  FutureOr<ListResponse<PlaylistResponse>?> getAllPlaylist();
  FutureOr<PlaylistResponse?> createPlaylist(PlaylistCreateRequest request);
  FutureOr<bool?> addEpisodeToPlaylist(
      {required String idPlaylist, required String idEpisode});
  FutureOr<bool?> removeEpisodeFromPlaylist(
      {required String idPlaylist, required String idEpisode});
  FutureOr<bool?> deletePlaylist(String id);
}
