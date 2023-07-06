import 'package:json_annotation/json_annotation.dart';

part 'add_episode_request.g.dart';

@JsonSerializable()
class AddEpisodeRequest {
  @JsonKey(name: "episode_id")
  final String episodeId;

  AddEpisodeRequest({required this.episodeId});

  factory AddEpisodeRequest.fromJson(Map<String, dynamic> json) =>
      _$AddEpisodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddEpisodeRequestToJson(this);
}
