import 'package:json_annotation/json_annotation.dart';

part 'update_channel_request.g.dart';

@JsonSerializable()
class UpdateChannelRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;

  UpdateChannelRequest({required this.name, required this.description});

  factory UpdateChannelRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateChannelRequestToJson(this);
}
