// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    UserUpdateRequest(
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
    );

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'birthday': instance.birthday?.toIso8601String(),
    };
