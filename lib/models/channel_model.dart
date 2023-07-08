import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'channel_model.g.dart';

@JsonSerializable()
class ChannelModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'is_creator')
  bool? isCreator;
  @JsonKey(name: 'avatar')
  String? avatar;
  @JsonKey(name: 'birthday')
  DateTime? birthday;
  @JsonKey(name: 'channel_name')
  String? channelName;
  @JsonKey(name: 'podcasts')
  ListResponse<PodcastModel>? podcasts;

  ChannelModel(
      {this.id,
      this.name,
      this.email,
      this.isVerified,
      this.isCreator,
      this.avatar,
      this.birthday,
      this.channelName,
      this.podcasts});

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelModelToJson(this);
}
