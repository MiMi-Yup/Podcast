import 'package:json_annotation/json_annotation.dart';

part 'update_request.g.dart';

@JsonSerializable()
class EpisodeUpdateRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "duration")
  final double duration;
  @JsonKey(name: "href")
  final String href;
  @JsonKey(name: "image")
  final double image;
  @JsonKey(name: "podcast_id")
  final String podcastId;

  EpisodeUpdateRequest(
      {required this.name,
      required this.description,
      required this.duration,
      required this.href,
      required this.image,
      required this.podcastId});

  factory EpisodeUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$EpisodeUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeUpdateRequestToJson(this);
}
