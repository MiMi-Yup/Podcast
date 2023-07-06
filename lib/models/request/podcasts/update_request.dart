import 'package:json_annotation/json_annotation.dart';

part 'update_request.g.dart';

@JsonSerializable()
class UpdatePodcastRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "image")
  final DateTime image;
  @JsonKey(name: "category_id")
  final String categoryId;

  UpdatePodcastRequest(
      {required this.name,
      required this.description,
      required this.image,
      required this.categoryId});

  factory UpdatePodcastRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePodcastRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePodcastRequestToJson(this);
}
