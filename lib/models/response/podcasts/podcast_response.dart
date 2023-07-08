import 'package:join_podcast/models/category_model.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

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
      PodcastResponse(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        category: json['category'] == null
            ? null
            : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
        author: json['author'] == null
            ? null
            : json['author'].runtimeType == String
                ? UserModel(id: json['author'])
                : UserModel.fromJson(json['author'] as Map<String, dynamic>),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        image: json['image'] as String?,
        numListening: json['num_listening'] as int?,
        isSubscribed: json['is_subscribed'] as bool?,
        episodes: json['episodes'] == null
            ? null
            : ListResponse<EpisodeModel>.fromJson(
                json['episodes'] as Map<String, dynamic>,
                (value) =>
                    EpisodeModel.fromJson(value as Map<String, dynamic>)),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': name,
        'description': description,
        'category': category,
        'author': author,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'image': image,
        'num_listening': numListening,
        'is_subscribed': isSubscribed,
        'episodes': episodes?.toJson(
          (value) => value,
        ),
      };
}
