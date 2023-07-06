// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePodcastRequest _$UpdatePodcastRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePodcastRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      image: DateTime.parse(json['image'] as String),
      categoryId: json['category_id'] as String,
    );

Map<String, dynamic> _$UpdatePodcastRequestToJson(
        UpdatePodcastRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image.toIso8601String(),
      'category_id': instance.categoryId,
    };
