// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'reset_token_response.g.dart';

@JsonSerializable()
class ResetTokenResponse {
  @JsonKey(name: "reset_token")
  String? token;

  ResetTokenResponse({this.token});

  factory ResetTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetTokenResponseToJson(this);
}
