// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUserRequest _$NewUserRequestFromJson(Map<String, dynamic> json) =>
    NewUserRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$NewUserRequestToJson(NewUserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
