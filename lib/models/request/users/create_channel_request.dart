import 'package:json_annotation/json_annotation.dart';

part 'create_channel_request.g.dart';

@JsonSerializable()
class CreateChannelRequest {
  @JsonKey(name: "name")
  final String name;

  CreateChannelRequest({required this.name});

  factory CreateChannelRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChannelRequestToJson(this);
}
