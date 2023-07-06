// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastResponse _$PodcastResponseFromJson(Map<String, dynamic> json) =>
    PodcastResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : UserModel.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      image: json['image'] as String?,
      episodes: json['episodes'] == null
          ? null
          : ListResponse<EpisodeModel>.fromJson(
              json['episodes'] as Map<String, dynamic>,
              (value) => EpisodeModel.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$PodcastResponseToJson(PodcastResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'author': instance.author,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
      'episodes': instance.episodes?.toJson(
        (value) => value,
      ),
    };
