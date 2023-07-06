import 'package:json_annotation/json_annotation.dart';

part 'remove_episode_request.g.dart';

@JsonSerializable()
class RemoveEpisodeRequest {
  @JsonKey(name: "episode_id")
  final String episodeId;

  RemoveEpisodeRequest({required this.episodeId});

  factory RemoveEpisodeRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveEpisodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveEpisodeRequestToJson(this);
}
