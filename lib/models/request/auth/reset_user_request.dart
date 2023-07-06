import 'package:json_annotation/json_annotation.dart';

part 'reset_user_request.g.dart';

@JsonSerializable()
class ResetUserRequest {
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "confirmPassword")
  final String confirmPassword;

  ResetUserRequest({required this.password, required this.confirmPassword});

  factory ResetUserRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetUserRequestToJson(this);
}