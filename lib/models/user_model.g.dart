// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      isVerified: json['is_verified'] as bool?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      avatar: json['avatar'] as String?,
      channelName: json['channel_name'] as String?,
      isCreator: json['is_creator'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'is_verified': instance.isVerified,
      'is_creator': instance.isCreator,
      'avatar': instance.avatar,
      'birthday': instance.birthday?.toIso8601String(),
      'channel_name': instance.channelName,
    };
