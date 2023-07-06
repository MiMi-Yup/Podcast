// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'new_user_request.g.dart';

@JsonSerializable()
class NewUserRequest {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "confirmPassword")
  final String confirmPassword;

  NewUserRequest({required this.email, required this.password, required this.confirmPassword});

  factory NewUserRequest.fromJson(Map<String, dynamic> json) =>
      _$NewUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserRequestToJson(this);
}