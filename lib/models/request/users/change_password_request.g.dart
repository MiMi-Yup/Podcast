// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChangePasswordRequest _$UserChangePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    UserChangePasswordRequest(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
      confirmNewPassword: DateTime.parse(json['confirmNewPassword'] as String),
    );

Map<String, dynamic> _$UserChangePasswordRequestToJson(
        UserChangePasswordRequest instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
      'confirmNewPassword': instance.confirmNewPassword.toIso8601String(),
    };
