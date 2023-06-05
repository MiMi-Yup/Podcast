import 'package:join_podcast/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  CategoryResponse({this.id, this.name});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
