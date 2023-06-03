// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'login_user_request.g.dart';

@JsonSerializable()
class LoginUserRequest {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;

  LoginUserRequest({required this.email, required this.password});

  factory LoginUserRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserRequestToJson(this);
}