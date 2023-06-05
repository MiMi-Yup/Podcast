import 'package:json_annotation/json_annotation.dart';

part 'episode_response.g.dart';

@JsonSerializable()
class EpisodeResponse {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "duration")
  double? duration;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "href")
  String? href;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "is_watched")
  bool? isWatched;

  EpisodeResponse(
      {this.id,
      this.name,
      this.description,
      this.duration,
      this.image,
      this.href,
      this.createdAt,
      this.updatedAt,
      this.isWatched});

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeResponseToJson(this);
}
