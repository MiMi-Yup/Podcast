import 'dart:async';

import '../../models/request/get_location_request.dart';
import '../../models/response/get_location_response.dart';

abstract class LocationRepository{
  FutureOr<GetLocationResponse?> getLocation(GetLocationRequest? request);
}