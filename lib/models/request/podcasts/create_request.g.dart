// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastCreateRequest _$PodcastCreateRequestFromJson(
        Map<String, dynamic> json) =>
    PodcastCreateRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      categoryId: json['category_id'] as String,
    );

Map<String, dynamic> _$PodcastCreateRequestToJson(
        PodcastCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'category_id': instance.categoryId,
    };
