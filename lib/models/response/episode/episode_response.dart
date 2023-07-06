import 'package:join_podcast/models/episode_model.dart';
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
  @JsonKey(name: "podcast")
  dynamic podcast;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "num_listening")
  int? numListening;
  @JsonKey(name: "is_listened")
  bool? isListened;

  EpisodeResponse(
      {this.id,
      this.name,
      this.description,
      this.duration,
      this.image,
      this.href,
      this.podcast,
      this.createdAt,
      this.updatedAt,
      this.numListening,
      this.isListened});

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeResponseToJson(this);
}
