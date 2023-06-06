import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  @JsonKey(name: "items")
  List<T>? items;
  @JsonKey(name: "count")
  int? count;

  ListResponse({this.items, this.count});

  factory ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ListResponseToJson(this, toJsonT);
}
