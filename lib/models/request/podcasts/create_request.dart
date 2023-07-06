import 'package:json_annotation/json_annotation.dart';

part 'create_request.g.dart';

@JsonSerializable()
class PodcastCreateRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "image")
  final DateTime image;
  @JsonKey(name: "category_id")
  final String categoryId;

  PodcastCreateRequest({required this.name, required this.description, required this.image, required this.categoryId});

  factory PodcastCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PodcastCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PodcastCreateRequestToJson(this);
}