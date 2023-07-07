// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_seperate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSeperateResponse<T> _$ListSeperateResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListSeperateResponse<T>(
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      count: json['count'] as int?,
      perPage: json['per_page'] as int?,
      totalResults: json['total_results'] as int?,
      totalPage: json['total_page'] as int?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$ListSeperateResponseToJson<T>(
  ListSeperateResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items?.map(toJsonT).toList(),
      'count': instance.count,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'total_page': instance.totalPage,
      'page': instance.page,
    };
