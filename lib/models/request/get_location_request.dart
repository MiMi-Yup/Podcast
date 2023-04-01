// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'get_location_request.g.dart';

@JsonSerializable()
class GetLocationRequest {
  @JsonKey(name: 'test')
  String? test;

  GetLocationRequest(this.test);

  factory GetLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLocationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetLocationRequestToJson(this);
}