import 'package:join_podcast/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'is_creator')
  bool? isCreator;
  @JsonKey(name: 'avatar')
  String? avatar;
  @JsonKey(name: 'birthday')
  DateTime? birthday;
  @JsonKey(name: 'channel_name')
  String? channelName;

  UserResponse(
      {this.id,
      this.name,
      this.email,
      this.isVerified,
      this.birthday,
      this.avatar,
      this.channelName,
      this.isCreator});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  UserModel toModel() => UserModel.fromJson(toJson());

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
