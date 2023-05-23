// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetUserRequest _$ResetUserRequestFromJson(Map<String, dynamic> json) =>
    ResetUserRequest(
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$ResetUserRequestToJson(ResetUserRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
