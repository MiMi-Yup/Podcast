import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';
import 'package:join_podcast/models/category_model.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:join_podcast/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'podcast_model.g.dart';

@JsonSerializable()
class PodcastModel {
  String? id;
  String? name;
  String? description;
  CategoryModel? category;
  dynamic author;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  List<EpisodeModel>? episodes;
  int? count;
  int? numListening;
  bool? isSubscribed;

  PodcastModel(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.author,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.episodes,
      this.count,
      this.numListening,
      this.isSubscribed});

  factory PodcastModel.fromResponse(PodcastResponse response) => PodcastModel(
      id: response.id,
      name: response.name,
      description: response.description,
      category: response.category,
      author: response.author,
      createdAt: response.createdAt,
      updatedAt: response.updatedAt,
      image: response.image,
      episodes: response.episodes?.items,
      count: response.episodes?.count,
      numListening: response.numListening,
      isSubscribed: response.isSubscribed);

  PodcastResponse toResponse() => PodcastResponse(
      id: id,
      name: name,
      description: description,
      category: category,
      author: author,
      createdAt: createdAt,
      updatedAt: updatedAt,
      image: image,
      episodes: ListResponse(count: count, items: episodes),
      numListening: numListening,
      isSubscribed: isSubscribed);

  factory PodcastModel.fromJson(Map<String, dynamic> json) =>
      _$PodcastModelFromJson(json);

  Map<String, dynamic> toJson() => _$PodcastModelToJson(this);
}

extension PodcastModelExtension on PodcastModel {
  Future<UserModel?> get authorEx async {
    if (author is String) {
      final user = await getIt<UserRepository>().getUserById(author);
      if (user != null) {
        author = user.toModel();
        return author;
      }
    } else if (author is Map) {
      author = UserModel.fromJson(author);
      return author;
    }
    return null;
  }
}
