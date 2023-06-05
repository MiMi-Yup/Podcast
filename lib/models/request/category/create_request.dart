import 'package:json_annotation/json_annotation.dart';

part 'create_request.g.dart';

@JsonSerializable()
class CategoryCreateRequest {
  @JsonKey(name: "name")
  final String name;

  CategoryCreateRequest({required this.name});

  factory CategoryCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$CategoryCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryCreateRequestToJson(this);
}
