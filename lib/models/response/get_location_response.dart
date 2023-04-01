// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../location_model.dart';

part 'get_location_response.g.dart';

@JsonSerializable()
class GetLocationResponse {

  @JsonKey(name: 'data')
  LocationModel? data;

  GetLocationResponse(this.data);

  factory GetLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLocationResponseToJson(this);
}