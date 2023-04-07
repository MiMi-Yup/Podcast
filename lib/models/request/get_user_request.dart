// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'get_user_request.g.dart';

@JsonSerializable()
class GetUserRequest {
  @JsonKey(name: "id")
  final String id;

  GetUserRequest({required this.id});

  factory GetUserRequest.fromJson(Map<String, dynamic> json) =>
      _$GetUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserRequestToJson(this);
}