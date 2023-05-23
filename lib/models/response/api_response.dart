// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: "data")
  T? data;
  @JsonKey(name: "message")
  String? message;

  ApiResponse({this.data, this.message});

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
