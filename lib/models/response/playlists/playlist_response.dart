import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'playlist_response.g.dart';

@JsonSerializable()
class PlaylistResponse {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "episodes")
  ListResponse<EpisodeModel>? episodes;

  PlaylistResponse({this.id, this.name, this.episodes});

  factory PlaylistResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaylistResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistResponseToJson(this);
}
