import 'package:join_podcast/models/category_model.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'podcast_response.g.dart';

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
  @JsonKey(name: "num_listening")
  int? numListening;
  @JsonKey(name: "is_subscribed")
  bool? isSubscribed;
  @JsonKey(name: "episodes")
  ListResponse<EpisodeModel>? episodes;

  PodcastResponse(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.author,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.numListening,
      this.isSubscribed,
      this.episodes});

  factory PodcastResponse.fromJson(Map<String, dynamic> json) =>
      _$PodcastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PodcastResponseToJson(this);
}
