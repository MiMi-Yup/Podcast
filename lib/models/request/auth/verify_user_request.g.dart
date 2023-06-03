// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyUserRequest _$VerifyUserRequestFromJson(Map<String, dynamic> json) =>
    VerifyUserRequest(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifyUserRequestToJson(VerifyUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
