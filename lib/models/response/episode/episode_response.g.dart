// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeResponse _$EpisodeResponseFromJson(Map<String, dynamic> json) =>
    EpisodeResponse(
      episode: json['episode'] == null
          ? null
          : EpisodeModel.fromJson(json['episode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeResponseToJson(EpisodeResponse instance) =>
    <String, dynamic>{
      'episode': instance.episode,
    };
