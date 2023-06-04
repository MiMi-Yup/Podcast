import 'package:join_podcast/models/category_model.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'podcast_response.g.dart';

@JsonSerializable()
class EpisodesResponse {
  @JsonKey(name: "items")
  List<EpisodeModel>? episodes;
  @JsonKey(name: "count")
  int? count;

  EpisodesResponse({this.episodes, this.count});

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesResponseToJson(this);
}

@JsonSerializable()
class PodcastResponse {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "category")
  CategoryModel? category;
  @JsonKey(name: "author")
  UserModel? author;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "episodes")
  EpisodesResponse? episodes;

  PodcastResponse(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.author,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.episodes});

  factory PodcastResponse.fromJson(Map<String, dynamic> json) =>
      _$PodcastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PodcastResponseToJson(this);
}
