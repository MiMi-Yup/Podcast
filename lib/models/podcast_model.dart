import 'package:join_podcast/models/category_model.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:join_podcast/models/user_model.dart';

class PodcastModel {
  String? id;
  String? name;
  String? description;
  CategoryModel? category;
  UserModel? author;
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
}
