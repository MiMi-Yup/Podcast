import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
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

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.isVerified,
      this.birthday,
      this.avatar,
      this.channelName,
      this.isCreator});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
