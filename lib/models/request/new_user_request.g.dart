// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUserRequest _$NewUserRequestFromJson(Map<String, dynamic> json) =>
    NewUserRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$NewUserRequestToJson(NewUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
