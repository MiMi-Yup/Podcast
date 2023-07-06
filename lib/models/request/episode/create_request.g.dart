// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeCreateRequest _$EpisodeCreateRequestFromJson(
        Map<String, dynamic> json) =>
    EpisodeCreateRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      duration: (json['duration'] as num).toDouble(),
      href: json['href'] as String,
      image: (json['image'] as num).toDouble(),
      podcastId: json['podcast_id'] as String,
    );

Map<String, dynamic> _$EpisodeCreateRequestToJson(
        EpisodeCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'href': instance.href,
      'image': instance.image,
      'podcast_id': instance.podcastId,
    };
