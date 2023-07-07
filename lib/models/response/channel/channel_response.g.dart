// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelResponse _$ChannelResponseFromJson(Map<String, dynamic> json) =>
    ChannelResponse(
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
          : ListResponse<PodcastResponse>.fromJson(
              json['podcasts'] as Map<String, dynamic>,
              (value) =>
                  PodcastResponse.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$ChannelResponseToJson(ChannelResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'is_verified': instance.isVerified,
      'is_creator': instance.isCreator,
      'avatar': instance.avatar,
      'birthday': instance.birthday?.toIso8601String(),
      'channel_name': instance.channelName,
      'podcasts': instance.podcasts?.toJson(
        (value) => value,
      ),
    };
