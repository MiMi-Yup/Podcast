import 'package:json_annotation/json_annotation.dart';

part 'update_request.g.dart';

@JsonSerializable()
class UserUpdateRequest {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "birthday")
  final DateTime? birthday;

  UserUpdateRequest({required this.name, required this.avatar, required this.birthday});

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);
}