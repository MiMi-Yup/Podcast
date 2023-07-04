import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/playlists/playlist_response.dart';

class PlaylistModel {
  String? id;
  String? name;
  List<EpisodeModel>? episodes;
  int? count;

  PlaylistModel({this.id, this.name, this.episodes, this.count});

  factory PlaylistModel.fromResponse(PlaylistResponse response) =>
      PlaylistModel(
          id: response.id,
          name: response.name,
          episodes: response.episodes?.items,
          count: response.episodes?.count);

  PlaylistResponse toResponse() => PlaylistResponse(
      id: id,
      name: name,
      episodes: ListResponse(count: count, items: episodes));
      
}
