import 'package:json_annotation/json_annotation.dart';

part 'update_request.g.dart';

@JsonSerializable()
class UpdatePlaylistRequest {
  @JsonKey(name: "name")
  final String name;

  UpdatePlaylistRequest({required this.name});

  factory UpdatePlaylistRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePlaylistRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePlaylistRequestToJson(this);
}
