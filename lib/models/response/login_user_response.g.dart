// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserResponse _$LoginUserResponseFromJson(Map<String, dynamic> json) =>
    LoginUserResponse(
      user: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginUserResponseToJson(LoginUserResponse instance) =>
    <String, dynamic>{
      'data': instance.user,
      'token': instance.token,
    };
