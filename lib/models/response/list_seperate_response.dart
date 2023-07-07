import 'package:json_annotation/json_annotation.dart';

part 'list_seperate_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListSeperateResponse<T> {
  @JsonKey(name: "items")
  List<T>? items;
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "total_results")
  int? totalResults;
  @JsonKey(name: "total_page")
  int? totalPage;
  @JsonKey(name: "page")
  int? page;

  ListSeperateResponse(
      {this.items,
      this.count,
      this.perPage,
      this.totalResults,
      this.totalPage,
      this.page});

  factory ListSeperateResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ListSeperateResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ListSeperateResponseToJson(this, toJsonT);
}
