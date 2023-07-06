// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeUpdateRequest _$EpisodeUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    EpisodeUpdateRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      duration: (json['duration'] as num).toDouble(),
      href: json['href'] as String,
      image: (json['image'] as num).toDouble(),
      podcastId: json['podcast_id'] as String,
    );

Map<String, dynamic> _$EpisodeUpdateRequestToJson(
        EpisodeUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'href': instance.href,
      'image': instance.image,
      'podcast_id': instance.podcastId,
    };
