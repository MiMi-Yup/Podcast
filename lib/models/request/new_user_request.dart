// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'new_user_request.g.dart';

@JsonSerializable()
class NewUserRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;

  NewUserRequest({required this.name, required this.email, required this.password});

  factory NewUserRequest.fromJson(Map<String, dynamic> json) =>
      _$NewUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserRequestToJson(this);
}