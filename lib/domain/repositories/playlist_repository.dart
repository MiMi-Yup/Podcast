import 'dart:async';

import 'package:join_podcast/models/request/playlists/add_episode_request.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';
import 'package:join_podcast/models/request/playlists/remove_episode_request.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';

abstract class PlaylistRepository {
  FutureOr<PlaylistResponse?> getPlaylistById(String id);
  FutureOr<List<PlaylistResponse>?> getAllPlaylist();
  FutureOr<bool?> createPlaylist(PlaylistCreateRequest request);
  FutureOr<bool?> addEpisodeToPlaylist(
      {required String id, required AddEpisodeRequest request});
  FutureOr<bool?> removeEpisodeFromPlaylist(
      {required String id, required RemoveEpisodeRequest request});
  FutureOr<bool?> deletePlaylist(String id);
}
