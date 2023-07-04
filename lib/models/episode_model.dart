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
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "is_watched")
  bool? isWatched;

  EpisodeModel(
      {this.id,
      this.name,
      this.description,
      this.duration,
      this.image,
      this.href,
      this.createdAt,
      this.updatedAt,
      this.isWatched});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
