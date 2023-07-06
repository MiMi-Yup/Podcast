// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeResponse _$EpisodeResponseFromJson(Map<String, dynamic> json) =>
    EpisodeResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      image: json['image'] as String?,
      href: json['href'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isWatched: json['is_watched'] as bool?,
    );

Map<String, dynamic> _$EpisodeResponseToJson(EpisodeResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'image': instance.image,
      'href': instance.href,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_watched': instance.isWatched,
    };
