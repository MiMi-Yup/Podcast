import 'package:join_podcast/models/episode_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_response.g.dart';

@JsonSerializable()
class EpisodeResponse {
  @JsonKey(name: "episode")
  EpisodeModel? episode;

  EpisodeResponse({
    this.episode,
  });

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeResponseToJson(this);
}
