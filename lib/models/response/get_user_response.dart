// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:join_podcast/models/user_model.dart';

part 'get_user_response.g.dart';

@JsonSerializable()
class GetUserResponse {

  @JsonKey(name: 'user')
  UserModel? user;

  GetUserResponse(this.user);

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);
}