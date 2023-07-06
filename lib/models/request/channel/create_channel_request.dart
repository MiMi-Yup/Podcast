// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'create_channel_request.g.dart';

@JsonSerializable()
class ChannelCreateRequest {
  @JsonKey(name: "name")
  final String name;

  ChannelCreateRequest({required this.name});

  factory ChannelCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ChannelCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelCreateRequestToJson(this);
}