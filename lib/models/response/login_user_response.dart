// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:join_podcast/models/user_model.dart';

part 'login_user_response.g.dart';

@JsonSerializable()
class LoginUserResponse {
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "token")
  String? token;

  LoginUserResponse({this.user, this.token});

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseToJson(this);
}