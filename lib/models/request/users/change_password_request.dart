import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class UserChangePasswordRequest {
  @JsonKey(name: "currentPassword")
  final String currentPassword;
  @JsonKey(name: "newPassword")
  final String newPassword;
  @JsonKey(name: "confirmNewPassword")
  final DateTime confirmNewPassword;

  UserChangePasswordRequest({required this.currentPassword, required this.newPassword, required this.confirmNewPassword});

  factory UserChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UserChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserChangePasswordRequestToJson(this);
}