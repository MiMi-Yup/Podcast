import 'package:join_podcast/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_response.g.dart';

@JsonSerializable()
class MediaResponse {
  @JsonKey(name: "url")
  String? url;

  MediaResponse({this.url});

  factory MediaResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MediaResponseToJson(this);
}
