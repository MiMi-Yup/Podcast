// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistResponse _$PlaylistResponseFromJson(Map<String, dynamic> json) =>
    PlaylistResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      episodes: json['episodes'] == null
          ? null
          : ListResponse<EpisodeModel>.fromJson(
              json['episodes'] as Map<String, dynamic>,
              (value) => EpisodeModel.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$PlaylistResponseToJson(PlaylistResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'episodes': instance.episodes?.toJson(
        (value) => value,
      ),
    };
