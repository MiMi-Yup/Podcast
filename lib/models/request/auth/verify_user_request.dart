// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'verify_user_request.g.dart';

@JsonSerializable()
class VerifyUserRequest {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "code")
  final String code;

  VerifyUserRequest({required this.email, required this.code});

  factory VerifyUserRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyUserRequestToJson(this);
}