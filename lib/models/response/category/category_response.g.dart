// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    )..v = json['__v'] as int?;

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      '__v': instance.v,
    };
