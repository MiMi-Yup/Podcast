import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/podcast_repository.dart';
import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
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

  EpisodeModel(
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

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}

extension EpisodeModelExtension on EpisodeModel {
  Future<PodcastModel?> get podcastEx async {
    if (podcast != null) {
      if (podcast is String) {
        final result =
            await getIt<PodcastRepository>().getPodcastById(podcast as String);
        return result != null ? PodcastModel.fromResponse(result) : null;
      } else if (podcast is Map) {
        return PodcastModel.fromResponse(PodcastResponse.fromJson(podcast));
      }
    }
    return null;
  }
}
