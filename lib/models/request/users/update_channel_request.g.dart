// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_channel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateChannelRequest _$UpdateChannelRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateChannelRequest(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$UpdateChannelRequestToJson(
        UpdateChannelRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
