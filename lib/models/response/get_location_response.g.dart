// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocationResponse _$GetLocationResponseFromJson(Map<String, dynamic> json) =>
    GetLocationResponse(
      json['data'] == null
          ? null
          : LocationModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetLocationResponseToJson(
        GetLocationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
