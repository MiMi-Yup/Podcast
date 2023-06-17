import 'package:json_annotation/json_annotation.dart';

part 'create_request.g.dart';

@JsonSerializable()
class PlaylistCreateRequest {
  @JsonKey(name: "name")
  final String name;

  PlaylistCreateRequest({required this.name});

  factory PlaylistCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaylistCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistCreateRequestToJson(this);
}
