import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:json_annotation/json_annotation.dart';

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

  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        isVerified: json['is_verified'] as bool?,
        isCreator: json['is_creator'] as bool?,
        avatar: json['avatar'] as String?,
        birthday: json['birthday'] == null
            ? null
            : DateTime.parse(json['birthday'] as String),
        channelName: json['channel_name'] as String?,
        podcasts: json['podcasts'] == null
            ? null
            : ListResponse<PodcastModel>.fromJson(
                json['podcasts'] as Map<String, dynamic>,
                (value) =>
                    PodcastModel.fromResponse(value as PodcastResponse)),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': name,
        'email': email,
        'is_verified': isVerified,
        'is_creator': isCreator,
        'avatar': avatar,
        'birthday': birthday?.toIso8601String(),
        'channel_name': channelName,
        'podcasts': podcasts?.toJson(
          (value) => value,
        ),
      };
}
