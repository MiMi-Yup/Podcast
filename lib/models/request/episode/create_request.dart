import 'package:json_annotation/json_annotation.dart';

part 'create_request.g.dart';

@JsonSerializable()
class EpisodeCreateRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "duration")
  final double duration;
  @JsonKey(name: "href")
  final String href;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "podcast_id")
  final String podcastId;

  EpisodeCreateRequest(
      {required this.name,
      required this.description,
      required this.duration,
      required this.href,
      required this.image,
      required this.podcastId});

  factory EpisodeCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$EpisodeCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeCreateRequestToJson(this);
}
